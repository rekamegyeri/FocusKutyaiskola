<?php
    session_start();
    include("kapcsolat.php");
    
    $unick = $_POST['u_nick'];
    $upwd = $_POST['u_pwd'];
    $pw = md5($upwd);
    
    $user = mysqli_query($adb, " 
        SELECT * FROM user
        WHERE u_nick = '$unick'
        AND u_pwd = '$pw'
    ");
    
    $userek = mysqli_fetch_assoc($user);
    
    
    if (!$userek) {
        echo "<script> alert('Hibás belépési adat(ok)! Kérjük próbálja meg újra.') </script>";
        echo "<script> window.location.href = './?p=login' </script>";
        exit();
    }
    
    
    
    
    $_SESSION['u_id'] = $userek['u_id'];
    $_SESSION['u_nick'] = $userek['u_nick'];
    
    $ip = $_SERVER['REMOTE_ADDR'];
    $sess = substr(session_id(), 0, 8);
    if   (isset($_SESSION['u_id'])) $uid = $_SESSION['u_id'];
    else   $uid = 0; 

    
   
    
    
    
    if (!empty($unick) && !empty($upwd) && $userek['u_nick'] == $unick && $userek['u_pwd'] == $pw){
        echo "<script> alert('Sikeres belépés!') </script>";
        print "<script> window.location.href = './?p=adatlapom' </script>";
    }
    
    mysqli_query($adb, "
        INSERT INTO login (l_id, l_datum, l_ip, l_session, l_u_id) 
        VALUES (NULL, NOW(), '$ip', '$sess', '$uid')
    ");
    
    mysqli_close($adb);
?>
