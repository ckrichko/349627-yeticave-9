<?php

//  Функции

require_once('helpers.php'); //  Подключает дополнительные функции

// Форматирует цену лота
function formatCurrency($price)
{
  $roundedPrice = ceil($price);
  $roundedPrice = number_format($roundedPrice, 0, '.', ' ');
  return $roundedPrice;
}

function getTimeFormattedTillEnd($end_time)
{
  $now = date_create();
  $end_time = date_create($end_time);
  $interval = date_diff($now, $end_time);
  return $interval->format('%H:%I');
}

function isTimeTillEndLessThanOneHour($end_time)
{
  $now = time();
  $end_time = strtotime($end_time);
  if (($end_time - $now) <= 3600) {
    return true;
  }
  return false;
}

// Получает список категорий и классов фоновых изображений

function db_get_categories($link): array
{
  $categories = [];
  $sql = 'SELECT * FROM categories';
  $stmt = mysqli_prepare($link, $sql);
  mysqli_stmt_execute($stmt);
  $result = mysqli_stmt_get_result($stmt);

  if ($result) {
    $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
  }
  return $categories;
}

// Получает список лотов

function db_get_lots($link)
{
  $sql_lots = "SELECT lots.name AS name, categories.name
		AS category, start_price, image_url, end_at FROM lots
		JOIN categories ON categories.id = category_id
		WHERE end_at > NOW() AND winner_id IS NULL
		ORDER BY lots.created_at DESC LIMIT 9";

  $stmt = mysqli_prepare($link, $sql_lots);
  mysqli_stmt_execute($stmt);
  $result = mysqli_stmt_get_result($stmt);

  if ($result) {
    $lots = mysqli_fetch_all($result, MYSQLI_ASSOC);
  }
  return $lots;
}
