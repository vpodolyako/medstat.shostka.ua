<?php

/**
 * $data - array
 * @param $data = ['user_id', 'customer_email', 'event_id', 'order_id', 'type_event (free, paid)', 'price', 'type_ticket', 'formInfo (array)'];
 */
function createEventTicket($data)
{
    global $wpdb;

    $wpdb->insert(
        $wpdb->prefix . 'tickets',
        [
            'user_id'                   =>  $data['user_id'],
            'customer_email'            =>  $data['customer_email'],
            'event_id'                  =>  $data['event_id'],
            'order_id'                  =>  $data['order_id'],
            'client_first_name'         =>  $data['formInfo']['first_name'],
            'client_last_name'          =>  $data['formInfo']['second_name'],
            'client_company'            =>  $data['formInfo']['company'],
            'client_position'           =>  $data['formInfo']['post'],
            'client_phone'              =>  $data['formInfo']['phone'],
            'type_event'                =>  $data['type_event'],
            'type_ticket'               =>  $data['type_ticket'],
            'price'                     =>  $data['price'],
            'status'                    =>  $data['status']
        ],
        ['%d', '%s', '%s', '%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%d', '%s']
    );
}


/**
 * Create order
 * @param $data Array ['user_id', 'customer_email', 'event_id', 'type', 'amount', 'order_status']
 */
function createOrder($data)
{
    global $wpdb;
    $wpdb->show_errors();
    $order = $wpdb->insert(
        'wp_orders',
        [
            'user_id'               => $data['user_id'],
            'customer_email'        => $data['customer_email'],
            'event_id'              => $data['event_id'],
            'type'                  => $data['type'],
            'amount'                => $data['amount'],
            'order_status'          => $data['order_status'] ?: 'new'
        ],
        ['%d', '%s', '%s', '%s', '%d', '%s']
    );
    // get id new record
    return $wpdb->insert_id;
}

function getCountTicket($event_uuid)
{
    global $wpdb;

    $wpdb->show_errors();

    return $wpdb->get_var("SELECT COUNT(*) FROM wp_tickets WHERE event_id = '" . $event_uuid . "'");
}

function getCountAproveTicket($event_uuid)
{
    global $wpdb;

    $wpdb->show_errors();

    return $wpdb->get_var("SELECT COUNT(*) FROM wp_tickets WHERE event_id = '" . $event_uuid . "' AND (status = 'approved' OR status = 'payed')");
}


/**
 * get url for pay
 */
function getUrlPay($Amount, $OrderID)
{
    $PurchaseTime = date("ymdHis");
    $Currency = 980;
    $locale = 'RU';
    $PurchaseDesc = pll__('Registration on event');


    if (get_field('payment_mode', 'option') == 'test') {
        //test
        $MerchantID = 1752401;
        $TerminalID = 'E7880201';
        $actionPath = "https://ecg.test.upc.ua/go/enter";
        $certificate = "/keys/test/1752401.pem";
    } else if (get_field('payment_mode', 'option') == 'prod') {
        // prod
        $MerchantID = 6152621;
        $TerminalID = 'E0153018';
        $actionPath = 'https://secure.upc.ua/go/enter';
        $certificate = "/keys/prod/6152621.pem";
    }


    // certificate
    $fp = fopen(get_template_directory() . $certificate, "r");
    $priv_key = fread($fp, 8192);
    fclose($fp);

    // Signature
    $data = "$MerchantID;$TerminalID;$PurchaseTime;$OrderID;$Currency;$Amount;;";
    $pkeyid = openssl_pkey_get_private($priv_key);
    openssl_sign($data, $signature, $pkeyid);
    $b64sign = base64_encode($signature);
    openssl_free_key($pkeyid);
    $signature = base64_decode($b64sign);
    $signa = urlencode($b64sign);


    return "{$actionPath}?Version=1&MerchantID={$MerchantID}&TerminalID={$TerminalID}&TotalAmount={$Amount}&Currency={$Currency}&locale={$locale}&PurchaseTime={$PurchaseTime}&OrderID={$OrderID}&PurchaseDesc={$PurchaseDesc}&Signature={$signa}";
}
