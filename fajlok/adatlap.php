<?php
    include ("kapcsolat.php");
?>


    <style>
        @import url('https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css');


        /* Reset alap stílusok */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Alap stílusok */
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
        }

        /* Profil szekció */
        .user-profile {
            background-color: #fff;
            padding: 40px 0;
        }

        .user-profile .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .profile-header {
            margin-bottom: 30px;
        }

        .profile-header h2 {
            font-size: 1.8rem;
            color: #895159;
        }

        .profile-info {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .info-item label {
            font-weight: bold;
            color: #895159; /* Changed the label text color to #895159 */
        }

        .info-item input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #f9f9f9;
            color: #555;
        }

        /* Profile Picture Section */
        .profile-picture {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .profile-picture input {
            padding: 10px;
        }

        /* Footer stílusok */
        footer {
            background-color: #895159;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        footer p {
            font-size: 1rem;
        }

        /* Button Styles */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .button-container button, .exit-button {
            padding: 10px 20px;
            font-size: 1rem;
            /* border-radius: 5px; */
            cursor: pointer;
        }

        .modify-button {
            background-color: #895159;
            color: #f4f4f4;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            letter-spacing: 1.2px;
        }

        .modify-button:hover {
            background-color: #a77f6f;
        }

        .back-button {
            background: none;
            color: #895159;
            border: none;
            font-weight: bold;
        }

        .back-button:hover {
            text-decoration: underline;
        }


        .exit-button {
            text-align: center;
            color: red;
            border: none;
            font-weight: bold;
            text-decoration: none;
        }
        .exit-button:hover {
          color:rgb(233, 81, 81);
          text-decoration: underline; 
        }

        .delete-profkep-btn{
           color: red;
           font-size: 1.7rem;
           background: none;
           border: none;
           padding: 5px;
           cursor: pointer;
           align-items: center;
        }

        .picture-delete-input{
            display: flex;
            flex-direction: row;
        }

        @media screen and (max-width : 420px){
            .button-container{
                flex-direction: column;
                align-items: center;
            }
        }
    </style>



     <?php

        $felhasznalok =  mysqli_fetch_array(mysqli_query($adb, "SELECT * FROM user WHERE u_id= '$_SESSION[u_id]' ")) ;
        $dogs = mysqli_fetch_array(mysqli_query($adb, "SELECT * FROM dog WHERE d_u_id= '$_SESSION[u_id]' ")) ;
     ?>

    <form action="adatlap_back.php" method="POST" enctype="multipart/form-data">
    <section class="user-profile">
        <div class="container">
            <div class="profile-header">
                <h2>Üdvözöljük, <span id="username"> <?php print $felhasznalok['u_nick']; ?> </span>!</h2>
            </div>

            <div class="profile-info">
           
                 
                <div class="info-item">
                    <label for="felhasznev">Felhasználónév:</label>
                    <input type="text" id="felhasznev" name="felhasznev" value="<?php print $felhasznalok['u_nick']; ?>" >
                </div>

                <div class="info-item">
                    <label for="emailcim">E-mail cím:</label>
                    <input type="email" id="emailcim" name="felhaszmail" value="<?php print $felhasznalok['u_email']; ?>" >
                </div>

                <div class="info-item">
                    <label for="dogname">Kutyája neve:</label>
                    <input type="text" id="dogname" name="felhaszdog" value="<?php print $dogs['d_nev']; ?>" >
                </div>

                <!-- Profilkép input -->
                <div class="info-item profile-picture">
                    <label for="profile-picture">Profilkép:</label>
                    <div class="picture-delete-input">
                        <input type="file" name="uprofkep" id="profile-picture" accept="image/*">
                        <button name="delete_profkep" class="delete-profkep-btn"><i class='bx bxs-trash'></i></button>
                    </div>
                </div>
            </div>

            <div class="button-container">
            <a href="/"><button type="button" class="back-button"> <i class='bx bx-left-arrow'></i> Főoldal </button></a>
                <button type="submit" class="modify-button">Mentés</button>
                <a class="exit-button" href='?p=kilepes'>Kilépés<a/>
            </div>
        </div>
    </section>
    </form>
    


