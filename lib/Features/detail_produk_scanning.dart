import 'dart:ffi';

class DetailProdukScanning {
  int id_pengambilan;
  int id_rumah;
  String username_driver;
  DateTime waktu_ambil;
  Float berat;

  DetailProdukScanning(
      {required this.id_pengambilan,
      required this.id_rumah,
      required this.username_driver,
      required this.waktu_ambil,
      required this.berat});

  factory DetailProdukScanning.fromJson(Map<String, dynamic> json) {
    return DetailProdukScanning(
      id_pengambilan: json['id_pengambilan'],
      id_rumah: json['id_rumah'],
      username_driver: json['username_driver'],
      waktu_ambil: json['waktu_ambil'],
      berat: json['berat'],
    );
  }
}
