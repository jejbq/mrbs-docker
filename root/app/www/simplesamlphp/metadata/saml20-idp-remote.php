<?php

require '/config/www/config.inc.php';

/**
 * SAML 2.0 remote IdP metadata for SimpleSAMLphp.
 *
 * Remember to remove the IdPs you don't use from this file.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-idp-remote
 */
$metadata[$auth['saml']['ssp_idp']] = [
    'SingleSignOnService' => [
        [
            'Location' => $auth['saml']['ssp_single_sign_on_service'],
            'Binding'  => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
        ],
    ],
    'SingleLogoutService' => [
        [
            'Location'         => $auth['saml']['ssp_single_logout_service'],
            'Binding'          => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
        ],
    ],
    'certData' => $auth['saml']['ssp_cert_data'],
];