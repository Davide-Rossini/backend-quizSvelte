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
    
    // Stampa la query SQL prima di eseguirla
    $queryCheckUsernameSql = $queryCheckUsername->queryString;

    // Verifica se l'email esiste
    $queryCheckEmail = $db->prepare('SELECT *, COUNT(*) AS count FROM utente WHERE email = :email');
    $queryCheckEmail->bindValue(':email', $data['username'], PDO::PARAM_STR);
    $queryCheckEmail->execute();
    $resultEmail = $queryCheckEmail->fetch(PDO::FETCH_ASSOC);
    
    // Stampa la query SQL prima di eseguirla
    $queryCheckEmailSql = $queryCheckEmail->queryString;

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

    $query1 = $db->prepare('SELECT id, username, email FROM utente WHERE id = :id');
    $query1->bindValue(':id', $id, PDO::PARAM_INT);
    $query1->execute();
    
    // Stampa la query SQL prima di eseguirla
    $query1Sql = $query1->queryString;

    $result = $query1->fetch(PDO::FETCH_ASSOC);

    // Costruisci l'oggetto JSON di risposta includendo la query SQL
    $response = [
        'status' => 1,
        'data' => $result,
        'sql_query' => $query1Sql // Aggiungi la query SQL nell'oggetto JSON
    ];

    echo json_encode($response);
} catch (PDOException $ex) {
    sendError("Error executing query. SQL: $query1Sql", __LINE__);
}
?>
