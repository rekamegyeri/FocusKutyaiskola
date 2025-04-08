<style>
@import 'https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css';

.navbar {
 display: flex;
 justify-content: space-between;
 align-items: center;
 background-color: #895159;
 padding: 10px 10%;
 position: relative;
 z-index: 10;
 font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.logo img {
 height: 40px;
}

.nav-links {
 display: flex;
 list-style: none;
}

.nav-links li {
 margin: 0 15px;
}

.nav-links a {
 text-decoration: none;
 color: white;
 font-size: 19px;
 transition: color 0.3s ease;
 font-weight: 600;
 padding: 15px;
}

.nav-links a:hover {
 color: #e99c87;
}

.user-icon i{
 font-size: 2rem;
 cursor: pointer;
 color: #fffcf5;
 padding: 3px;
 align-items: center;
}

.user-icon i:hover{
 color: #e99c87;
}

.hamburger {
 display: none;
 cursor: pointer;
 flex-direction: column;
 gap: 5px;
}

.hamburger .bar {
 width: 25px;
 height: 3px;
 background-color: white;
 border-radius: 5px;
}

.profilkep{
     width: 40px;
     height: 40px;
     border-radius: 100%;
     border: 2px #e9dddd solid;
     margin: 5px;
     
}

.kilep-btn{
     margin: 5px;
     
}

.user-icon {
    display: flex;                  
    align-items: center;            
    justify-content: center;        
    gap: 10px;                     
}



@media (max-width: 992px){
     .nav-links {
      position: absolute;
      top: 60px;
      left: 0;
      width: 100%;
      background-color: #895159;
      display: none;
      flex-direction: column;
      align-items: center;
      gap: 20px;
      padding: 20px 0;
     }
   
     .nav-links li {
       margin: 0;
     }
   
     .nav-links a {
       font-size: 18px;
     }
   
     .hamburger {
       display: flex;
     }
   
     .nav-links.active {
       display: flex;
     }
}
</style>


     <header> 
          <nav class="navbar"> 
               <div class="logo"> 
                    <a href="./?p=admin"><img src="/kezelopult/adminlogo.png"  alt="AdminLogo"> </a>
               </div> 
               <ul class="nav-links"> 
                    <li><a href="/#kurzusok">Kurzusaink</a></li> 
                    <li><a href="/#oktatok">Oktatóink</a></li> 
                    <li><a href="?p=arlista" target="_blank">Árlistánk</a></li> 
                    <li><a href="/#kapcsolat">Kapcsolat</a></li> 
               </ul> 
               <div class="user-icon"> 
               <?php
                    if(isset($_SESSION['u_id'])) {
          
                         if (isset($_SESSION['u_profkep_nev'])) {
                              print "  <a href='?p=adatlapom' title='Adatlap'><img src='./profkepek/".$_SESSION['u_profkep_nev']."' class='profilkep'></a>
                                        <a href='?p=kilepes' class='kilep-btn' title='Kilépés'><i class='bx bx-log-out-circle bx-flip-horizontal'></i></a>
                              ";
                         }
                         else{
                              print "   <a href='?p=adatlapom' title='Adatlap'><i class='bx bxs-user-check' style='font-size: 2.5rem;'></i></a>
                                        <a href='?p=kilepes' class='kilep-btn' title='Kilépés'><i class='bx bx-log-out-circle bx-flip-horizontal' ></i></i></a>
                              ";
                         }
                    }
                    else{
                         print "<a href='?p=login' title='Belépés'> <i class='bx bxs-user'></i> </a>";
                    }
               ?>
                    
               </div> 
               <div class="hamburger" id="hamburger"> 
                    <span class="bar"></span> 
                    <span class="bar"></span> 
                    <span class="bar"></span> 
               </div> 
          </nav> 
     </header>










     <script >
          const hamburger = document.getElementById('hamburger'); 
          const navLinks = document.querySelector('.nav-links'); 

          hamburger.addEventListener('click', () => { 
               navLinks.classList.toggle('active'); 
          });
     </script>
