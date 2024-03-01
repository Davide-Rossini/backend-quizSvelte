<?php
include 'sendError.php';

header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
require_once(__DIR__ . '/protected/config.php');
try {
    
    echo '{"status":1, "data":"ciao"}';
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}



