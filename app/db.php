<?php

date_default_timezone_set('Europe/Minsk');
setlocale(LC_ALL, 'ru_RU');

$db = [
  "host" => "localhost",
  "user" => "root",
  "password" => "",
  "database" => "yeticave"
];

 $link = mysqli_connect( $db['host'], $db['user'], $db['password'], $db['database'] ) or die( mysqli_connect_error() );
 mysqli_set_charset( $link, "utf8" );
