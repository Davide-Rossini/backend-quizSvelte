<?php
include 'sendError.php';

header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
require_once(__DIR__ . '/protected/config.php');
try {
    $query = $db->prepare('SELECT * from quiz');
    $query->execute();
    $rows = $query->fetchAll();
    echo '{"status":1, "data":' . json_encode($rows) . '}';
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}



