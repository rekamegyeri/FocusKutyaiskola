<?php
session_start();
include('kapcsolat.php');
include('randomstring.php');

// Ellenőrizzük, hogy a felhasználónév nem üres-e
if (!isset($_POST['felhasznev']) || empty($_POST['felhasznev'])) {
    echo "<script>
            alert('Nem lehet üres a felhasználónév');
          </script>";
    exit; // Leállítjuk a scriptet, ha a felhasználónév üres
}

// Lekérdezzük a felhasználót
$felhasznalok = mysqli_fetch_array(mysqli_query($adb, "SELECT * FROM user WHERE u_id = '" . mysqli_real_escape_string($adb, $_SESSION['u_id']) . "'"));




// Ha a felhasználó törölni akarja a profilképet
if (isset($_POST['delete_profkep']) && $_POST['delete_profkep'] == '1') {
    $kepnev = ""; // A profilkép neve üresre állítva

    // Fájl törlés
    $file_path = './profkepek/' . $felhasznalok['u_profkep_nev'];
    if (file_exists($file_path)) {
        unlink($file_path); // Töröljük a képet a fájlrendszerből
    }

    // Az adatbázisban is töröljük a profilképet
    $sql = "
    UPDATE user 
    SET u_profkep_nev = ''
    WHERE   u_id = '" . mysqli_real_escape_string($adb, $_SESSION['u_id']) . "'
    ";
    mysqli_query($adb, $sql);
    
    
    
    
    

    // Frissítjük a session változókat
    $_SESSION['u_profkep_nev'] = ''; // A sessionben is töröljük a képet
    echo "<script>
            alert('A profilképed törlésre került');
          </script>";
    print "<script> parent.location.href = './?p=adatlapom' </script>";
    exit;
}

// Ha új profilkép van feltöltve
if (isset($_FILES['uprofkep']) && $_FILES['uprofkep']['error'] == 0) {
    $kepadat = $_FILES['uprofkep']; 
    $kepnev = $_SESSION['u_id'] . "_" . date("ymdHis") . "_" . randomstring(5);
    
    // Ellenőrizzük a fájl kiterjesztését
    if ($kepadat['type'] == "image/jpeg") {
        $kiterj = ".jpg";
    } else if ($kepadat['type'] == "image/png") {
        $kiterj = ".png";
    } else {
        echo "<script> alert('A kép csak .JPG vagy .PNG lehet!') </script>";
        exit; // Leállítjuk a scriptet, ha a fájl nem megfelelő típusú
    }

    $kepnev .= $kiterj;

    // Frissítjük az adatokat az adatbázisban, beleértve a profilképet
    $sql = "
    UPDATE user 
    SET     u_email = '" . mysqli_real_escape_string($adb, $_POST['felhaszmail']) . "', 
            u_nick = '" . mysqli_real_escape_string($adb, $_POST['felhasznev']) . "', 
            u_profkep_nev = '" . mysqli_real_escape_string($adb, $kepnev) . "'
    WHERE   u_id = '" . mysqli_real_escape_string($adb, $_SESSION['u_id']) . "'
    ";
    mysqli_query($adb, $sql);

    // Kép feltöltése
    move_uploaded_file($kepadat['tmp_name'], "./profkepek/" . $kepnev);
} else {
    // Ha nincs új kép feltöltve, csak a felhasználónevet és emailt frissítjük
    $sql = "
    UPDATE user 
    SET     u_email = '" . mysqli_real_escape_string($adb, $_POST['felhaszmail']) . "', 
            u_nick = '" . mysqli_real_escape_string($adb, $_POST['felhasznev']) . "'
    WHERE   u_id = '" . mysqli_real_escape_string($adb, $_SESSION['u_id']) . "'
    ";
    mysqli_query($adb, $sql);

    // Ha a felhasználó nem módosította a profilképet, akkor ne változtassuk meg a profilképet
    $kepnev = $felhasznalok['u_profkep_nev']; // Megőrizzük a jelenlegi képet
}




if (isset($_POST['felhaszdog'])) {
    $kutya_nev = mysqli_real_escape_string($adb, $_POST['felhaszdog']);
 

    // Kutyához tartozó adatok frissítése
    $sql = "
    UPDATE dog 
    SET d_nev = '$kutya_nev'
    WHERE d_u_id = '" . mysqli_real_escape_string($adb, $_SESSION['u_id']) . "'
    ";
    mysqli_query($adb, $sql);
}




// Frissítjük a session változókat
$_SESSION['u_nick'] = $_POST['felhasznev'];
$_SESSION['d_nev'] = $_POST['felhaszdog'];
$_SESSION['u_profkep_nev'] = $kepnev; // Ha töröltük a képet, akkor az üres stringet állítunk be


echo "<script>
        alert('Adataidat sikeresen módosítottuk');
    </script>";

print "<script> parent.location.href = './?p=adatlapom' </script>";

mysqli_close($adb);
?>
