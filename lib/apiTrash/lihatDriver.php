
<?php 
require 'koneksi.php';
$data = [];
$id = $_GET['id'];
$query = mysqli_query($koneksi,"select * from driver where username_driver ='$id'");
$jumlah = mysqli_num_rows($query);
if ($jumlah == 1) {
	$row = mysqli_fetch_object($query);
	$data = $row;
}

echo json_encode($data);
echo mysqli_error($koneksi);





/* End of file  */

/* Created at 2022-11-22 19:54:26 */
/* Mohammad Irham Akbar CRUD IONIC 6 Angular */