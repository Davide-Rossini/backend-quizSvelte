<?php

try {
    $dbUsername = 'root';
    $dbPassword = ''; // Assicurati di inserire la password corretta se è impostata
    $dbHost = 'localhost'; // Modifica questo se il database non è in esecuzione sulla stessa macchina
    $dbPort = '4306'; // Porta del database
    $dbName = '5bi_backend_quizmaster'; // Nome del tuo database
    $dbCharset = 'utf8';

    $dbConnection = "mysql:host=$dbHost;port=$dbPort;dbname=$dbName;charset=$dbCharset";

    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Consente di utilizzare il blocco try-catch
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC // Consente di utilizzare gli array associativi, che poi verranno convertiti in JSON
    ];

    $db = new PDO($dbConnection, $dbUsername, $dbPassword, $options);
} catch (PDOException $ex) {
    echo '{"status":0, "message":"Impossibile connettersi al database", "debug":' . __LINE__ . '}';
    exit();
}
?>
