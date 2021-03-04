<?php
  $pelanggan = mysqli_query($connect, "SELECT * FROM pelanggan ORDER BY idpelanggan DESC");
?>
<?php
    require 'functions.php';
    require 'PHPMailer/PHPMailerAutoload.php';
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
        document.location.href = 'registrasi.php'
      </script>
    ";
    return false;
  }


    $result = mysqli_query($connect, "INSERT INTO pelanggan (nama, email, alamat, no_ktp, telepon,password,otp) VALUES ('$nama', '$email', '$alamat', '$no_ktp', '$telepon', '$password','$randomString')");

      $result = mysqli_query($con, $query);
      $row = mysqli_fetch_array($result);
      $mail = new PHPMailer;

      //$mail->SMTPDebug = 3;                               // Enable verbose debug output

    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->Username = 'novencussinambela00@gmail.com';                 // SMTP username
    $mail->Password = '20001107nvs';                           // SMTP password
    $mail->SMTPSecure = 'ssl';                            // Enable TLSs encryption, `ssl` also accepted
    $mail->Port = 465;                                    // TCP port to connect to

    $mail->setFrom('novencussinambela00@gmail.com', 'admin Hotel');
    $mail->addAddress($email, 'USER');     // Add a recipient
    //$mail->addAddress('ellen@example.com');               // Name is optional
    $mail->addReplyTo('info@example.com', 'Information');
    $mail->addCC('cc@example.com');
    $mail->addBCC('bcc@example.com');

    $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
    $mail->isHTML(true);                                  // Set email format to HTML

    $mail->Subject = 'Pengaktifan Akun Pelanggan';
    $mail->Body    = 'Kode OTP anda adalah '.$randomString;
    $mail->AltBody = 'Semoga Sukses terus ya :)';

    if(!$mail->send()) {
        echo 'Message could not be sent.';
        echo 'Mailer Error: ' . $mail->ErrorInfo;
    } else {
        echo 'Message has been sent';
    }

    echo "
      <script>
      alert('Sukses Mendaftar!');
       document.location.href = 'login.php';
      </script>
      ";

  }
?>
  <div class="col-md-6 col-md-offset-3">
    <div class="card">
      <div class="header">
        <h4 class="title">Pelanggan</h4>
      </div>
      <div class="content">
        <form method="post" action="<?php $_SERVER['PHP_SELF']; ?>">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label>Nama</label>
                <input type="text" name="nama" class="form-control border-input" placeholder="Nama" value="">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label>Email</label>
                <input type="text" name="email" class="form-control border-input" placeholder="Email" value="">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label>No KTP</label>
                <input type="text" name="no_ktp" class="form-control border-input" placeholder="No KTP" value="">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label>Alamat</label>
                <input type="text" name="alamat" class="form-control border-input" placeholder="Alamat" value="">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label>No Telp</label>
                <input type="text" name="telepon" class="form-control border-input" placeholder="No Telp" value="">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control border-input" placeholder="Password" value="">
              </div>
            </div>
          </div>
          <div class="text-center">
            <button type="submit" class="btn btn-info btn-fill btn-wd" name="submit">Tambah Pelanggan</button>
          </div>
          <div class="clearfix"></div>
      </div>
    </div>
    </form>
  </div>
  <div class="col-md-12">
  </div>