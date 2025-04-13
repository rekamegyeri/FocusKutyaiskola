<?php
    //  include("navbar-control.php");
?>

<!DOCTYPE html>
<html lang="hu">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="SHORTCUT ICON" href="adminikonlogo.png"/>
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <title>Focus Kutyaiskola - Admin</title>
</head>

<style>
     .tablesdiv{
          margin-top: 100px;
          margin-bottom: 10px;
     }
     .tablesdiv:last-child{
          margin-bottom: 40px;
     }
</style>

<body>

     <div class="tablesdiv">
          <?php
               include("userstable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("loginstable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("dogstable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("curzustable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("trainerstable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("programstable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("studentstable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("pricestable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("diarytable.php");
          ?>
     </div>

     <div class="tablesdiv">
          <?php
               include("ratingstable.php");
          ?>
     </div>
</body>
</html>