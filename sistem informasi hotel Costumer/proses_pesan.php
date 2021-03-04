<?php
require_once('lib/connect.php');
define('AES_256_CBC', 'aes-256-cbc');
$tipe = $_POST['idtipe_kamar'];
$sql = "SELECT *  FROM tipe_kamar WHERE idtipe_kamar = $tipe";
$query = mysqli_query($connect,$sql);
$row = mysqli_fetch_array($query);
$harga = $row['harga'];

//check in
$jml_kamar = $_POST['jml_kamar'];
$biaya = $jml_kamar * $harga;
$idpelanggan = $_POST['idpelanggan_lama'];
$tgl_check_in = $_POST['tgl_check_in'];
$tgl_check_out = $_POST['tgl_check_out'];
$idruang_kamar = $_POST['idruang_kamar'];

$sql_check_in = "INSERT INTO check_in (jumlah, biaya, tgl_check_in, idpelanggan) VALUES ('$jml_kamar', '$biaya', '$tgl_check_in', '$idpelanggan');";
$query = mysqli_query($connect,$sql_check_in);

$idcheck_in = mysqli_insert_id($connect);

foreach ($idruang_kamar as $k => $v) {
  $sql_check_out = "INSERT INTO check_in_kamar (idcheck_in, idruang_kamar) VALUES ('$idcheck_in', '$v');";
  $query = mysqli_query($connect,$sql_check_out);
  $sql_ruang = "UPDATE ruang_kamar SET status = '0' WHERE ruang_kamar.idruang_kamar = $v;";
  $query = mysqli_query($connect,$sql_ruang);

}

$sql_check_out = "INSERT INTO check_out (tgl_check_out, idcheck_in) VALUES ('$tgl_check_out', '$idcheck_in');";
$query = mysqli_query($connect,$sql_check_out);

function generateRandomString($length = 25) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
//usage 
$myRandomString = generateRandomString(12);



$textToEncrypt = $myRandomString;
$key = "Sipinter123@#@";
$iv = "1251632135716362";
$method="AES-256-CTR";
$encrypted = openssl_encrypt($textToEncrypt, $method, $key, 0, $iv);
  
$sql_order = "INSERT INTO `order` (`idorder`, `status_order`, `idcheck_in`, `tgl_order`,`code`) VALUES (NULL, 'baru', '$idcheck_in', CURRENT_TIMESTAMP,'$encrypted');";

$query = mysqli_query($connect,$sql_order);


?>

<?php include_once('functions.php'); ?>
<?php include_once('lib/header.php'); ?>
<div class="wrapper">
  <?php include_once('lib/sidebar.php'); ?>
  <div class="main-panel">
    <?php include_once('lib/navbar.php'); ?>
    <div class="content">
      <div class="container-fluid">
        <div class="row">
              <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title">Kode Check-out</h4>
                        </div>
                        <div class="modal-body">
                            <h4>Code Check In anda <?php echo $myRandomString; ?></p>
                              <p>Harap Simpan dan jangan hilang!</p>
                        </div>
                       
                    </div>

                </div>
            </div>
          <?php include_once('content/index.php'); ?>
        </div>
      </div>
    </div>

    <?php include_once("lib/footer-top.php"); ?>

  </div>
</div>

<?php include_once('lib/footer.php'); ?>
<script>
  $('#myModal').modal('show');
</script>
