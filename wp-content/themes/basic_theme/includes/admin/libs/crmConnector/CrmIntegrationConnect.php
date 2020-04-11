<?php

include(get_template_directory() . '/includes/admin/libs/crmConnector/Auth/AuthenticationContext.php');
include(get_template_directory() . '/includes/admin/libs/crmConnector/Auth/ClientCredential.php');

class CrmIntegrationConnect
{
    private $settings = null;

    function __construct($_settings)
    {
        $this->settings = $_settings;
    }

    private function getAccessToken()
    {
        $authorityUrl = "https://login.microsoftonline.com/" . $this->settings['TenantId'];
        $authCtx = new AuthenticationContext($authorityUrl);
        $clientCredentials = new ClientCredential($this->settings['ClientId'], $this->settings['ClientSecret']);
        $authCtx->acquireTokenForClientCredential($this->settings['Resource'], $clientCredentials);
        return $authCtx->provider->accessToken->access_token;
    }

    public function DoCreateRequest($logicalName, $jObject)
    {
        $jString = json_encode($jObject);
        try {
            $request = new CurlRequest();

            $params = array(
                'url' => $this->settings['Resource'] . "/api/data/v9.1/" . $logicalName . "s",
                'header' => array(
                    "OData-MaxVersion: 4.0",
                    "OData-Version: 4.0",
                    "Accept: application/json",
                    "Content-Type: application/json; charset=UTF-8",
                    'Content-Length: ' . strlen($jString),
                    "Authorization: Bearer " . $this->getAccessToken()
                ),
                'method' => 'POST',
                'post_fields' => $jString,
                'timeout' => 180
            );

            $request->init($params);
            $result = $request->exec();

            if ($result['http_code'] != 204) {
                trigger_error($result['body']);
            } else {
                $ODataEntityId = $result['header']["OData-EntityId"];
                $GuidLen = 36;
                $linkLen = strlen($ODataEntityId);
                return substr($ODataEntityId, $linkLen - $GuidLen - 1, $GuidLen);
            }
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
}

class CurlRequest
{
    private $ch;
    /**
     * Init curl session
     * 
     * $params = array('url' => '',
     *                    'host' => '',
     *                   'header' => '',
     *                   'method' => '',
     *                   'referer' => '',
     *                   'cookie' => '',
     *                   'post_fields' => '',
     *                    ['login' => '',]
     *                    ['password' => '',]      
     *                   'timeout' => 0
     *                   );
     */
    public function init($params)
    {
        $this->ch = curl_init();

        @curl_setopt($this->ch, CURLOPT_RETURNTRANSFER, 1);
        @curl_setopt($this->ch, CURLOPT_VERBOSE, 1);
        @curl_setopt($this->ch, CURLOPT_HEADER, 1);

        if ($params['method'] == "HEAD") @curl_setopt($this->ch, CURLOPT_NOBODY, 1);
        @curl_setopt($this->ch, CURLOPT_FOLLOWLOCATION, 1);
        @curl_setopt($this->ch, CURLOPT_HTTPHEADER, $params['header']);

        if ($params['method'] == "POST") {
            curl_setopt($this->ch, CURLOPT_POST, true);
            curl_setopt($this->ch, CURLOPT_POSTFIELDS, $params['post_fields']);
        }

        if ($params['method'] == "PATCH") {
            curl_setopt($this->ch, CURLOPT_CUSTOMREQUEST, 'PATCH');
            curl_setopt($this->ch, CURLOPT_POSTFIELDS, $params['post_fields']);
        }

        if ($params['method'] == "DELETE") {
            curl_setopt($this->ch, CURLOPT_CUSTOMREQUEST, 'DELETE');
        }

        @curl_setopt($this->ch, CURLOPT_URL, $params['url']);
        @curl_setopt($this->ch, CURLOPT_SSL_VERIFYPEER, 0);
        @curl_setopt($this->ch, CURLOPT_SSL_VERIFYHOST, 0);

        @curl_setopt($this->ch, CURLOPT_TIMEOUT, $params['timeout']);
    }

    /**
     * Make curl request
     *
     * @return array  'header','body','curl_error','http_code','last_url'
     */
    public function exec()
    {
        $response = curl_exec($this->ch);
        $error = curl_error($this->ch);
        $result = array(
            'header' => '',
            'body' => '',
            'curl_error' => '',
            'http_code' => '',
            'last_url' => ''
        );
        if ($error != "") {
            $result['curl_error'] = $error;
            return $result;
        }

        $header_size = curl_getinfo($this->ch, CURLINFO_HEADER_SIZE);

        ///headers
        $headers = [];
        $output = rtrim(substr($response, 0, $header_size));
        $data = explode("\n", $output);
        $headers['status'] = $data[0];
        array_shift($data);

        foreach ($data as $part) {
            $middle = explode(":", $part, 2);
            if (!isset($middle[1])) {
                $middle[1] = null;
            }
            $headers[trim($middle[0])] = trim($middle[1]);
        }
        ///headers

        $result['header'] = $headers;
        $result['body'] = substr($response, $header_size);
        $result['http_code'] = curl_getinfo($this->ch, CURLINFO_HTTP_CODE);
        $result['last_url'] = curl_getinfo($this->ch, CURLINFO_EFFECTIVE_URL);
        return $result;
    }
}
