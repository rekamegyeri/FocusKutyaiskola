<?php

     include('kapcsolat.php');






     $dname = $_POST['d_j_nev'];
     $tanfolyam = $_POST['tanfolyam-indulas'];
     $tanfolyamnev = $_POST['tanfolyam-indulas_label'];
     $unev = $_POST['u_j_nev'];
     $umail = $_POST['u_j_email'];
     $cname = $_POST['kurzus_label'];
    
    

     $tanf_result = mysqli_query($adb, "SELECT t_id, t_kezddatum, t_vegdatum   FROM tanfolyamok WHERE t_nev = '$tanfolyam'  ");
     $tanf_row = mysqli_fetch_assoc($tanf_result);
     $tanf_id = $tanf_row['t_id'];
     $tanf_kezd = $tanf_row['t_kezddatum'];
     $tanf_veg = $tanf_row['t_vegdatum'];


     mysqli_query($adb,"
        INSERT INTO  resztvevo  ( r_id ,  r_u_nev ,  r_d_nev ,  r_t_id, r_email    , r_datum) 
        VALUES                  ( NULL ,  '$unev' ,  '$dname',  '$tanf_id', '$umail', NOW())
    ");





    



    
    
        $from = "info@focusdog.hu";
        $from_name = "Focus Kutyaiskola";
        $subject = "Jelentkezés visszaigazolása";

        $message = "
            Kedves ".$unev.",

            A jelentkezésedet rögzítettük, szeretettel várunk a tanfolyamon:

            Kurzus neve : ".$cname."
            Dátum : ".str_replace( '-' , '. ',$tanf_kezd)." - ".str_replace( '-' , '. ',$tanf_veg)."
            Tanfolyam szintje és időpontja : ".$tanfolyamnev."
            Helyszín: 1033, Május 9. park (Óbudai sziget csúcsa)
            További információk: Kérjük, tájékozódj a focusdog.hu weboldalon található Információk menüpontban a szükséges részletekről.

            Amennyiben bármilyen kérdésed lenne, vagy a tanfolyam előtt bármi változna, kérjük,
            lépj kapcsolatba velünk.

            Köszönjük, hogy minket választottál! 

            Üdvözlettel,
            A Focus Kutyaiskola Csapata
        ";
        
        

    
        $headers = "From: ".$from_name." <".$from.">"."\r\n"; 
        $headers .= "Reply-To: ".$from."\r\n";
        $headers .= "Content-type: text/plain; charset=UTF-8\r\n";  

        
        if(mail($umail, $subject, $message, $headers)) {
            echo "<script> alert('Köszönjük hogy jelentkeztél tanfolyamunkra!') </script>";
        } 
        else {
            echo "<script> alert('Hiba történt az e-mail küldésekor.') </script>";
        }

        

    mysqli_close($adb);

    print "<script> parent.location.href = './' </script>";


?>