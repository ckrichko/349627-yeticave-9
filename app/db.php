<?php

require_once 'config.php';

// Подключение к базе данных

 $link = mysqli_connect( $db['host'], $db['user'], $db['password'], $db['database'] ) or die( mysqli_connect_error() );
 mysqli_set_charset( $link, "utf8" );
