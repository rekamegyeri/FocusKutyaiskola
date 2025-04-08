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
    
    $userek = mysqli_fetch_array(mysqli_query($adb," SELECT u_comment FROM user WHERE u_id = $_SESSION[u_id]"));
       
    
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

               if($p == ""              )     print "Focus Kutyaiskola" ;               else
               if($p == "adatlapom"     )     print "Adatlapom - Focus Kutyaiskola";    else
               if($p == "login"         )     print "Belépés - Focus Kutyaiskola";      else
               if($p == "regisztracio"  )     print "Regisztráció - Focus Kutyaiskola"; else
               if($p == "arlista"       )     print "Árlista - Focus Kutyaiskola";      else
               if($p == "admin"         )     print "Admin - Focus Kutyaiskola";        else
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
            
            
        if ($_GET['p'] == 'admin') {
            include('kezelopult/navbar-control.php');
        } 
        else{
            include('navbar.php');
        }
        
        
        
        
        
        
        
          
        if (isset($_SESSION['u_id'])) {
            
            
            $isAdmin = (isset($userek['u_comment']) && trim($userek['u_comment']) === 'admin');


            if ($p == "admin" && !$isAdmin) {
                include("404es.php"); 
            } 
            else {
                    switch ($p) {
                        case "":
                            include("focusdog-fooldal.php");
                            break;
                        case "adatlapom":
                            include("adatlap.php");
                            break;
                        case "kilepes":
                            include("logout.php");
                            break;
                        case "ertekeles":
                            include("ertekeles.php");
                            break;
                        case "arlista":
                            include("arlista.php");
                            break;
                        case "admin":
                            if ($isAdmin) {
                                include("kezelopult/controlpanel.php");
                            } 
                            else {
                                include("404es.php"); 
                            }
                            break;
                        default:
                            include("404es.php");
                    }
            }
        } 
        else {
            switch ($p) {
                case "":
                    include("focusdog-fooldal.php");
                    break;
                case "login":
                case "regisztracio":
                    include("login.php");
                    break;
                case "arlista":
                    include("arlista.php");
                    break;
                default:
                    include("404es.php");
            }
        }
          
    ?>
</body>
</html>