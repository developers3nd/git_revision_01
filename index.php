<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | SHOP IMS</title>
    <!-- Meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>
        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <!-- favicon -->
    <link href="Logo/logo.png" rel="icon">
    <!--stylesheets-->
    <link href="pages/dist/css/login.css" rel='stylesheet' type='text/css' media="all">
    <!--//style sheet end here-->
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700" rel="stylesheet">
</head>
   <body style="background: url(pages/dist/img/shop.jpg) !important; background-size:cover !important; background-repeat:no-repeat !important;">
      <div class="mid-class">
         <div class="art-right-w3ls">
            <h2>Login Here</h2>
            <form action="index.php" method="post">
               <div class="main">
                  <div class="form-left-to-w3l">
                     <input type="text" name="email" placeholder="Email" required>
                  </div>
                  <div class="form-left-to-w3l ">
                     <input type="password" name="password" placeholder="Password">
                     <div class="clear"></div>
                  </div>
               </div>
               <div class="clear"></div>
               <div class="btnn">
                <input type="submit" name="login" value="Login" style="background-color:#00af91; border:none; padding:10px 30px 10px 30px; border-radius:10px; cursor:pointer; color:#FFF; font-size:16px;">
                    
            <?php 
                include('connect.php');
                if(isset($_POST['login'])){	
                    $email = $_POST['email'];
                    $pass = $_POST['password'];
                    $sql = "select * from tbluser where email = '$email' and password='$pass'";
                    $res = mysqli_query($con,$sql);
                    if(mysqli_num_rows($res) > 0){
                        $data = mysqli_fetch_array($res);
                        $id = $data['0'];
                        $name = $data['1'];
                        $email = $data['7'];
                        $role = $data['5'];
                        $profile = $data['6'];
                        session_start();
                            $_SESSION["id"] = $id;
                            $_SESSION["name"] = $name;
                            $_SESSION["email"] = $email;
                            $_SESSION["role"] = $role;
                            echo"<script>
                              window.location = 'pages/dashboard/design/index.php';
                            </script>";
                    }else{
                        echo"<span style='color:#FFF; text-shadow:1px 1px 1px #333;'>(Invalid Email and Password)</span>";
                    }
                }
            ?>
               </div>
            </form>
         </div>
         <div class="art-left-w3ls" style="background-color:#191919;">
            <h1 class="header-w3ls" align="center">
               <img src="Logo/logo2.png" height="260">
            </h1>
         </div>
      </div>
      <footer class="bottem-wthree-footer" align="center">
        <div class="copyright float-right" id="date" style="color:#FFF;">
            , Design By 
            <a href="https://www.fastdigitech.com" target="_blank"><b style="color:#00af91;">Fast DigiTech</b></a> |
            Developer <a href="https://facebook.com/ArrminSol" target="_blank"><b style="color:#00af91;">Rameez Ahmed</b></a>
        </div>
      </footer>
      <script>
        const x = new Date().getFullYear();
        let date = document.getElementById('date');
        date.innerHTML = '&copy; ' + x + date.innerHTML;
      </script>
</body>
</html>