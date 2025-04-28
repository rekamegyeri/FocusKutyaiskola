<?php
        error_reporting(E_ALL);
        ini_set('display_errors', 1);
        
        include("kapcsolat.php");
        
        
        $muvelet = $_REQUEST['muvelet'] ?? 'lista';
        $azonosito = isset($_REQUEST['id']) ? filter_var($_REQUEST['id'], FILTER_VALIDATE_INT) : null;
        $szerkesztendo_belepes = null;
        $lista_adatok = [];
        $aktualis_oldal_url = '?p=admin';
        
        if ($muvelet === 'torles' && $azonosito) {
            $utasitas = $adb->prepare("DELETE FROM login WHERE l_id = ?");
            if ($utasitas) {
                $utasitas->bind_param('i', $azonosito);
                $utasitas->execute();
                $utasitas->close();
            }
         
        }
        
        if ($muvelet === 'mentes' && $_SERVER['REQUEST_METHOD'] === 'POST') {
            $mentendo_azonosito = filter_input(INPUT_POST, 'lid', FILTER_VALIDATE_INT);
            $datum = trim(filter_input(INPUT_POST, 'ldatum', FILTER_SANITIZE_STRING));
            $ip = trim(filter_input(INPUT_POST, 'lip', FILTER_SANITIZE_STRING));
            $sess = trim(filter_input(INPUT_POST, 'lsess', FILTER_SANITIZE_EMAIL));
            $uid = trim(filter_input(INPUT_POST, 'luid', FILTER_SANITIZE_STRING));
        
            if ($mentendo_azonosito && !empty($uid)) {
                $utasitas = $adb->prepare("UPDATE login SET l_datum = ?, l_ip = ?, l_session = ?, l_u_id = ? WHERE l_id = ?");
                if ($utasitas) {
                    $utasitas->bind_param('sssii', $datum, $ip, $sess, $uid, $mentendo_azonosito);
                    $utasitas->execute();
                    $utasitas->close();
                }
            }
         
        }
        
        if ($muvelet === 'szerkesztes' && $azonosito) {
            $utasitas = $adb->prepare("SELECT l_id, l_datum, l_ip, l_session, l_u_id FROM login WHERE l_id = ?");
            if ($utasitas) {
                $utasitas->bind_param('i', $azonosito);
                $utasitas->execute();
                $eredmeny = $utasitas->get_result();
                $szerkesztendo_belepes = $eredmeny->fetch_assoc();
                $utasitas->close();
                if (!$szerkesztendo_belepes) {
                    $muvelet = 'lista';
                }
            } else {
                $muvelet = 'lista';
            }
        }
        
        if ($muvelet !== 'szerkesztes') {
            $muvelet = 'lista';
            $eredmeny = $adb->query("SELECT * FROM login ORDER BY l_id ASC");
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


.table i {
     cursor: pointer;
     font-size: 1.2rem;
}


.table .bxs-pencil {
     color: #4caf50;
     
}

.table .bxs-trash-alt {
     color: #f44336;
     
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
                    <?= ($muvelet === 'szerkesztes') ? 'Belépés Módosítása' : 'Bejelentkezések'; ?>
                </h1>
          </div>
          
          
          <?php if ($muvelet === 'szerkesztes' && $szerkesztendo_belepes): ?>
          
              <form action="<?php echo $aktualis_oldal_url; ?>" method="POST">
                    <input type="hidden" name="muvelet" value="mentes">
                    <input type="hidden" name="lid" value="<?= htmlspecialchars($szerkesztendo_belepes['l_id']) ?>">
        
                    <div>
                        <label for="datum">Dátum:</label>
                        <input type="date" id="datum" name="ldatum" value="<?= htmlspecialchars($szerkesztendo_belepes['l_datum']) ?>">
                    </div>
                    <div>
                        <label for="ip">Ip:</label>
                        <input type="text" id="ip" name="lip" value="<?= htmlspecialchars($szerkesztendo_belepes['l_ip']) ?>">
                    </div>
                    <div>
                        <label for="sess">Session:</label>
                        <input type="text" id="sess" name="lsess" value="<?= htmlspecialchars($szerkesztendo_belepes['l_session']) ?>">
                    </div>
                    <div>
                        <label for="uid">Felhasználó ID:</label>
                        <input type="number" id="uid" name="luid" value="<?= htmlspecialchars($szerkesztendo_belepes['l_u_id']) ?>">
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
                                    <th>Dátum</th>
                                    <th>Ip</th>
                                    <th>Session</th>
                                    <th>Felhasználó ID</th>
                                    <th>Módosít</th>
                                    <th>Töröl</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($lista_adatok)): ?>
                                    <?php foreach ($lista_adatok as $belepes): ?>
                                        <tr>
                                            <td><?= htmlspecialchars($belepes['l_id']) ?></td>
                                            <td><?= htmlspecialchars($belepes['l_datum']) ?></td>
                                            <td><?= htmlspecialchars($belepes['l_ip']) ?></td>
                                            <td><?= htmlspecialchars($belepes['l_session']) ?></td>
                                            <td><?= htmlspecialchars($belepes['l_u_id']) ?></td>
                                            <td>
                                                <a href="<?= $aktualis_oldal_url ?>&muvelet=szerkesztes&id=<?= $belepes['l_id'] ?>">
                                                    <i class='bx bxs-pencil' style='color: green;'></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="<?= $aktualis_oldal_url ?>&muvelet=torles&id=<?= $belepes['l_id'] ?>"
                                                   onclick="return confirm('Biztosan törölni szeretnéd: <?= addslashes($belepes['l_id']) ?>?')">
                                                    <i class='bx bxs-trash-alt' style='color: red;'></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr><td colspan="6">Nincs elérhető belépés.</td></tr>
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
