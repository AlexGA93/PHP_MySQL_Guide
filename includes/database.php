<?php
    // Params to connect to MySQL
    $dbHost = "localhost";
    $dbUser = "root";
    $dbPass = ""; // if not protected empty string
    $dbName = "PHP_Project";

    $conn = mysqli_connect($dbHost, $dbUser, $dbPass,$dbName);

    // checking if there is a connection
    if(!$conn) {
        die("Database Connection failed!");
    }
?>