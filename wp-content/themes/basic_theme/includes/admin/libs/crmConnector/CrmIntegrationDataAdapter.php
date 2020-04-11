<?php

include 'CrmIntegrationConnect.php';

class CrmIntegrationDataAdapter
{
    private $settings = array(
        'TenantId' => "ff63feb1-40a8-4951-b8cd-2a8692fa3f78",
        'ClientId' => "e4920a35-958c-4951-a152-3e21e8ea2697",
        'ClientSecret' => "5+4wkJr7DpbB_1saAz.B-Mjck11Mrrju",
        'Resource' => "https://acc-ua-sandbox.crm4.dynamics.com"
    );

    private $crmIntegration = "51EEA81A-24A7-E911-A96A-000D3A441BB5";

    function __construct()
    {
        $this->crmConnect = new CrmIntegrationConnect($this->settings);
    }

    function CreateEvent($eventName, $newRequest)
    {
        try {

            $newEvent = array(
                'new_integrationid@odata.bind' => "/new_integrations(" . $this->crmIntegration . ")",
                'new_name' => $eventName,
                'new_data' => json_encode($newRequest, JSON_UNESCAPED_UNICODE)
            );
            return $this->crmConnect->DoCreateRequest("new_integration_event", $newEvent);
        } catch (Exception $e) {
            echo '{"error":"' . $e . '"}';
        }
    }
}