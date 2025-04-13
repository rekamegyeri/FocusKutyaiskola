<?php
session_start();
include('kapcsolat.php');
include('randomstring.php');



$modositva = false;




if(!empty($_POST['felhasznev']) && !empty($_POST['felhaszmail']) ){
    $u_id = mysqli_real_escape_string($adb, $_SESSION['u_id']);
    $sql = "SELECT * FROM user WHERE u_id = '$u_id'";
    $felhasznalok = mysqli_fetch_array(mysqli_query($adb, $sql));


    $sql_update_user = "
        UPDATE user 
        SET u_email = '" . mysqli_real_escape_string($adb, $_POST['felhaszmail']) . "', 
        u_nick = '" . mysqli_real_escape_string($adb, $_POST['felhasznev']) . "'
        WHERE u_id = '$u_id'
    ";

    mysqli_query($adb, $sql_update_user);
    $_SESSION['u_nick'] = $_POST['felhasznev'];  
    
    $modositva = true;
}
else{
    $modositva = false;
     echo "<script>
            alert('Nem lehet üres a felhasználónév és az e-mail cím!');
          </script>";
    print "<script> parent.location.href = './?p=adatlapom' </script>";
}






$oldpwd = md5($_POST['oldpwd']);
if(!empty($_POST['oldpwd'])){
    if($oldpwd == $felhasznalok['u_pwd']){
        $sql_update_pw = "
            UPDATE user 
            SET u_pwd = '" . mysqli_real_escape_string($adb, md5($_POST['newpwd'])) . "'
            WHERE u_id = '$u_id'
        ";
        mysqli_query($adb, $sql_update_pw);
    
        $modositva = true;
    }
    else{
        $modositva = false;
        echo "<script>
            alert('A megadott régi jelszó nem megfelelő!');
        </script>" ;
        print "<script> parent.location.href = './?p=adatlapom' </script>";
    }
}





if ( !empty($_POST['felhaszdog'])&& $_POST['felhaszdog'] != $kutya_nev) {
    $kutya_nev = mysqli_real_escape_string($adb, $_POST['felhaszdog']);
    $sql_update_dog = "
        UPDATE dog 
        SET d_nev = '$kutya_nev'
        WHERE d_u_id = '$u_id'
    ";
    mysqli_query($adb, $sql_update_dog);

    
    $_SESSION['d_nev'] = $_POST['felhaszdog'];
    
    $modositva = true;
}else{
    $modositva = false;
}

if ($modositva === true) {
    echo "<script>
        alert('Adataidat sikeresen módosítottuk!');
    </script>";
}else {
    echo "<script>
        alert('Adataidat nem módosítottad!');
    </script>";
}



print "<script> parent.location.href = './?p=adatlapom' </script>";


mysqli_close($adb);
?>
