<?php
require 'koneksi.php';
$data = [];
$query = mysqli_query($koneksi, "select * from driver");
while ($row = mysqli_fetch_object($query)) {
    $data[] = $row;
}

//tampilkan data dalam bentuk json
echo json_encode($data);
echo mysqli_error($koneksi);



/* End of file  */

/* Created at 2022-11-22 19:54:26 */
/* Mohammad Irham Akbar CRUD IONIC 6 Angular */