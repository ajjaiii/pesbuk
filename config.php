<?php

$db_host = "ahmad-db.cmeypdk92ow4.us-west-2.rds.amazonaws.com";
$db_user = "root";
$db_pass = "natupala1234";
$db_name = "dbfacebook";

try {    
    //create PDO connection 
    $db = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_pass);
} catch(PDOException $e) {
    //show error
    die("Terjadi masalah: " . $e->getMessage());
}
