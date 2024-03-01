<?php
include 'sendError.php';


header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');

if (!isset($_GET['quizId'])) {
    sendError('quizId missing', __LINE__);
}
if (!ctype_digit($_GET['quizId'])) {
    sendError('quizId not valquizId', __LINE__);
}

require_once(__DIR__ . '/protected/config.php');

try {
    $numeroDomande = 5;
    $query = $db->prepare("SELECT q.titolo,u.username,p.punteggio
    FROM punteggio p
    INNER JOIN quiz q on p.fkQuiz=q.id
    INNER JOIN utente u on p.fkUtente=u.id
    where q.id=:id
    ORDER BY p.punteggio DESC
    LIMIT 5");
    $query->bindValue(':id', $_GET['quizId'], PDO::PARAM_INT);
    $query->execute();
    $result = $query->fetchAll(PDO::FETCH_ASSOC);

    if (count($result) == 0) {
        sendError('Quiz not found', __LINE__);
        exit();
    }

    // Creazione dell'array per l'output JSON

    echo '{"status":1, "data":' . json_encode($result) . '}';
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}