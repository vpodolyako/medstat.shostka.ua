<?php
function ActivateEmployee()
{
    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    $check = checkrequiredField($_POST, ['contactid', 'statecode', 'acc_roleid']);
    if ($check) {
        wp_send_json($check);
    }

    $user = getUserByUUID($_POST['contactid']);

    if (!$user) {
        $response = [
            'status'    => 'error',
            'message'   => 'User not found'
        ];
        wp_send_json($response);
    }

    //update roles
    $user = setUserRoles($user, $_POST['acc_roleid']);

    //update status
    update_field('field_5dc9a80c4458a', $_POST['statecode'], 'user_' . $user->ID);

    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_ActivateEmployee', 'ActivateEmployee');

function DeactivateEmployee()
{
    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    $check = checkrequiredField($_POST, ['contactid', 'statecode']);
    if ($check) {
        wp_send_json($check);
    }

    $user = getUserByUUID($_POST['contactid']);

    // update status
    update_field('field_5dc9a80c4458a', $_POST['statecode'], 'user_' . $user->ID);

    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_DeactivateEmployee', 'DeactivateEmployee');


function UpdateEmployee()
{
    $fields = [
        'accountid'             => 'field_5dd67c98ef90a',
        'acc_salutationnew'     => 'field_5dd66e8707b89',
        'birthdate'             => 'field_5dc5a2c280c5c',
        'jobtitle'              => 'field_5dc5a30680c5d',
        'mobilephone'           => 'field_5dc5a2b780c5b',
        'emailaddress1'         => 'field_5dfa47dde7101',
        'statecode'             => 'field_5dc9a80c4458a',
        'avatar'                => 'field_5dfba765558f7'
    ];

    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    //TODO accountid - need add this after company done
    $check = checkrequiredField(
        $_POST,
        ['accountid', 'acc_salutationnew', 'firstname', 'lastname', 'mobilephone', 'emailaddress1', 'jobtitle', 'birthdate', 'contactid', 'statecode', 'acc_roleid', 'Base64']
    );
    if ($check) {
        wp_send_json($check);
    }

    $user = getUserByUUID($_POST['contactid']);

    if (!$user) {
        $response = [
            'status'    => 'error',
            'message'   => 'User not found'
        ];
        wp_send_json($response);
    }

    $company = getCompanyByUUID($_POST['accountid']);
    $image_id = saveBase64Image($_POST['Base64']);

    if (!$user) {
        $response = [
            'status'    => 'error',
            'message'   => 'Company not found'
        ];
        wp_send_json($response);
    }

    $user_acf_id = 'user_' . $user->ID;

    //update first and last name
    update_user_meta($user->ID, 'first_name', $_POST['firstname']);
    update_user_meta($user->ID, 'last_name', $_POST['lastname']);

    //TODO need update company
    update_field($fields['accountid'], [$company], $user_acf_id);

    // update fields
    update_field($fields['acc_salutationnew'], $_POST['acc_salutationnew'], $user_acf_id);
    update_field($fields['birthdate'], $_POST['birthdate'], $user_acf_id);
    update_field($fields['jobtitle'], $_POST['jobtitle'], $user_acf_id);
    update_field($fields['mobilephone'], $_POST['mobilephone'], $user_acf_id);
    update_field($fields['emailaddress1'], $_POST['emailaddress1'], $user_acf_id);
    update_field($fields['statecode'], $_POST['statecode'], $user_acf_id);
    update_field($fields['avatar'], (int) $image_id, $user_acf_id);

    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_UpdateEmployee', 'UpdateEmployee');

function Campaigns()
{
    $fields = [
        'statuscode'                => 'field_5dfa677d72c84',
        'msa_startdatetime'         => 'field_5dfa67dd72c85',
        'msa_enddatetime'           => 'field_5dfa67f072c86',
        'msa_maximumeventcapacity'  => 'field_5dfa680b72c87',
        'msa_primaryvenueid'        => 'field_5db0096e34b81',
        'campaignid'                => 'field_5df1133c1635d'
    ];

    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    $check = checkrequiredField(
        $_POST,
        ['name', 'statuscode', 'acc_eventcategoryid', 'msa_startdatetime', 'msa_enddatetime', 'msa_maximumeventcapacity', 'msa_primaryvenueid', 'msa_eventdetails', 'campaignid']
    );
    if ($check) {
        wp_send_json($check);
    }

    $post_data = array(
        'post_title'    => $_POST['name'],
        'post_content'  => $_POST['msa_eventdetails'],
        'post_status'   => 'draft',
        'author'        => 1,
        'post_type'     => 'events'
    );

    // Вставляем запись в базу данных
    $post_en_id = wp_insert_post($post_data);
    $post_ua_id = wp_insert_post($post_data);

    update_field($fields['statuscode'], $_POST['statuscode'], $post_en_id);
    update_field($fields['msa_startdatetime'], $_POST['msa_startdatetime'], $post_en_id);
    update_field($fields['msa_enddatetime'], $_POST['msa_enddatetime'], $post_en_id);
    update_field($fields['msa_maximumeventcapacity'], $_POST['msa_maximumeventcapacity'], $post_en_id);
    update_field($fields['msa_primaryvenueid'], $_POST['msa_primaryvenueid'], $post_en_id);
    update_field($fields['campaignid'], $_POST['campaignid'], $post_en_id);

    update_field($fields['statuscode'], $_POST['statuscode'], $post_ua_id);
    update_field($fields['msa_startdatetime'], $_POST['msa_startdatetime'], $post_ua_id);
    update_field($fields['msa_enddatetime'], $_POST['msa_enddatetime'], $post_ua_id);
    update_field($fields['msa_maximumeventcapacity'], $_POST['msa_maximumeventcapacity'], $post_ua_id);
    update_field($fields['msa_primaryvenueid'], $_POST['msa_primaryvenueid'], $post_ua_id);
    update_field($fields['campaignid'], $_POST['campaignid'], $post_ua_id);

    pll_set_post_language($post_en_id, 'en');
    pll_set_post_language($post_ua_id, 'ua');

    pll_save_post_translations([
        'en'    => $post_en_id,
        'ua'    => $post_ua_id
    ]);

    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_Campaigns', 'Campaigns');

function UpdateEPublicationType()
{
    $fields = [
        'type'         => 'field_5dfb598495f71',
        'guid'         => 'field_5dfb5a4195f72',
    ];

    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    $check = checkrequiredField($_POST, ['acc_epublication', 'acc_type', 'acc_epubltypeid']);
    if ($check) {
        wp_send_json($check);
    }

    $post_data = array(
        'post_title'    => $_POST['acc_epublication'],
        'post_content'  => '',
        'post_status'   => 'publish',
        'author'        => 1,
        'post_type'     => 'e_publication_type'
    );

    //update or insert
    if ($post_id = getEPublication($_POST['acc_epubltypeid'])) {
        //echo $post_id;
        $post_data['ID']    = $post_id;
        wp_update_post($post_data, true);
    } else {
        $post_id = wp_insert_post($post_data);
        update_field($fields['guid'], $_POST['acc_epubltypeid'], $post_id);
    }

    update_field($fields['type'], $_POST['acc_type'], $post_id);


    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_UpdateEPublicationType', 'UpdateEPublicationType');

function UpdateEPublSubscription()
{
    $fields = [
        'e-publications'         => 'field_5dfb6107a29a2'
    ];

    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    $check = checkrequiredField($_POST, ['acc_epubltypeid', 'contactid', 'accountid', 'acc_subscribed']);
    if ($check) {
        wp_send_json($check);
    }

    $user = getUserByUUID($_POST['contactid']);

    if (!$user) {
        $response = [
            'status'    => 'error',
            'message'   => 'User not found'
        ];
        wp_send_json($response);
    }

    $list_subscriptions = get_field('e-publications', 'user_' . $user->ID);

    $id_subsc = getEPublication($_POST['acc_epubltypeid']);
    $result = array_search($id_subsc, $list_subscriptions);

    if ($_POST['acc_subscribed'] == 'yes') {
        $result = array_search($id_subsc, $list_subscriptions);
        if ($result === FALSE) {
            $list_subscriptions[] = $id_subsc;
        }
    } else if ($_POST['acc_subscribed'] == 'no') {
        if ($result !== FALSE) {
            unset($list_subscriptions[$result]);
        }
    }

    update_field($fields['e-publications'], $list_subscriptions, 'user_' . $user->ID);

    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_UpdateEPublSubscription', 'UpdateEPublSubscription');

function UpdateCompany()
{
    $fields = [
        'emailaddress1'             => 'field_5d9f044e22e77',
        'telephone1'                => 'field_5d9f044022e76',
        'acc_addressdescription'    => 'field_5d9f042922e75',
        'fax'                       => 'field_5dfb877c98b9b',
        'websiteurl'                => 'field_5d9f045f22e78',
        'contactid'                 => 'field_5d9f007720077',
        'guid'                      => 'field_5dfb875b98b9a'
    ];

    if (!checkKeyIntegration()) {
        $response = [
            'status'    => 'error',
            'message'   => 'Wrong key'
        ];
        wp_send_json($response);
    }

    $check = checkrequiredField(
        $_POST,
        ['accountid', 'updateapproved', 'name', 'acc_addressdescription', 'emailaddress1', 'telephone1', 'Base64', 'acc_englishdescription', 'fax', 'websiteurl', 'contactid']
    );
    if ($check) {
        wp_send_json($check);
    }

    $company = getCompanyByUUID($_POST['accountid']);

    $user = getUserByUUID($_POST['contactid']);

    if (!$user) {
        $response = [
            'status'    => 'error',
            'message'   => 'User not found'
        ];
        wp_send_json($response);
    }

    $post_data = array(
        'post_title'    => $_POST['name'],
        'post_status'   => 'draft',
        'author'        => 1,
        'post_type'     => 'companies'
    );
    $image_id = saveBase64Image($_POST['Base64']);

    //update or insert
    if ($company) {
        $current_lang = pll_get_post_language($company);
        if ($current_lang == 'en') {
            $post_en_id = $company;
            $post_ua_id = pll_get_post($company, 'ua');
        } else if ($current_lang == 'ua') {
            $post_ua_id = $company;
            $post_en_id = pll_get_post($company, 'en');
        }

        $post_data['ID']    = $post_ua_id;

        wp_update_post($post_data, true);

        $post_data['ID']    = $post_en_id;
        $post_data['post_content'] = $_POST['acc_addressdescription'];
    } else {
        $post_ua_id = wp_insert_post($post_data);
        $post_data['post_content'] = $_POST['acc_addressdescription'];
        $post_en_id = wp_insert_post($post_data);


        pll_set_post_language($post_en_id, 'en');
        pll_set_post_language($post_ua_id, 'ua');

        pll_save_post_translations([
            'en'    => $post_en_id,
            'ua'    => $post_ua_id
        ]);

        update_field($fields['guid'], $_POST['accountid'], $post_en_id);
        update_field($fields['guid'], $_POST['accountid'], $post_ua_id);
    }

    update_field($fields['emailaddress1'], $_POST['emailaddress1'], $post_en_id);
    update_field($fields['telephone1'], $_POST['telephone1'], $post_en_id);
    update_field($fields['acc_addressdescription'], $_POST['acc_addressdescription'], $post_en_id);
    update_field($fields['fax'], $_POST['fax'], $post_en_id);
    update_field($fields['websiteurl'], $_POST['websiteurl'], $post_en_id);
    update_field($fields['contactid'], $user->ID, $post_en_id);

    update_field($fields['emailaddress1'], $_POST['emailaddress1'], $post_ua_id);
    update_field($fields['telephone1'], $_POST['telephone1'], $post_ua_id);
    update_field($fields['acc_addressdescription'], $_POST['acc_addressdescription'], $post_ua_id);
    update_field($fields['fax'], $_POST['fax'], $post_ua_id);
    update_field($fields['websiteurl'], $_POST['websiteurl'], $post_ua_id);
    update_field($fields['contactid'], $user->ID, $post_ua_id);

    if ($image_id) {
        set_post_thumbnail($post_ua_id, $image_id);
        set_post_thumbnail($post_en_id, $image_id);
    }

    wp_send_json([
        'status'        => 'success'
    ]);
}
add_action('wp_ajax_nopriv_UpdateCompany', 'UpdateCompany');
