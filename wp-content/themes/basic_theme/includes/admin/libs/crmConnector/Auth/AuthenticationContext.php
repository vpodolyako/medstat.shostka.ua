<?php

include 'IAuthenticationContext.php';
include 'OAuthTokenProvider.php';

/**
 * Authentication context for Azure AD/Office 365.
 *
 */
class AuthenticationContext implements IAuthenticationContext
{
    /**
     * @var BaseTokenProvider
     */
    public $provider;

    /**
     * @var string
     */
    private $authorityUrl;

    /**
     * AuthenticationContext constructor.
     * @param string $authorityUrl
     */
    public function __construct($authorityUrl)
    {
        $this->authorityUrl = $authorityUrl;
    }

    /**
     * Gets URL of the authorize endpoint including the query parameters.
     * @param string $authorizeUrl
     * @param string $clientId
     * @param string $redirectUrl
     * @param array $parameters
     * @return string
     */
    public function getAuthorizationRequestUrl($authorizeUrl, $clientId, $redirectUrl, $parameters = [])
    {
        $parameters = array_merge($parameters, array(
            'response_type' => 'code',
            'client_id' => $clientId,
            //'nonce' => $stateGuid->toString(),
            'redirect_uri' => $redirectUrl,
            //'post_logout_redirect_uri' => $redirectUrl,
            //'response_mode' => 'form_post',
            //'scope' => 'openid+profile'
        ));
        return $authorizeUrl . "?" . http_build_query($parameters);
    }


    /**
     * Acquire security token from STS
     * @param string $username
     * @param string $password
     * @throws \Exception
     */
    public function acquireTokenForUser($username, $password)
    {
        $this->provider = new SamlTokenProvider($this->authorityUrl);
        $parameters = array(
            'username' => $username,
            'password' => $password
        );
        $this->provider->acquireToken($parameters);
    }

    /**
     * @param string $resource
     * @param ClientCredential $clientCredentials
     * @throws \Exception
     */
    public function acquireTokenForClientCredential($resource, $clientCredentials)
    {
        $this->provider = new OAuthTokenProvider($this->authorityUrl);
        $parameters = array(
            'grant_type' => 'client_credentials',
            'client_id' => $clientCredentials->ClientId,
            'client_secret' => $clientCredentials->ClientSecret,
            #'scope' => $resource,
            'scope' => "https://outlook.office365.com/mail.read https://outlook.office365.com/mail.send",
            'resource' => $resource
        );
        $this->provider->acquireToken($parameters);
    }

    /**
     * @param $resource
     * @param $clientId
     * @param $clientSecret
     * @param $refreshToken
     * @param $redirectUri
     * @throws \Exception
     */
    public function exchangeRefreshToken($resource, $clientId, $clientSecret, $refreshToken, $redirectUri)
    {
        $this->provider = new OAuthTokenProvider($this->authorityUrl);
        $parameters = array(
            'grant_type' => 'refresh_token',
            'client_id' => $clientId,
            'client_secret' => $clientSecret,
            'resource' => $resource,
            'redirect_uri' => $redirectUri,
            'refresh_token' => $refreshToken
        );
        $this->provider->acquireToken($parameters);
    }

    /**
     * @param string $resource
     * @param ClientCredential $clientCredentials
     * @param UserCredentials $userCredentials
     * @throws \Exception
     * Resource owner password credential (ROPC) grant (https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth-ropc)
     */
    public function acquireTokenForPassword($resource, $clientCredentials, $userCredentials)
    {
        $this->provider = new OAuthTokenProvider($this->authorityUrl);
        $parameters = array(
            'grant_type' => 'password',
            'client_id' => $clientCredentials->ClientId,
            'client_secret' => $clientCredentials->ClientSecret,
            'username' => $userCredentials->Username,
            'password' => $userCredentials->Password,
            'scope' => 'user.read openid',
            'resource' => $resource
        );
        $this->provider->acquireToken($parameters);
    }

    /**
     * @param string $uri
     * @param string $resource
     * @param string $clientId
     * @param string $clientSecret
     * @param string $code
     * @param string $redirectUrl
     * @throws \Exception
     */
    public function acquireTokenByAuthorizationCode($uri,$resource, $clientId, $clientSecret, $code, $redirectUrl)
    {
        $this->provider = new OAuthTokenProvider($uri);
        $parameters = array(
            'grant_type' => 'authorization_code',
            'client_id' => $clientId,
            'client_secret' => $clientSecret,
            'code' => $code,
            'resource' => $resource,
            "redirect_uri" => $redirectUrl
        );
        $this->provider->acquireToken($parameters);
    }

    /**
     * @param RequestOptions $options
     * @throws \Exception
     */
    public function authenticateRequest(RequestOptions $options)
    {
        if ($this->provider instanceof SamlTokenProvider) {
            $options->addCustomHeader('Cookie', $this->provider->getAuthenticationCookie());
        } elseif ($this->provider instanceof ACSTokenProvider || $this->provider instanceof OAuthTokenProvider) {
            $options->addCustomHeader('Authorization', $this->provider->getAuthorizationHeader());
        } else {
            throw new \Exception("Unknown authentication provider");
        }
    }

    /**
     * @return null|\stdClass
     */
    public function getAccessToken()
    {
        if ($this->provider instanceof OAuthTokenProvider) {
            return $this->provider->getAccessToken();
        }
        return null;
    }

    /**
     * @param $accessToken
     */
    public function setAccessToken($accessToken)
    {
        $this->provider = new OAuthTokenProvider($this->authorityUrl);
        $this->provider->setAccessToken($accessToken);
    }
}
