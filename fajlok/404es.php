<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>404 - Hiba</title>
  <link rel="stylesheet" href="styles.css">
  <link rel="SHORTCUT ICON" href="images/ikonlogo.png"/>
</head>
<style>
     
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #895159; /* A kívánt szín */
  color: white;
  min-height: 100vh;
  text-align: center;
}

.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  flex-direction: column;
}



.error-message h1 {
  font-size: 100px;
  font-weight: bold;
}

.error-message p {
  font-size: 20px;
  margin: 10px 0;
}

a {
  color: #f0f0f0;
  text-decoration: underline;
  font-weight: bold;
}

a:hover {
  color: #ffdd99;
}



</style>


<body>
    <div class="container">
        <div class="error-message">
            <h1>404</h1>
            <p>Ez az oldal nem található!</p>
            <p>Próbálj meg visszatérni a <a href="/focus/vizsgaremek/">főoldalra</a>.</p>
        </div>
    </div>
</body>
</html>
