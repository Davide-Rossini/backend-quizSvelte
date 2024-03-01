<?php
include 'sendError.php';


header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');

if (!isset($_GET['id'])) {
    sendError('id missing', __LINE__);
}
if (!ctype_digit($_GET['id'])) {
    sendError('id not valid', __LINE__);
}

require_once(__DIR__ . '/protected/config.php');

try {
    $numeroDomande = 5;
    $query = $db->prepare("SELECT d.id AS id_domanda, d.testo AS testo_domanda, r.id AS id_risposta, r.testo AS testo_risposta, a.corretta
        FROM domanda d
        JOIN appartiene a ON d.id = a.fkDomanda
        JOIN risposta r ON a.fkRisposta = r.id
        WHERE d.fkQuiz=:id");
    $query->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
    $query->execute();
    $result = $query->fetchAll(PDO::FETCH_ASSOC);

    $query1 = $db->prepare("SELECT url_icon AS img
        FROM quiz  
        WHERE id=:id");
    $query1->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
    $query1->execute();
    $url_img = $query1->fetch();

    if (count($result) == 0 || count($url_img) == 0) {
        sendError('Quiz not found', __LINE__);
        exit();
    }

    // Creazione dell'array per l'output JSON
    $output = array();



    foreach ($result as $row) {
        $id_domanda = $row['id_domanda'];
        $testo_domanda = $row['testo_domanda'];
        $id_risposta = $row['id_risposta'];
        $testo_risposta = $row['testo_risposta'];
        $corretta = $row['corretta'];

        // Creazione di un array per ogni domanda
        if (!array_key_exists($id_domanda, $output)) {
            $output[$id_domanda] = array(
                'id_domanda' => $id_domanda,
                'domanda' => $testo_domanda,
                'risposte' => array()
            );
        }

        // Aggiunta di una risposta all'array delle risposte
        $risposta = array(
            'id_risposta' => $id_risposta,
            'testo_risposta' => $testo_risposta,
            'corretta' => ($corretta == 1) ? true : false
        );


        array_push($output[$id_domanda]['risposte'], $risposta);
    }


    shuffle($output);
    $arrayTagliato = array_slice($output, 0, $numeroDomande);

    $domande = array();
    foreach ($arrayTagliato as $val) {
        shuffle($val['risposte']);
        array_push($domande, $val);
    }

    $data = array(
        "status" => 1,
        "data" => array(
            "idQuiz" => $_GET['id'],
            "domande" => $domande,
            "url_img" => $url_img['img']
        )
    );

    echo (json_encode($data));
} catch (PDOException $ex) {
    sendError('error executing query', __LINE__);
}