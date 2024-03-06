<?php
include 'sendError.php';

header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
require_once(__DIR__ . '/protected/config.php');
try {


    /* $queryMaxScore = $db->prepare('SELECT MAX(punteggio) as maxScore FROM `punteggio` WHERE fkUtente=:id');
    $queryMaxScore->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
    $queryMaxScore->execute();
    $maxScore = $queryMaxScore->fetch();

    $queryMinScore = $db->prepare('SELECT MIN(punteggio) as minScore FROM `punteggio` WHERE fkUtente=:id');
    $queryMinScore->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
    $queryMinScore->execute();
    $minScore = $queryMinScore->fetch();
    
    $queryAvgScore = $db->prepare('SELECT ROUND(AVG(punteggio),2) as avgScore FROM `punteggio` WHERE fkUtente=:id');
    $queryAvgScore->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
    $queryAvgScore->execute();
    $avgScore = $queryAvgScore->fetch();

    $result=array('max'=>$maxScore,'min'=>$minScore,'avg'=>$avgScore);

    echo '{"status":1, "data":' . json_encode($result) . '}'; */

    $query = $db->prepare('SELECT id,titolo from quiz');
    $query->execute();
    $quiz = $query->fetchAll();


    $data = array();



    foreach ($quiz as $q) {
        $queryMaxScore = $db->prepare('SELECT MAX(punteggio) as maxScore FROM `punteggio` WHERE fkUtente=:id and fkQuiz=:quizId');
        $queryMaxScore->bindValue(':id', $_GET['id']);
        $queryMaxScore->bindValue(':quizId', $q['id'], PDO::PARAM_INT);
        $queryMaxScore->execute();
        $maxScore = $queryMaxScore->fetch();


        $queryMinScore = $db->prepare('SELECT MIN(punteggio) as minScore FROM `punteggio` WHERE fkUtente=:id and fkQuiz=:quizId');
        $queryMinScore->bindValue(':id', $_GET['id']);
        $queryMinScore->bindValue(':quizId', $q['id'], PDO::PARAM_INT);

        $queryMinScore->execute();
        $minScore = $queryMinScore->fetch();

        $queryAvgScore = $db->prepare('SELECT ROUND(AVG(punteggio),2) as avgScore FROM `punteggio` WHERE fkUtente=:id and fkQuiz=:quizId');
        $queryAvgScore->bindValue(':id', $_GET['id']);
        $queryAvgScore->bindValue(':quizId', $q['id'], PDO::PARAM_INT);
        $queryAvgScore->execute();
        $avgScore = $queryAvgScore->fetch();

        $result = array('idQuiz' => $q['id'], 'nomeQuiz' => $q['titolo'], 'max' => $maxScore, 'min' => $minScore, 'avg' => $avgScore);


        $data[] = $result;
    }
    echo json_encode($data);
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}
