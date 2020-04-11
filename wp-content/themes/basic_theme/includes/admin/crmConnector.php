<?php

function createNewUser()
{

    global $userId, $userInfo;
    $crmConnect = new CrmIntegrationDataAdapter();

    $newRequest = [
        'accountid'                 => get_field('user_company', 'user_' .  $userId),
        'acc_salutationnew'         => get_field('appeal', 'user_' .  $userId),
        'firstname'                 => get_field('name', 'user_' .  $userId),
        'lastname'                  => get_field('last_name', 'user_' .  $userId),
        'mobilephone'               => get_field('phone', 'user_' .  $userId),
        'emailaddress1'             => $userInfo->data->user_email,
        'jobtitle'                  => get_field('position', 'user_' .  $userId),
        'birthdate'                 => get_field('birth_date', 'user_' .  $userId),
        'contactid'                 => getGUID()
    ];

    $newEventId = $crmConnect->CreateEvent("NewEmployee", $newRequest);
}
add_action('user_register', 'createNewUser');


function updateProfile()
{
    global $userId, $userInfo;
    $crmConnect = new CrmIntegrationDataAdapter();

    $newRequest = [
        'acc_salutationnew' => '',
        'firstname' => $_POST['Name_profile'],
        'lastname' => $_POST['Family_profile'],
        'emailaddress1' => $userInfo->data->user_email,
        'mobilephone' => $_POST['Phone_profile'],
        'birthdate' => $_POST['Date_profile'],
        'jobtitle' => $_POST['Position_profile'],
        'Base64' => '',
        'contactid' => get_field('guid', 'user_' .  $userId),
    ];

    $newEventId = $crmConnect->CreateEvent("UpdateEmployee", $newRequest);

    $resp = array(
        'success' =>  true,
        'user' => $userInfo->ID,
        'request_id' => $newEventId
    );

    wp_send_json($resp);
}
add_action("wp_ajax_updateProfile", "updateProfile");


function updateUserSubscribe()
{
    global $userInfo, $userId;
    $crmConnect = new CrmIntegrationDataAdapter();

    $newRequest = [
        'acc_epubltypeid' => $_POST['subscribes'],
        'contactid' => get_field('guid', 'user_' .  $userId),
        'accountid' => get_field('user_company', 'user_' .  $userId),
        'acc_subscribed' => 'yes',
    ];

    update_field('subscribes', $_POST['subscribes'], 'user_' .  $userId);

    $newEventId = $crmConnect->CreateEvent("UpdateEPublSubscription", $newRequest);

    $resp = array(
        'success' =>  true,
        'request_id' => $newEventId,
        'requsetData' => $newRequest,
    );

    wp_send_json($resp);
}
add_action("wp_ajax_updateUserSubscribe", "updateUserSubscribe");

function become_member_save()
{
    global $userInfo, $userId;
    $crmConnect = new CrmIntegrationDataAdapter();
    $userId = get_current_user_id();

    $newRequest = $_POST;

    $newEventId = $crmConnect->CreateEvent("NewCompany", $newRequest);

    $resp = array(
        'done' =>  true,
        'request_id' => $newEventId,
        'requsetData' => $newRequest,
    );

    wp_send_json($resp);
}
add_action("wp_ajax_become_member_save", "become_member_save");
