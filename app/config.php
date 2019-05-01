<?php
// Установка временной зоны и локали для Минск

date_default_timezone_set('Europe/Minsk');
setlocale(LC_ALL, 'ru_RU');

$config = [
  'sitename' => 'Yeti Cave',
  'enable' => true
];

$db = [
  "host" => "localhost",
  "user" => "root",
  "password" => "",
  "database" => "yeticave"
];
