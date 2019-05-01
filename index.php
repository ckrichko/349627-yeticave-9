<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once('app/functions.php');
require_once 'app/db.php';

$is_auth = rand(0, 1);

$user_name = 'Константин';

//  Выполнение запросов в базу данных
$categories = get_categories($link);

$lots = get_lots($link);


$content = include_template('main.php',
  ['categories' => $categories, 'lots' => $lots]);

$layout_content = include_template('layout.php', [
  'title' => 'Главная',
  'is_auth' => $is_auth,
  'user_name' => $user_name,
  'content' => $content,
  'categories' => $categories,
  'sitename' => 'Yeti Cave'
]);

print($layout_content);
