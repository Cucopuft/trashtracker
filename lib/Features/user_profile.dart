import 'package:app_trash2/Features/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String username = '';
  String nama = '';

  TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
  }

  @override
  void initState() {
    super.initState();
    print('halo');
    getusername();
  }

  Future<void> getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('username') ?? ''; // default value jika null
    String value_nama = prefs.getString('nama') ?? '';
    setState(() {
      username = value;
      nama = value_nama;
    });
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse('YOUR_PHP_ENDPOINT_URL'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final user = jsonData['user'];

        setState(() async {
          nama = user['nama'];
        });
      } else {
        // Handle error scenario when the request fails
        print('Failed to fetch user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Failed to fetch user data. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('User Profile'),
            backgroundColor: const Color(0xff1DA48C)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/profile.jpg',
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Username : $username',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nama : $nama',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      logOut(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: const Size(150, 40),
                      backgroundColor: const Color(0xffD27C2C),
                    ),
                    child: const Text(
                      'Log Out',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
