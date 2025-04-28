<?php
        error_reporting(E_ALL);
        ini_set('display_errors', 1);
        
        include("kapcsolat.php");
        
        
        $muvelet = $_REQUEST['muvelet'] ?? 'lista';
        $azonosito = isset($_REQUEST['id']) ? filter_var($_REQUEST['id'], FILTER_VALIDATE_INT) : null;
        $szerkesztendo_tanfolyam = null;
        $lista_adatok = [];
        $aktualis_oldal_url = '?p=admin';
        
        if ($muvelet === 'torles' && $azonosito) {
            $utasitas = $adb->prepare("DELETE FROM tanfolyamok WHERE t_id = ?");
            if ($utasitas) {
                $utasitas->bind_param('i', $azonosito);
                $utasitas->execute();
                $utasitas->close();
            }
         
        }
        
        if ($muvelet === 'mentes' && $_SERVER['REQUEST_METHOD'] === 'POST') {
            $mentendo_azonosito = filter_input(INPUT_POST, 'tid', FILTER_VALIDATE_INT);
            $nev = trim(filter_input(INPUT_POST, 'tnev', FILTER_SANITIZE_STRING));
            $kezddatum = trim(filter_input(INPUT_POST, 'tkezd', FILTER_SANITIZE_STRING));
            $vegdatum = trim(filter_input(INPUT_POST, 'tveg', FILTER_SANITIZE_EMAIL));
            $oid = trim(filter_input(INPUT_POST, 'toid', FILTER_SANITIZE_STRING));
            $cid = trim(filter_input(INPUT_POST, 'tcid', FILTER_SANITIZE_STRING));
        
            if ($mentendo_azonosito && !empty($nev)) {
                $utasitas = $adb->prepare("UPDATE tanfolyamok SET t_nev = ?, t_kezddatum = ?, t_vegdatum = ?, t_o_id = ?, t_c_id = ? WHERE t_id = ?");
                if ($utasitas) {
                    $utasitas->bind_param('sssiii', $nev, $kezddatum, $vegdatum, $oid, $cid, $mentendo_azonosito);
                    $utasitas->execute();
                    $utasitas->close();
                }
            }
         
        }
        
        if ($muvelet === 'szerkesztes' && $azonosito) {
            $utasitas = $adb->prepare("SELECT t_id, t_nev, t_kezddatum, t_vegdatum, t_o_id, t_c_id FROM tanfolyamok WHERE t_id = ?");
            if ($utasitas) {
                $utasitas->bind_param('i', $azonosito);
                $utasitas->execute();
                $eredmeny = $utasitas->get_result();
                $szerkesztendo_tanfolyam = $eredmeny->fetch_assoc();
                $utasitas->close();
                if (!$szerkesztendo_tanfolyam) {
                    $muvelet = 'lista';
                }
            } else {
                $muvelet = 'lista';
            }
        }
        
        if ($muvelet !== 'szerkesztes') {
            $muvelet = 'lista';
            $eredmeny = $adb->query("SELECT * FROM tanfolyamok ORDER BY t_id ASC");
            if ($eredmeny) {
                while ($sor = $eredmeny->fetch_assoc()) {
                    $lista_adatok[] = $sor;
                }
                $eredmeny->free();
            }
        }
        
        $adb->close();
     
?>


<!DOCTYPE html>
<html lang="hu">

<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <!--<title>Focus Kutyaiskola - Admin</title>-->
</head>

<style>
 /* Általános stílusok */
 body {
     font-family: 'Arial', sans-serif;
     background-color: #f4f7fc;
     margin: 0;
     padding: 0;
}

.container {
     width: 95%;
     max-width: 1200px;
     margin: 0 auto;
     padding: 10px;
     flex-direction: column;
}


.header {
     text-align: center;
     margin-bottom: 30px;
}

.header h1 {
     font-size: 2.5rem;
     color: #895159;
     margin: 0;
     padding: 0;
}


/* Tábla stílusa */
.table {
     background-color: white;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
     border-radius: 8px;
     overflow: hidden;
}

.table table {
     width: 100%;
     border-collapse: collapse;
     font-size: 1rem;
     table-layout: auto;
}

.table thead {
     background-color: #895159;
     color: white;
}

.table th,
.table td {
     padding: 15px;
     text-align: center;
     word-wrap: break-word;
     max-width: 150px;
}

.table th {
     font-weight: 600;
}

.table tbody tr:nth-child(even) {
     background-color: #f9f9f9;
}

.table tbody tr:hover {
     background-color: #f1f1f1;
     transition: background-color 0.3s;
}

/* Ikonok */
.table i {
     cursor: pointer;
     font-size: 1.2rem;
}


.table .bxs-pencil {
     color: #4caf50;
     /* Szerkesztés ikon zöld színű */
}

.table .bxs-trash-alt {
     color: #f44336;
     /* Törlés ikon piros színű */
}

form { 
    max-width: 450px; 
    margin: 20px auto; 
    border: 1px solid #ccc; 
    padding: 20px; 
    background-color: #fff; 
    border-radius: 5px; 
    box-shadow: 0 2px 3px rgba(0,0,0,0.1);
}
label { 
    display: block; 
    margin-bottom: 5px; 
    font-weight: bold; 
    color: #895159; 
}

input[type=text], input[type=email], input[type=tel] {
    width: calc(100% - 18px);
    padding: 8px;
    margin-bottom: 12px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 1em;
}

