<?php
require 'koneksi.php';

$input = file_get_contents('php://input');
$data = json_decode($input, true);

$isian = [];
$isian['pesan'] = '';
$username = trim($data['username_driver']);
$password = md5(trim($data['password_driver']));

if ($username != '' and $password != '') {
    $query = mysqli_query($koneksi, "select * from driver where username_driver ='$username' and password_driver='$password'");
    $jumlah = mysqli_num_rows($query);

    if ($jumlah == 1) {
        $row = mysqli_fetch_object($query);
        $isian['data'] = $row;
        $isian['pesan'] = 'berhasil';
    } else {
        $isian['pesan'] = 'tidak ditemukan';
    }
}

echo json_encode($isian);
echo mysqli_error($koneksi);




/* End of file  */

/* Created at 2022-11-22 19:54:26 */
/* Mohammad Irham Akbar CRUD IONIC 6 Angular */