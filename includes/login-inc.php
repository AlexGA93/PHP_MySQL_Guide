<?php
    require 'database.php';

    if(isset($_POST['submit'])){
        

        $username = $_POST['username'];
        $password = $_POST['password'];

        if (empty($username) || empty($password)){
            header("Location: ../index.php?error=emptyfields");
            exit();
        } else {
            $sql = "SELECT * FROM users WHERE username = ?";
            $stmt = mysqli_stmt_init($conn);

            if(!mysqli_stmt_prepare($stmt, $sql)){
                header("Location: ../index.php?error=sqlerror");
                exit();
            } else {
                mysqli_stmt_bind_param($stmt, "s", $username);
                mysqli_stmt_execute($stmt);

                $result = mysqli_stmt_get_result($stmt);

                if ($row = mysqli_fetch_assoc($result)){
                    $passCheck = password_verify($passCheck, $row['password']);
                    if($passCheck == false) {
                        header("Location: ../index.php?error=wrongpass1");
                        exit();
                    } elseif ($passCheck == true) {
                        session_start();
                        $_SESSION['sessionId'] = $row['id'];
                        $session['sessionUser'] = $row['username'];
                        header("Location: ../index.php?success=loggedin");
                        exit();
                    } else {
                        header("Location: ../index.php?error=wrongpass2");
                        exit();
                    }
                } else{
                    header("Location: ../index.php?error=nouser");
                    exit();
                }
            }
        }
    }else{
        header("Location: ../index.php?error=accessforbidden");
        exit(); 
    }
?>
