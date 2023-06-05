<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'instanceid' => 'ocvc4q2htemf',
  'passwordsalt' => 'stdJZMx4C5hz85Kqt8XdZIzx8kVOHI',
  'secret' => 'II1BBgzlx70WUYCapAt/m/Bt1ZEk/n11n0DVq3zynyU8F/bU',
  'trusted_domains' => 
  array (
    0 => '172.16.0.7:5678',
    1 => '172.16.0.7:8080',
    2 => 's-mess',
    3 => 's-mess.gsb.lan',
    4 => 'localhost:8080',
    5 => 's-nxec.gsb.lan',
  ),
  'trusted_proxies' => ['172.16.0.7'],
  'overwriteprotocol' => 'http',
  'overwritehost' => '172.16.0.7:8080',
  'proxy' => '172.16.0.7:8080',
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '20.0.6.1',
  'overwrite.cli.url' => 'http://172.16.0.7:5678',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'root',
  'installed' => true,
);
