import 'package:flutter/material.dart';
import 'package:app_trash2/Features/login_screen.dart';
import 'package:flutter/rendering.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return TextField(
                      decoration: InputDecoration(labelText: 'Email'),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return TextField(
                      decoration: InputDecoration(labelText: 'Username'),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return TextField(
                      decoration: InputDecoration(labelText: 'Address'),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return TextField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    );
                  },
                ),
                SizedBox(height: 16.0),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return TextField(
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                    );
                  },
                ),
                const SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
                          ' Create',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
