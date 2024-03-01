<?php
include 'sendError.php';


header("Access-Control-Allow-Origin: *");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    // Gestisci le richieste preflight OPTIONS
    header("Access-Control-Allow-Methods: POST"); // Modifica se necessario
    header("Access-Control-Allow-Headers: Content-Type"); // Aggiungi Content-Type
    exit; // Termina lo script dopo la gestione delle richieste preflight
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    sendError('Invalid request method', __LINE__);
}



$postData = file_get_contents('php://input');
$data = json_decode($postData, true);


require_once(__DIR__ . '/protected/config.php');

try {

    // Se l'username o l'email non sono presenti, invia un messaggio di errore

    if (!($data['idUser'])) sendError('User id missing', __LINE__);
    if (!($data['idQuiz'])) sendError('quiz id missing', __LINE__);
    if (!($data['score'])) sendError('Score missing', __LINE__);

    $query = $db->prepare('INSERT INTO `punteggio` (`id`, `fkUtente`, `fkQuiz`, `dataConseguimento`, `punteggio`) VALUES (NULL, :idUser, :idQuiz, NOW(), :score);');
    $query->bindValue(':idUser', $data['idUser'], PDO::PARAM_STR);
    $query->bindValue(':idQuiz', $data['idQuiz'], PDO::PARAM_STR);
    $query->bindValue(':score', $data['score'], PDO::PARAM_STR);
    $query->execute();

    $result = $query->fetch(PDO::FETCH_ASSOC);


    echo '{"status":1, "message": "Data loaded successfully"}';
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}