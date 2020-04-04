<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'medstat.shostka' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'root' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', '' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'localhost' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'ecA.=PGC/.s}KXPU%BV[>S&SWT3Xa^R{FJpU}rkK{yT }|]?NzoXh!+oq-+}~dAx' );
define( 'SECURE_AUTH_KEY',  'fz9^HWbs66iS`cII]aP09`Wq4:X.bve|WC%j<dlh<w=QzRQ5 dL%%?VE^u>4O$AK' );
define( 'LOGGED_IN_KEY',    'N}zfG/>f>0YAH{u3>*Y>t R6G[$&m7XCfQjMnOuMP<Aw|C$Tv#8m72@_X2,|O3+-' );
define( 'NONCE_KEY',        '8m!,aBgZ.R+p6E.XK&hog5u;<-/OY*Nh.,XVFBE}@7KuYFRwkK1Xl,Ns+H=8K5a0' );
define( 'AUTH_SALT',        '~|~(0F8U$u@.<,d{@~wcPE$X)JG!bnuQiN.8I{gbd%h| iW-69db(DVI=%XFag]1' );
define( 'SECURE_AUTH_SALT', '~L48z4bOd|jZ-h_ RAF!l2$C3GVY7.0Ui0NUI),%Wd],X<~49Oneb4_P@>Af_nV-' );
define( 'LOGGED_IN_SALT',   'H#fi/JE4%hMLRj4F{%o0a2h84yF#V!LF_WmaMq*=I`OqZ&|,3m!43N;6]v|{qluz' );
define( 'NONCE_SALT',       '^`{>^2cTOT|KSMt*$[ZoD.x(w_`Wei0m5TtnEviUIkq+U@!=IoL6*Mo`wX)oCb`7' );

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once( ABSPATH . 'wp-settings.php' );
