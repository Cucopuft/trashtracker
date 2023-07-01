import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              // width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              // child: Image.asset('assets/trash_logo.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Reset Password',
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff373737)),
            ),
            SizedBox(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Your Password',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffF7F3F3)),
                        child: TextField(
                          style: GoogleFonts.roboto(
                            color: const Color(0xffADADAD),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.key,
                              color: Color(0xffADADAD),
                            ),
                            hintText: 'Enter your reset password',
                            hintStyle: TextStyle(
                              color: Color(0xffADADAD),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xff1DA48C),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Reset Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
