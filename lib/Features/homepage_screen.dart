import 'package:app_trash2/Features/history.dart';
import 'package:app_trash2/Features/scanning.dart';
import 'package:app_trash2/Features/tracking.dart';
import 'package:app_trash2/Features/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int index = 0;
  final screens = [
    const UserProfile(),
    const Tracking(),
    const Scanning(),
    History(),
  ];
  final userdata = GetStorage();
  //shared
  String username = "";
  Future<void> getusername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    getusername();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Color(0xffE5E5E5),
              labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ))),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            animationDuration: const Duration(seconds: 1),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.people_alt_rounded,
                  color: Color(0xff1DA48C),
                ),
                selectedIcon: Icon(
                  Icons.people,
                  color: Color(0xff1DA48C),
                ),
                label: 'User Profile',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.track_changes_rounded,
                  color: Color(0xff1DA48C),
                ),
                selectedIcon: Icon(
                  Icons.track_changes,
                  color: Color(0xff1DA48C),
                ),
                label: 'Tracking',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.qr_code_rounded,
                  color: Color(0xff1DA48C),
                ),
                selectedIcon: Icon(
                  Icons.qr_code,
                  color: Color(0xff1DA48C),
                ),
                label: 'Scanning',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.history_rounded,
                  color: Color(0xff1DA48C),
                ),
                selectedIcon: Icon(
                  Icons.history,
                  color: Color(0xff1DA48C),
                ),
                label: 'History',
              ),
            ],
          ),
        ),
      );
}
