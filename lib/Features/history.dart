import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smart_listview_builder/smart_listview_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  List<dynamic> jsonData = [];

  @override
  String username = '';
  String nama = '';
  void initState() {
    super.initState();
    print('hai');
    getusername();
  }

  Future<void> getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('username') ?? ''; // default value jika null
    String value_nama = prefs.getString('nama') ?? '';
    setState(() {
      username = value;
      nama = value_nama;
      fetchData(username);
    });
  }

  Future<void> fetchData(String username) async {
    // Map<String, dynamic> parameters = {'username_driver': username};
    String url =
        "https://ttm.jenderalcorp.com/apiTrash/historyAmbil.php?username_driver=$username";
    final response = await http.get(Uri.parse(url));
    print(url);

    if (response.statusCode == 200) {
      setState(() {
        jsonData = jsonDecode(response.body);
      });
    } else {
      print('Error fetching data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1DA48C),
        title: const Text('History Pengambilan Sampah'),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Expanded(
          child: SmartListViewBuilder(
            itemCount: jsonData.length,
            itemBuilder: (context, index) {
              final data = jsonData[index];
              print(data);
              final username_driver = data['username_driver'];
              final waktu_ambil = data['waktu_ambil'];
              final berat = data['berat'];
              final nama_customer = data['nama_customer'];
              final id_pengambilan = data['id_pengambilan'];

              return Card(
                  child: ListTile(
                title: Text(
                  'Terjadwal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff373737),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Usrname Driver   : $username_driver',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737),
                      ),
                    ),
                    Text(
                      'Berat                     :  $berat',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Customer             : $nama_customer',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'ID Pengambilan  :  $id_pengambilan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff373737),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '$waktu_ambil',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ));
            },
          ),
        )
      ]),
    );
  }
}
