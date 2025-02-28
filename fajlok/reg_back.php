<?php

    session_start();
    include_once('kapcsolat.php');

    // print_r($_POST); 


    // ELLENŐRZÉSEK
    if($_POST['u_r_nick']=="")
        die("<script> alert('Nem adtál meg felhasználónevet!') </script>");

    if($_POST['u_r_email']=="")
        die("<script> alert('Nem adtál meg e-mail címet!') </script>");

    if($_POST['u_r_pwd']=="")
        die("<script> alert('Nem adtál meg jelszót!') </script>");
        
    

        

    $upwd = md5($_POST['u_r_pwd']);

    mysqli_query($adb, "
        INSERT INTO user (u_id,  u_email           ,  u_nick           ,  u_pwd  , u_datum, u_profkep_nev, u_profkep_eredetinev, u_ip , u_session, u_status, u_comment) 
        VALUES           (NULL, '$_POST[u_r_email]', '$_POST[u_r_nick]', '$upwd' , NOW()  , ''           , ''                  , ''   , ''       , ''      , ''       );
    ");



        
    $d_uid = mysqli_insert_id($adb);
    mysqli_query($adb, "
        INSERT INTO dog  (d_id,  d_nev             ,  d_u_id   ) 
        VALUES           (NULL, '$_POST[u_r_dname]',  '$d_uid' );
    ");
















    // EMAIL-müködik
    $user_name_result = mysqli_query($adb, "SELECT u_nick FROM user ORDER BY u_id DESC LIMIT 1");
    $user_email_result = mysqli_query($adb, "SELECT u_email FROM user ORDER BY u_id DESC LIMIT 1");

    $user_name_row = mysqli_fetch_assoc($user_name_result);
    $user_email_row = mysqli_fetch_assoc($user_email_result);

    $user_name = $user_name_row['u_nick'];
    $user_email = $user_email_row['u_email'];




    
    
        $from = "info@focusdog.hu";
        $from_name = "Focus Kutyaiskola";
        $subject = "Üdvözlünk a Focus Kutyaiskolánál!";

        $message = "
            Kedves ".$_POST['u_r_nick'].",

            Üdvözlünk a Focus Kutyaiskola közösségében! 
            Nagyon örülünk, hogy csatlakoztál hozzánk, és izgatottan várjuk, hogy együtt tanuljunk és fejlődjünk veled és a kutyusoddal.
            Ha bármilyen kérdésed van, ne habozz írni nekünk!

            Köszönjük, hogy a Focus Kutyaiskolát választottad!

            Üdvözlettel,
            A Focus Kutyaiskola Csapata
        ";

    
        $headers = "From: ".$from_name." <".$from.">"."\r\n"; 
        $headers .= "Reply-To: ".$from."\r\n";
        $headers .= "Content-type: text/plain; charset=UTF-8\r\n";  

        
        if(mail($_POST['u_r_email'], $subject, $message, $headers)) {
            echo "<script> alert('A köszöntő e-mail sikeresen elküldve!') </script>";
        } 
        else {
            echo "<script> alert('Hiba történt az e-mail küldésekor.') </script>";
        }


    mysqli_close($adb);

    
    print "<script> parent.location.href = './' </script>";

?>




























