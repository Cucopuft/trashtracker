import 'dart:convert';
import 'package:app_trash2/Features/create_account.dart';
import 'package:app_trash2/Features/reset_password.dart';
import 'package:app_trash2/Features/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> postData() async {
    String url = 'https://ttm.jenderalcorp.com/apiTrash/prosesLoginDriver.php';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String username = usernameController.text;
    String password = passwordController.text;
    String jsonBody =
        '{"username_driver": "$username", "password_driver": "$password"}';

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        var kiriman = json.decode(response.body);
        if (kiriman['pesan'] == 'berhasil') {
          //ini jika berhasil login
          print('data ditemukan');
          print('${kiriman['data']}');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString(
              'username', '${kiriman['data']['username_driver']}');
          preferences.setString('nama', '${kiriman['data']['nama_driver']}');

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePageScreen()),
            (route) => false,
          );
        } else {
          //ini jika kondisi gagal login
          print('username dan password salah');
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              // width: double.infinity,
              height: MediaQuery.of(context).size.height / 6,
              child: Image.asset('assets/Trash.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Trash Tracker',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff373737)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Your Path to Cleaner Futures!',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xff373737),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Username',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffF7F3F3)),
                          child: TextFormField(
                            controller: usernameController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xffADADAD),
                              ),
                              hintText: 'Enter Your Name: ',
                              // ${userdata.read('username')}

                              hintStyle: TextStyle(
                                color: Color(0xffADADAD),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffF7F3F3),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xffADADAD),
                              ),
                              hintText: 'Enter Your Password',
                              hintStyle: TextStyle(
                                color: Color(0xffADADAD),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new ResetPasswordScreen())),
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffD27C2C)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        GestureDetector(
                          onTap: () {
                            postData();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePageScreen()
                            //         )
                            //       );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff1DA48C),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  ' Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccountScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff1DA48C),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePageScreen()));
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePageScreen()));
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
