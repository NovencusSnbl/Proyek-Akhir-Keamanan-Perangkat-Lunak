<?php include_once('functions.php'); ?>
<?php include_once('lib/header.php'); ?>
<div class="wrapper">
  <?php include_once('lib/sidebar.php'); ?>
  <div class="main-panel">
    <?php include_once('lib/navbar.php'); ?>
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        <?php 
        $connect = mysqli_connect("localhost", "root", "", "unriyo_simho");
        $telepon = $_SESSION['username'];

          $query = "SELECT * FROM pelanggan WHERE telepon = '$telepon'";

          $result = mysqli_query($connect, $query);



         while ($row = mysqli_fetch_array($result))

         {
            echo "Hello ".$row["nama"];
         }

           
            
          ?>
          <?php include_once('content/index.php'); ?>
        </div>
      </div>
    </div>

    <?php include_once("lib/footer-top.php"); ?>

  </div>
</div>

<?php include_once('lib/footer.php'); ?>
