<?php
require 'koneksi.php';

$input = file_get_contents('php://input');
$data = json_decode($input, true);

$isian = [];
$isian['pesan'] = '';
$qrcode = trim($_POST['qrcode']);
$username_driver = trim($_POST['username_driver']);
if ($qrcode != '') {
    $query = mysqli_query($koneksi, "select * from rumah where id_rumah ='$qrcode'");
    $jumlah = mysqli_num_rows($query);

    if ($jumlah == 1) {
        $row = mysqli_fetch_object($query);

        date_default_timezone_set('Asia/Jakarta');
        $waktu_ambil = date('Y-m-d H:i:s');
        $tanggal_sekarang = date('Y-m-d');
        $cek_data = mysqli_query($koneksi, "select * from pengambilan_sampah where id_rumah='$qrcode' and waktu_ambil like '$tanggal_sekarang%'");
        $jumlah_ambil = mysqli_num_rows($cek_data);
        if ($jumlah_ambil == 0) {
            $isian['data'] = $row;
            $isian['pesan'] = 'berhasil';
            $insert_pengambilan = mysqli_query($koneksi, "insert into pengambilan_sampah (id_rumah,username_driver,waktu_ambil)values($qrcode,'$username_driver','$waktu_ambil')");
        } else {
            $isian['pesan'] = 'Hari ini rumah sudah di ambil sampahnya';
        }
    } else {
        $isian['pesan'] = 'tidak ditemukan';
    }
}

echo json_encode($isian);
echo mysqli_error($koneksi);




/* End of file  */

/* Created at 2022-11-22 19:54:26 */
/* Mohammad Irham Akbar CRUD IONIC 6 Angular */