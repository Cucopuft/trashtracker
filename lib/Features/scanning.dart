import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Scanning extends StatefulWidget {
  const Scanning({super.key});

  @override
  State<Scanning> createState() => _ScanningState();
}

class _ScanningState extends State<Scanning> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.QR)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;

      // showAlert(QuickAlertType.success);
      postData();
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      //log('barcodeScanRes');
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      // _namaDriver = prefs.getString('username') ?? '';
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> postData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var namaDriver = preferences.getString('username') ?? '';
    // preferences.getString('username', usernameController.text);
    String url = 'https://ttm.jenderalcorp.com/apiTrash/prosesAmbilSampah.php';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody =
        '{"qrcode": "$_scanBarcode", "username_driver": "$namaDriver"}';

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var kiriman = json.decode(response.body);
        if (kiriman['pesan'] == 'berhasil') {
          print('data ditemukan');
          print('${kiriman['data']}');

          showAlert(
            QuickAlertType.success,
          );
        } else {
          //ini jika kondisi gagal login
          print(kiriman);
          showAlert(QuickAlertType.error);
        }
        // Berhasil mengirim data ke API
      } else {
        // Gagal mengirim data ke API
        print('Gagal mengirim data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }

  void showAlert(QuickAlertType quickAlertType) {
    QuickAlert.show(context: context, type: quickAlertType);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: const Text(
                  'Scanning QR Code',
                ),
                backgroundColor: const Color(0xff1DA48C)),
            body: Builder(builder: (BuildContext context) {
              return Container(
                alignment: Alignment.center,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      'assets/qr2.jpg',
                      width: 300,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () => scanQR(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fixedSize: const Size(200, 40),
                          backgroundColor: const Color(0xffD27C2C),
                        ),
                        child: const Text(
                          'Start QR scan',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Scan result : $_scanBarcode\n',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            })));
  }
}
