<?php

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