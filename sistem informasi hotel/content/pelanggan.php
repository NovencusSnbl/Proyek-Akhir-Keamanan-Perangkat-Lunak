<?php
  $pelanggan = mysqli_query($connect, "SELECT * FROM pelanggan ORDER BY idpelanggan DESC");
?>
<?php
    require 'functions.php';
  if(isset($_POST['submit'])) { 
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $no_ktp = $_POST['no_ktp'];
    $alamat = $_POST['alamat'];
    $telepon = $_POST['telepon'];
    $password = password_hash($_POST['password'],PASSWORD_DEFAULT);

    function generateRandomString($length = 25) {
    $characters = '0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
    $randomString =generateRandomString(6);


    $result =mysqli_query($conn, "SELECT telepon FROM pelanggan WHERE telepon = '$telepon'");

  if (mysqli_fetch_assoc($result)) {
    echo "
      <script>
        alert('telepon sudah terdaftar!');
        document.location.href = 'pelanggan.php'
      </script>
    ";
    return false;
  }


    $result = mysqli_query($connect, "INSERT INTO pelanggan (nama, email, alamat, no_ktp, telepon,password,otp) VALUES ('$nama', '$email', '$alamat', '$no_ktp', '$telepon', '$password','$randomString')");


    header("location: pelanggan.php");
  }
?>
  <div class="col-md-6 col-md-offset-3">
    <div class="card">
      <div class="header">
        <h4 class="title">Pelanggan</h4>
      </div>
      <div class="content">
        
  </div>
</div>
</div>

  <div class="col-md-12">
<div class="card">
  <div class="content">
    <div class="content table-responsive table-full-width">
      <?php if (empty($pelanggan)): ?>
      <h3>Data Pelanggan kosong !</h3>
      <?php else: ?>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Alamat</th>
            <th>No KTP</th>
            <th>Telepon</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($pelanggan as $k => $v): ?>
          <tr>
            <td>
              <?php echo $v['idpelanggan']; ?> 
            </td>
            <td>
              <?php echo $v['nama']; ?> 
            </td>
            <td>
              <?php echo $v['alamat']; ?> 
            </td>
            <td>
              <?php echo $v['no_ktp']; ?> 
            </td>
            <td>
              <?php echo $v['telepon']; ?>
            </td>
            <td>
              <a href="pelanggan.php?aksi=edit&id=<?php echo $v['idpelanggan']; ?>" class="btn btn-success btn-fill btn-sm">Edit</a>
              <a href="pelanggan.php?aksi=hapus&id=<?php echo $v['idpelanggan']; ?>" class="btn btn-danger btn-fill btn-sm">Hapus</a>
            </td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
      <?php endif; ?>
    </div>
  </div>
  </div>
  </div>