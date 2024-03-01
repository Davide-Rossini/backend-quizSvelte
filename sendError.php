<?php

function sendError($message = 'error', $debug = 0)
{
    echo '{"status":0, "message":"' . $message . '", "debug": ' . $debug . '}';
    exit();
}
