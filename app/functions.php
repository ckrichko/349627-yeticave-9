<?php

//  Функции

require_once('helpers.php');

function format_currency($price)
{
  $roundedPrice = ceil($price);
  $roundedPrice = number_format($roundedPrice, 0, '.', ' ');
  return $roundedPrice;
}

function get_time_formatted_till_end($end_time)
{
  $now = date_create();
  $end_time = date_create($end_time);
  $interval = date_diff($now, $end_time);
  return $interval->format('%H:%I');
}

function is_time_till_end_less_than_one_hour($end_time)
{
  $now = time();
  $end_time = strtotime($end_time);
  if (($end_time - $now) <= 3600) {
    return true;
  }
  return false;
}

function fetch_data($link, string $sql): array
{
  $stmt = db_get_prepare_stmt($link, $sql);

  if (!mysqli_stmt_execute($stmt)) {
    die("Ошибка MySQL: " . mysqli_error($link));
  }
  $result = mysqli_stmt_get_result($stmt);
  if (!$result) {
    die("Ошибка MySQL: " . mysqli_error($link));
  }
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function get_categories($link): array
{
  $sql_get_categories = 'SELECT `name`, `code` FROM categories';
  return fetch_data($link, $sql_get_categories);
}

function get_lots($link): array
{
  $sql_get_active_lots = "SELECT lots.name AS name, categories.name
	AS category, start_price, image_url, end_at FROM lots
	JOIN categories ON categories.id = category_id
	WHERE end_at > NOW() AND winner_id IS NULL
	ORDER BY lots.created_at DESC LIMIT 9";
  return fetch_data($link, $sql_get_active_lots);
}
