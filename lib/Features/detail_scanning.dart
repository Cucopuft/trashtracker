import 'package:app_trash2/Features/detail_produk_scanning.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScanning extends StatefulWidget {
  // const DetailScanning({super.key});
  final String _scanBarcode;
  DetailScanning(this._scanBarcode);

  @override
  State<DetailScanning> createState() => _DetailScanningState();
}

class _DetailScanningState extends State<DetailScanning> {
  Future<DetailProdukScanning>() async {
    final response = await http.get(Uri.parse(
        'https://ttm.jenderalcorp.com/apiTrash/prosesAmbilSampah.php'));

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<DetailProdukScanning>(
            // future: FutureDetailProdukScanning,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Text('DetailProdukScanning');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
