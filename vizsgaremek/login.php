







    





<style>
    @import 'https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css';
    @import 'login.css';
</style>
<main id="login-main">
    <div class="container"> 
        <div class="form-box login">
            <form action="login_back.php" method="POST">
                <h1>Bejelentkezés</h1>
                <div class="input-box">
                    <input type="text" placeholder="Felhasználónév" name="u_nick" required>
                    <i class='bx bxs-user'></i>
                </div>

                <div class="input-box">
                    <input type="password" placeholder="Jelszó" name="u_pwd" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>
                
                <button type="submit" class="btn">Belépés</button>
            </form>
        </div>

































        <div class="form-box register">
            <form action="reg_back.php" method="POST">
                <h1>Regisztráció</h1>

                <div class="input-box">
                    <input type="text" placeholder="Felhasználónév" name="u_r_nick" required>
                    <i class='bx bxs-user'></i>
                     
                </div>
                

                <div class="input-box">
                    <input type="email" placeholder="Email" name="u_r_email" required>
                    <i class='bx bxs-envelope'></i>
                     
                </div>
                

                <div class="input-box">
                    <input type="password" placeholder="Jelszó" name="u_r_pwd" required>
                    <i class='bx bxs-lock-alt'></i>
                </div>


                <div class="input-box">
                    <input type="text" placeholder="Kutyád neve" name="u_r_dname" required>
                    <i class='bx bxs-dog'></i>
                </div>


                <button type="submit" class="btn">Regisztrálás</button>
            </form>
        </div>



        

        <div class="toggle-box">
            <div class="toggle-panel toggle-left">
                <h1>Üdv újra nálunk!</h1>
                <p>Nincs még fiókod?</p>
                <button class="btn register-btn">Regisztrálj</button>
            </div>

            <div class="toggle-panel toggle-right">
                <h1>Üdv, a Focus-nál!</h1>
                <p>Van már fiókod?</p>
                <button class="btn login-btn">Jelentkezz be</button>
            </div>
        </div>

    </div>
</main>




    <script src="login.js"></script>
