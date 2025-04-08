<?php
     include("kapcsolat.php");

     $resztvevok = mysqli_query($adb, "SELECT * FROM resztvevo"); 
     
?>


<!DOCTYPE html>
<html lang="hu">

<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <!-- <link rel="stylesheet" href="styles.css"> -->
     <title>Focus Kutyaiskola - Admin</title>
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

/* Cím stílusa */
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
          max-width: 150px;
          min-width:90px;
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
          max-width: 150px;
          min-width:80px;
     }

     .header h1 {
          font-size: 1.5rem;
     }
}
</style>

<body>
     <div class="container">
          <div class="header">
               <h1>Résztvevők</h1>
          </div>

          <main class="table">
               <section class="table-body">
                    <table>
                         <thead>
                              <tr>
                                   <th> ID </th>
                                   <th> Név </th>
                                   <th> Kutya név </th>
                                   <th> Tanfolyam ID </th>
                                   <th> Email </th>
                                   <th> Dátum </th>
                                   <th> Módosít </th>
                                   <th> Töröl </th>
                              </tr>
                         </thead>
                         <tbody>
                         <?php
                                   if ($resztvevok->num_rows > 0) {
                                        while ($row = $resztvevok->fetch_assoc()) {
                                             echo "<tr>
                                                       <td>".(!empty($row['r_id']) ? $row['r_id'] : '-')."</td>
                                                       <td>".(!empty($row['r_u_nev']) ? $row['r_u_nev'] : '-')."</td>
                                                       <td>".(!empty($row['r_d_nev']) ? $row['r_d_nev'] : '-')."</td>
                                                       <td>".(!empty($row['r_t_id']) ? $row['r_t_id'] : '-')."</td>
                                                       <td>".(!empty($row['r_email']) ? $row['r_email'] : '-')."</td>
                                                       <td>".(!empty($row['r_datum']) ? $row['r_datum'] : '-')."</td>
                                                       <td><i class='bx bxs-pencil' style='color: green;'></i></td>
                                                       <td><i class='bx bxs-trash-alt' style='color: red;'></i></td>
                                                  </tr>";
                                        }
                                   } 
                         ?>
                         </tbody>
                    </table>
               </section>
          </main>
     </div>
</body>

</html>