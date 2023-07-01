
<?php 
//header untuk menangani cors policy
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, HEAD, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: X-Requested-With');
header('Content-Type: application/json; charset=utf-8');
//membuat variable koneksi ke mysql
$koneksi = mysqli_connect('localhost','root','','trash_tracker') or die ('koneksi gagal');




/* End of file  */

/* Created at 2022-11-22 19:54:26 */
/* Mohammad Irham Akbar CRUD IONIC 6 Angular */