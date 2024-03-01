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

// Ora puoi accedere ai dati come $data['username'] e $data['password']




require_once(__DIR__ . '/protected/config.php');

try {
    // Verifica se l'username esiste
    $queryCheckUsername = $db->prepare('SELECT *, COUNT(*) AS count FROM utente WHERE username = :username');
    $queryCheckUsername->bindValue(':username', $data['username'], PDO::PARAM_STR);
    $queryCheckUsername->execute();
    $resultUsername = $queryCheckUsername->fetch(PDO::FETCH_ASSOC);

    // Verifica se l'email esiste
    $queryCheckEmail = $db->prepare('SELECT *, COUNT(*) AS count FROM utente WHERE email = :email');
    $queryCheckEmail->bindValue(':email', $data['username'], PDO::PARAM_STR);
    $queryCheckEmail->execute();
    $resultEmail = $queryCheckEmail->fetch(PDO::FETCH_ASSOC);

    // Se l'username o l'email non sono presenti, invia un messaggio di errore

    if ($resultUsername['count'] > 0) {
        if (password_verify($data['password'], $resultUsername['hash'])) {
            $id = $resultUsername['id'];
        } else {
            sendError('Wrong password', __LINE__);
        }
    } else if ($resultEmail['count'] > 0) {
        if (password_verify($data['password'], $resultEmail['hash'])) {
            $id = $resultEmail['id'];
        } else {
            sendError('Wrong password', __LINE__);
        }
    } else {
        sendError("User doesn't exist", __LINE__);
    }

    $query1 = $db->prepare('SELECT id,username, email FROM utente WHERE id = :id');
    $query1->bindValue(':id', $id, PDO::PARAM_STR);
    $query1->execute();

    $result = $query1->fetch(PDO::FETCH_ASSOC);


    echo '{"status":1, "data":' . json_encode($result) . '}';
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}
