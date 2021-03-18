<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'user_wordpress');
define('DB_PASSWORD', 'pass_wordpress');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix  = 'wp_';

define('AUTH_KEY',         '_;4Q.UW$qW*-6.k{gDfcJ?9()Z>`Lu||Ho+Tz+pgPaqvr1FN{APJ,o>3I7{NeF*y');
define('SECURE_AUTH_KEY',  '@FwPuRq6C$H/x?=:;-#LM -n~entQ27b/c:{O:)n*;X]13JR!gni&Z3yp`+.`{|V');
define('LOGGED_IN_KEY',    'TK5}-8SKHf_3Ugm0.F]f/{5lc}X#CqSe+.-?v;/(8TR6+R,*c2*sp&fkR3JQ#|fB');
define('NONCE_KEY',        'J0ZY7Jp7dBjC/RE+!Ih?R.>;mEL? u%EpcaE(+EMq@-jU^;+s]-TzV4*{h3mj=-l');
define('AUTH_SALT',        '%]a2DpT;bPWzGe s?A/30U>!y-%4Bi[h]>c(C#7#c*+1|`zx3*OCVcAtI+l{0uZ3');
define('SECURE_AUTH_SALT', 's9`OvcJc8p1D>4(J^&;zMP}UP$Nrx-i:I[:+oB?#P(CP./]!8#Z`-|<)tJN0$w|2');
define('LOGGED_IN_SALT',   'A:XA=m[NU=1;H|2NLlsGmpvAWvlp`lz14a1MlNc8Y{6KF_|dGbg`K${eS]0TSM~7');
define('NONCE_SALT',       'kjylw),b+b fa$#ouRI4Yip<La[2,1a0/dIZmxXk!w@6WiwlTKEp)QSPLR|.ItMZ');

define('FS_METHOD','direct');
define('WP_AUTO_UPDATE_CORE', true);
define('AUTOMATIC_UPDATER_DISABLED', false);
define('WP_DEBUG', true);
define('WP_DEBUG_DISPLAY', true);
define('WP_POST_REVISIONS', 1);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

//require_once(ABSPATH . 'wp-config-extend.php');
require_once(ABSPATH . 'wp-settings.php');

@ini_set( 'upload_max_size' , '64M' );
@ini_set( 'post_max_size', '64M');
@ini_set( 'max_execution_time', '300' );