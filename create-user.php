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

$maxCharacters = 20;
$minCharacters = 5;

checkData($maxCharacters, $minCharacters, $data['username'], $data['email'], $data['password']);




require_once(__DIR__ . '/protected/config.php');

try {
    // Verifica se l'username esiste già
    $queryCheckUsername = $db->prepare('SELECT COUNT(*) AS count FROM utente WHERE username = :username');
    $queryCheckUsername->bindValue(':username', $data['username'], PDO::PARAM_STR);
    $queryCheckUsername->execute();
    $resultUsername = $queryCheckUsername->fetch(PDO::FETCH_ASSOC);

    // Verifica se l'email esiste già
    $queryCheckEmail = $db->prepare('SELECT COUNT(*) AS count FROM utente WHERE email = :email');
    $queryCheckEmail->bindValue(':email', $data['email'], PDO::PARAM_STR);
    $queryCheckEmail->execute();
    $resultEmail = $queryCheckEmail->fetch(PDO::FETCH_ASSOC);

    // Se l'username o l'email sono già presenti, invia un messaggio di errore
    if ($resultUsername['count'] > 0) {
        sendError('Username already exists', __LINE__);
    }

    if ($resultEmail['count'] > 0) {
        sendError('Email already exists', __LINE__);
    }

    //creazione utente

    $id = uniqid();
    $hash = password_hash($data['password'], PASSWORD_DEFAULT);

    $query = $db->prepare("INSERT INTO utente (id,username,email,hash) VALUES (:id, :username, :email, :hash)");
    $query->bindValue(':id', $id, PDO::PARAM_STR);
    $query->bindValue(':username', $data['username'], PDO::PARAM_STR);
    $query->bindValue(':email', $data['email'], PDO::PARAM_STR);
    $query->bindValue(':hash', $hash, PDO::PARAM_STR);
    $query->execute();

    // Seleziona i dati dell'utente appena inserito
    $query1 = $db->prepare('SELECT id,username, email FROM utente WHERE id = :id');
    $query1->bindValue(':id', $id, PDO::PARAM_STR);
    $query1->execute();

    $result = $query1->fetch(PDO::FETCH_ASSOC);

    echo '{"status":1, "message":"user created", "data":' . json_encode($result) . '}';
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}


function checkData($maxCharacters, $minCharacters, $username, $email, $password)
{

    // Verifica la presenza di 'username', 'email' e 'password'
    if (!isset($username)) {
        sendError('username missing', __LINE__);
    }
    if (!isset($email)) {
        sendError('email missing', __LINE__);
    }
    if (!isset($password)) {
        sendError('password missing', __LINE__);
    }

    // Verifica la lunghezza di 'username'
    // Verifica la lunghezza di 'username'
    if (!is_string($username)) {
        sendError($username, __LINE__);
    } elseif (strlen($username) < $minCharacters) {
        sendError('username min ' . $minCharacters . ' characters', __LINE__);
    } elseif (strlen($username) > $maxCharacters) {
        sendError('username max ' . $maxCharacters . ' characters', __LINE__);
    }

    // Verifica la lunghezza di 'password'
    if (!is_string($password)) {
        sendError(gettype($password), __LINE__);
    } elseif (strlen($password) < $minCharacters) {
        sendError('password min ' . $minCharacters . ' characters', __LINE__);
    } elseif (strlen($password) > $maxCharacters) {
        sendError('password max ' . $maxCharacters . ' characters', __LINE__);
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        sendError('Email not valid', __LINE__);
    }
}
