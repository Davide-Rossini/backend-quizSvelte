<?php


try {
    $dbUsername = 'root';
    $dbPassword = '';
    $dbConnection = 'mysql:host=localhost; dbname=5bi_backend_quizmaster; charset=utf8';
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, //allows to use try catch
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC //allows to use associatives arrays then converted to JSON
        //json_encode [{},{}]
    ];

    $db = new PDO($dbConnection, $dbUsername, $dbPassword, $options);
} catch (PDOException $ex) {
    echo '{"status":0, "message":"cannot connect to the db", "debug":' . __LINE__ . '}';
    exit();
}
