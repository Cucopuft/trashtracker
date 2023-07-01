<?php
require 'koneksi.php';

$input = file_get_contents('php://input');
$data = json_decode($input,true);
// print_r($data);
// die();
$pesan = [];
$nama = $data['name'];
$email = $data['email'];
$alamat = $data['address'];

if($nama!='' and $email!='' and $alamat != ''){
	$query = mysqli_query($koneksi,"insert into orang(nama,email,alamat) values('$nama','$email','$alamat')");
	$pesan ['status'] = 'data berhasil input';

}

echo json_encode($pesan);
echo mysqli_error($koneksi);




/* End of file  */

/* Created at 2022-11-22 19:54:26 */
/* Mohammad Irham Akbar CRUD IONIC 6 Angular */