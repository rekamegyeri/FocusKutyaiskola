<?php

    session_start();

    // print_r($_POST);

    include ("kapcsolat.php");



    $pw = md5($_POST['u_pwd']);

    $userek = mysqli_query( $adb, " 
        SELECT * FROM user
        WHERE u_nick = '$_POST[u_nick]'
        AND u_pwd='$pw'
    ");

    
    if(mysqli_num_rows($userek)==0){
        print "<script> alert('Hibás belépési adat!') </script>";
    }
    else{
        $user = mysqli_fetch_array($userek);
        $_SESSION['u_id'] = $user['u_id'];
        $_SESSION['u_nick'] = $user['u_nick'];
    }
    





    $ip = $_SERVER['REMOTE_ADDR'];
    $sess = substr(session_id(), 0, 8);
    if   (isset($_SESSION['u_id'])) $uid = $_SESSION['u_id'];
    else                            $uid = 0; 

    mysqli_query($adb,"
        INSERT INTO  login  ( l_id ,  l_datum ,  l_ip ,  l_session ,  l_u_id ) 
        VALUES              ( NULL ,  NOW()   ,  '$ip',  '$sess'   ,  '$uid' )
    ");



    

    $unick = $_POST['u_nick'];
    $upwd = $_POST['u_pwd'];

    
    if ($unick != "" && $upwd != "" &&   mysqli_query($adb, "SELECT * FROM user WHERE u_nick = '$unick' AND u_pwd = '$upwd' ") ) {
        echo "<script> alert('Sikeres belépés!') </script>";
    } 


    mysqli_close($adb);

    print "<script> parent.location.href = './' </script>";

    
?>