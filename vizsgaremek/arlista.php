<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="SHORTCUT ICON" href="images/ikonlogo.png"/>
    <title>Árlista</title>
</head>

<style>
    /* Alap stílusok */
* {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
 }
 
 body {
     font-family: 'Arial', sans-serif;
     background-color: #f9f9f9;
     color: #333;
     line-height: 1.6;
 }
 

 
 /* Main content */
 main {
     padding: 60px 20px;
     background-color: #fff;
     margin: 0 5%;
     border-radius: 10px;
     box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
 }
 
 /* Container központozás */
 .container {
     width: 100%;
     max-width: 1200px;
     margin: 0 auto;
     padding: 0 20px;
 }
 
 /* Árlista szekció */
 .price-list {
     margin-bottom: 60px;
 }
 
 .section-heading {
     font-size: 3.5rem;
     font-weight: 600;
     color: #895159; 
     text-align: center;
     margin-bottom: 40px;
 }
 
 .price-item {
     display: flex;
     justify-content: space-between;
     align-items: center;
     background-color: #895159;
     padding: 15px;
     margin: 30px 0;
     border-radius: 10px;
     box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
 }
 
 .price-item:hover {
     box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
 }
 
 .course-title {
     font-size: 1.5rem;  
     font-weight: 600;
     color: #fff;
 }
 
 .price {
     font-size: 1.5rem;
     font-weight: 700;
     color: #f1f1f1;
 }
 
 /* Fizetési információk */
 .payment-info {
     background-color: #895159;
     padding: 30px;
     border-radius: 10px;
     box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
     text-align: center;
     color: #fff;
 }
 
 .payment-info h2 {
     font-size: 2.2rem;
     color: #fff;
     margin-bottom: 20px;
     border-bottom: #fff solid 2px;
 }
 
 .payment-info p {
     font-size: 1.1rem;
     color: #fff;
     margin-bottom: 10px;
     letter-spacing: 1.3px;
 }
 
 
 
 /* Reszponzív dizájn */
 @media (max-width: 768px) {
     main {
         margin: 0 5%;
     }
 
     header h1 {
         font-size: 2.5rem;
     }
 
     .price-item {
         padding: 15px;
         flex-direction: column;
         align-items: flex-start;
     }
 
     .price-item .price {
         margin-top: 10px;
     }
 
     .course-title {
         font-size: 1.6rem;
     }
 
     .price {
         font-size: 1.3rem;
     }
 }
 
</style>

<body>

   

    <!-- Árlista szekció -->
    <main>
        <section class="price-list">
            <div class="container">
                <h2 class="section-heading">Árlista</h2>
                <div class="price-item">
                    <div class="course-title">Kölyök kutya kurzus</div>
                    <div class="price">40.000 Ft</div>
                </div>
                <div class="price-item">
                    <div class="course-title">Felnőtt kutya kurzus</div>
                    <div class="price">35.000 Ft</div>
                </div>
                <div class="price-item">
                    <div class="course-title">Idős kutya kurzus</div>
                    <div class="price">35.000 Ft</div>
                </div>
                <div class="price-item">
                    <div class="course-title">Agility kurzus</div>
                    <div class="price">45.000 Ft</div>
                </div>
                <div class="price-item">
                    <div class="course-title">Őrző-védő kurzus</div>
                    <div class="price">50.000 Ft</div>
                </div>
                <div class="price-item">
                    <div class="course-title">Egyéni oktatás</div>
                    <div class="price">10.000 Ft/alkalom</div>
                </div>
            </div>
        </section>

        <!-- Fizetési információk szekció -->
        <section class="payment-info">
            <div class="container">
                <h2 class="section-heading">Fizetési információk</h2>
                <p>A fizetés kizárólag a helyszínen történhet, <b>készpénzes</b> vagy <b>banki átutalásos</b> formában.</p>
                <p>A fizetés a <b>tanfolyam kezdete előtt</b> esedékes, ezért javasolt legalább 10 perccel korábban érkezni.</p>
            </div>
        </section>
    </main>


</body>
</html>
