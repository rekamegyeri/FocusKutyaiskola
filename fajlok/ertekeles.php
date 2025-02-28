<?php
     session_start();
     include('kapcsolat.php');





     if($_POST['opinion']=="" && $_POST['rating']==""){
          die("<script> alert('Adj meg értékelést') </script>");
     }
     else{
          $ratingtext = $_POST['opinion'];
          $ratingstar = $_POST['rating'];


          if($ratingstar != 0){
               if( $ratingstar < 0 || $ratingstar > 5){
                    die("<script> alert('Az értékelés csak 1 és 5 között lehetséges!') </script>");
               }
          }
          
          mysqli_query($adb, "
               INSERT INTO ertekeles    (e_id,  e_u_id            ,  e_szoveg     ,  e_szam        ,  e_datum ) 
               VALUES                   (NULL,  '$_SESSION[u_id]' ,  '$ratingtext',  '$ratingstar' ,   NOW()  );
          ");
          
          echo "<script> alert('Köszönjük értékelésed!') </script>";

           print "<script> parent.location.href = './' </script>";
     }
        
?>