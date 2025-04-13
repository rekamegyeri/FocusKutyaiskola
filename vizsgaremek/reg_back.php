<?php

    session_start();
    include_once('kapcsolat.php');

    // print_r($_POST); 


    // ELLENŐRZÉSEK
    if($_POST['u_r_nick']==""){
        echo "<script> alert('Nem adtál meg felhasználónevet!') </script>";
        print "<script> parent.location.href = './?p=login' </script>";
    }
    if($_POST['u_r_email']==""){
        echo"<script> alert('Nem adtál meg e-mail címet!') </script>";
        print "<script> parent.location.href = './?p=login' </script>";
    }
    if($_POST['u_r_pwd']==""){
        echo"<script> alert('Nem adtál meg jelszót!') </script>";
        print "<script> parent.location.href = './?p=login' </script>";
    }
        
        
        
    
    $unamequery = mysqli_query($adb, "SELECT u_nick FROM user WHERE u_nick = '$_POST[u_r_nick]'");

    $umailquery = mysqli_query($adb, "SELECT u_email FROM user WHERE u_email = '$_POST[u_r_email]'");
    

    
    if(mysqli_num_rows($unamequery) > 0){
        echo "<script> alert('Ez a felhasználónév már létezik!') </script>";
        print "<script> parent.location.href = './?p=login' </script>";
    }
    else if(mysqli_num_rows($umailquery) > 0){
        echo "<script> alert('Ez az e-mail cím már létezik!') </script>";
        print "<script> parent.location.href = './?p=login' </script>";
    }
    else{
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

       $message = "Kedves ".$_POST['u_r_nick'].",\n\n" .
       
                  "Üdvözlünk a Focus Kutyaiskola közösségében!\n\n" .
                  "Nagyon örülünk, hogy csatlakoztál hozzánk, és izgatottan várjuk, hogy együtt tanuljunk és fejlődjünk veled és a kutyusoddal.\n\n" .
                  "Ha bármilyen kérdésed van, ne habozz írni nekünk!\n\n" .
                  
                  "Köszönjük, hogy a Focus Kutyaiskolát választottad!\n\n" .
                  
                  "Üdvözlettel,\n" .
                  "A Focus Kutyaiskola Csapata";
                  
                  
                  
    
        $headers = "From: ".$from_name." <".$from.">"."\r\n"; 
        $headers .= "Reply-To: ".$from."\r\n";
        $headers .= "Content-type: text/plain; charset=UTF-8\r\n";  

        
        if(mail($_POST['u_r_email'], $subject, $message, $headers)) {
            echo "<script> alert('Sikeres regisztráció! Kérjük lépjen be.') </script>";
        } 
        else {
            echo "<script> alert('Hiba történt az e-mail küldésekor.') </script>";
        }
        
    }
        
    

        

    


    mysqli_close($adb);

    print "<script> parent.location.href = './?p=login' </script>";
    

?>




























