<?php
     session_start();
     include ("kapcsolat.php");
     
    $ip = $_SERVER['REMOTE_ADDR'];
    $sess = substr(session_id(), 0, 8);
    if   (isset($_SESSION['u_id'])) $uid = $_SESSION['u_id'];
    else                            $uid = 0; 
    $url = $_SERVER['REQUEST_URI'];

    mysqli_query($adb,"
        INSERT INTO  naplo  ( n_id ,  n_datum ,  n_ip ,  n_session ,  n_u_id ,  n_url )
        VALUES              (NULL  ,  NOW()   ,  '$ip',  '$sess'   ,  '$uid' ,  '$url')
    ");
?>



<!DOCTYPE html>
<html lang="hu">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
     <link rel="SHORTCUT ICON" href="images/ikonlogo.png"/>
     <title>

          <?php
               if(isset($_GET['p'])) $p = $_GET['p'];
               else                  $p = "";

               if($p == ""              )    print "Focus Kutyaiskola" ; else
               if($p == "adatlapom"     )    print "Adatlapom - Focus Kutyaiskola"; else
               if($p == "login"        )     print "Belépés - Focus Kutyaiskola"; else
               if($p == "regisztracio" )     print "Regisztráció - Focus Kutyaiskola"; else
               if($p == "arlista" )     print "Árlista - Focus Kutyaiskola"; else
                                             print "404 - Focus Kutyaiskola";
          ?>

     </title>
</head>
<body>
     <style>
          body{
               margin: 0;
          }
     </style>
     <?php

         
          include('navbar.php');
          
          
          if( isset($_SESSION['u_id']))
          {
               if($p == ""              )    include("focusdog-fooldal.php" ); else
               if($p == "adatlapom"     )    include("adatlap.php"          ); else
               if($p == "kilepes"       )    include("logout.php"           ); else
               if($p == "ertekeles"     )    include("ertekeles.php"        ); else
               if($p == "arlista" )         include("arlista.php"            ); else
                                             include("404es.php"            );
          }
          else{
               if($p == ""             )     include("focusdog-fooldal.php" ); else
               if($p == "login"        )     include("login.php"            ); else
               if($p == "regisztracio" )     include("login.php"            ); else
               if($p == "arlista" )         include("arlista.php"            ); else
                                             include("404es.php"            );
          }
          
     ?>
</body>
</html>