<?php

// style and scripts
include(get_template_directory() . '/includes/admin/front/enqueue_admin.php');
//admin andpoint
include(get_template_directory() . '/includes/admin/endpoints.php');
//function
include(get_template_directory() . '/includes/admin/additional_func.php');
include(get_template_directory() . '/includes/admin/integrationFunc.php');
//crm
include(get_template_directory() . '/includes/admin/libs/crmConnector/CrmIntegrationDataAdapter.php');
include(get_template_directory() . '/includes/admin/crm_ednpoints.php');
include(get_template_directory() . '/includes/admin/crmConnector.php');
include(get_template_directory() . '/includes/admin/libs/phpqrcode/qrlib.php');
