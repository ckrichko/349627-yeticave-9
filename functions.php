<?php

function formatCurrency($price)
{
  $roundedPrice = ceil($price);
  $roundedPrice = number_format($roundedPrice, 0, '.', ' ');
  return $roundedPrice;
}
