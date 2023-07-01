// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:smart_listview_builder/smart_listview_builder.dart';

// class History extends StatefulWidget {
//   @override
//   _History createState() => _History();
// }

// class _History extends State<History> {
//   List<dynamic> jsonData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//     print('hai');
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(
//         Uri.parse('https://ttm.jenderalcorp.com/apiTrash/historyAmbil.php'));
//     print(response);

//     if (response.statusCode == 200) {
//       setState(() {
//         jsonData = jsonDecode(response.body);
//       });
//     } else {
//       print('Error fetching data from API');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1DA48C),
//         title: const Text('History'),
//       ),
//       body: SmartListViewBuilder(
//         itemCount: jsonData.length,
//         itemBuilder: (context, index) {
//           final data = jsonData[index];
//           print(data);
//           final username_driver = data['username_driver'];
//           final waktu_ambil = data['waktu_ambil'];
//           final berat = data['berat'];
//           final id_rumah = data['id_rumah'];
//           final id_pengambilan = data['id_pengambilan'];

//           return ListTile(
//             title: const Text(
//               'Waktu Ambil',
//               style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff373737)),
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Divider(
//                   height: 1,
//                   color: Colors.black,
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   'Username Driver :  $username_driver',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Text(
//                   'Waktu Ambil        :  $waktu_ambil',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Text(
//                   'Berat                     :  $berat',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Text(
//                   'ID Rumah             : $id_rumah',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Text(
//                   'ID Pengambilan : $id_pengambilan',
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
