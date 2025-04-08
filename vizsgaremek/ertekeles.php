<?php
     session_start();
     include('kapcsolat.php');

    
    
    
    
    
    
    $e_query = mysqli_query($adb, "SELECT * FROM ertekeles WHERE e_u_id = '$_SESSION[u_id]'");
    
    
    
    
    if(isset($_SESSION['u_id'])){
        
        if(mysqli_num_rows($e_query) > 5) {
            echo "<script> alert('Már értékelted kutyaiskolánkat!') </script>";
        }
        else{
            
            if($_POST['opinion']=="" && $_POST['rating']==""){
                echo "<script> alert('Adj meg értékelést') </script>";
            }
            else{
                $ratingtext = $_POST['opinion'];
                $ratingstar = $_POST['rating'];


                if($ratingstar != 0){
                    if( $ratingstar < 0 || $ratingstar > 5){
                        echo "<script> alert('Az értékelés csak 1 és 5 között lehetséges!') </script>";
                        print "<script> parent.location.href = './' </script>";
                    }
                }
          
                mysqli_query($adb, "
                    INSERT INTO ertekeles    (e_id,  e_u_id            ,  e_szoveg     ,  e_szam        ,  e_datum ) 
                    VALUES                   (NULL,  '$_SESSION[u_id]' ,  '$ratingtext',  '$ratingstar' ,   NOW()  );
                ");
          
                echo "<script> alert('Köszönjük értékelésed!') </script>";
            }
        }
    }
    else{
        echo "<script> alert('Kérjük lépjen be az értékelés megadásához!') </script>";
    }

     
     
     print "<script> parent.location.href = './' </script>";
        
?>