.mentesbtn { 
    padding: 10px 15px; 
    background-color: #895159; 
    color: white; 
    border: none; 
    border-radius: 3px; 
    cursor: pointer; 
    font-size: 1em; 
}
.mentesbtn:hover { 
    background-color: #ce74825b; 
}
.back-link { 
    display: block; 
    text-align: center; 
    margin-top: 15px; 
    color: #895159; 
    font-weight: bold;
}
.actions { 
    white-space: nowrap; 
    text-align: center;
}
.no-data { 
    text-align: center; 
    padding: 20px; 
    background-color: #fff; 
    border: 1px solid #ccc; 
    margin-top: 15px;
}

/* Reszponzív dizájn */
@media (max-width: 768px) {

     .table table {
          font-size: 0.9rem;
          display: block;
          overflow-x: auto;
          white-space: nowrap;
          width: 100%;
     }

     .table th,
     .table td {
          padding: 10px;
          word-wrap: break-word;
          max-width: 40px;
     }

     .header h1 {
          font-size: 2rem;
     }
}

@media (max-width: 480px) {
     

     .table table {
          font-size: 0.8rem;
     }

     .table th,
     .table td {
          padding: 8px;
          word-wrap: break-word;
          max-width: 30px;
     }

     .header h1 {
          font-size: 1.5rem;
     }
}
</style>


<body>
     <div class="container">
          <div class="header">
                <h1>
                    <?= ($muvelet === 'szerkesztes') ? 'Tanfolyam Módosítása' : 'Tanfolyamok'; ?>
                </h1>
          </div>
          
          
          <?php if ($muvelet === 'szerkesztes' && $szerkesztendo_tanfolyam): ?>
          
              <form action="<?php echo $aktualis_oldal_url; ?>" method="POST">
                    <input type="hidden" name="muvelet" value="mentes">
                    <input type="hidden" name="tid" value="<?= htmlspecialchars($szerkesztendo_tanfolyam['t_id']) ?>">
        
                    <div>
                        <label for="nev">Név:</label>
                        <input type="text" id="nev" name="tnev" value="<?= htmlspecialchars($szerkesztendo_tanfolyam['t_nev']) ?>">
                    </div>
                    <div>
                        <label for="kezd">Kezdő dátum:</label>
                        <input type="date" id="kezd" name="tkezd" value="<?= htmlspecialchars($szerkesztendo_tanfolyam['t_kezddatum']) ?>">
                    </div>
                    <div>
                        <label for="veg">Befejező dátum:</label>
                        <input type="date" id="veg" name="tveg" value="<?= htmlspecialchars($szerkesztendo_tanfolyam['t_vegdatum']) ?>">
                    </div>
                    <div>
                        <label for="oid">Oktató ID:</label>
                        <input type="number" id="oid" name="toid" value="<?= htmlspecialchars($szerkesztendo_tanfolyam['t_o_id']) ?>">
                    </div>
                    <div>
                        <label for="cid">Kurzus ID:</label>
                        <input type="number" id="cid" name="tcid" value="<?= htmlspecialchars($szerkesztendo_tanfolyam['t_c_id']) ?>">
                    </div>
                    <div>
                        <button type="submit" class="mentesbtn">Mentés</button>
                    </div>
            </form>
            <a href="<?= $aktualis_oldal_url ?>" class="back-link">Mégse</a>
          
          
          
          
          
          
          
        
          
           <?php elseif ($muvelet === 'lista'): ?>
                <main class="table">
                    <section class="table-body">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Név</th>
                                    <th>Kezdő dátum</th>
                                    <th>Befejező dátum</th>
                                    <th>Oktató ID</th>
                                    <th>Kurzus ID</th>
                                    <th>Módosít</th>
                                    <th>Töröl</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($lista_adatok)): ?>
                                    <?php foreach ($lista_adatok as $tanfolyam): ?>
                                        <tr>
                                            <td><?= htmlspecialchars($tanfolyam['t_id']) ?></td>
                                            <td><?= htmlspecialchars($tanfolyam['t_nev']) ?></td>
                                            <td><?= htmlspecialchars($tanfolyam['t_kezddatum']) ?></td>
                                            <td><?= htmlspecialchars($tanfolyam['t_vegdatum']) ?></td>
                                            <td><?= htmlspecialchars($tanfolyam['t_o_id']) ?></td>
                                            <td><?= htmlspecialchars($tanfolyam['t_c_id']) ?></td>
                                            <td>
                                                <a href="<?= $aktualis_oldal_url ?>&muvelet=szerkesztes&id=<?= $tanfolyam['t_id'] ?>">
                                                    <i class='bx bxs-pencil' style='color: green;'></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="<?= $aktualis_oldal_url ?>&muvelet=torles&id=<?= $tanfolyam['t_id'] ?>"
                                                   onclick="return confirm('Biztosan törölni szeretnéd: <?= addslashes($tanfolyam['t_nev']) ?>?')">
                                                    <i class='bx bxs-trash-alt' style='color: red;'></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr><td colspan="6">Nincs elérhető tanfolyam.</td></tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                        <?php endif; ?>
                    </section>
                </main>
                    
        </div>
        
        <script>
            
            window.addEventListener("beforeunload", (e) => {
        
                if (performance.navigation.type === 1) { 
                    sessionStorage.setItem('scrollPos', window.scrollY);
                } else {
                    sessionStorage.removeItem('scrollPos');
                }
            });

            document.addEventListener("DOMContentLoaded", () => {
                const scrollPos = sessionStorage.getItem('scrollPos');
                if (scrollPos !== null) {
                    window.scrollTo(0, parseInt(scrollPos));
                    sessionStorage.removeItem('scrollPos');
                }
            });
        </script>
</body>

</html>
