// import 'package:app_trash2/Features/homepage_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:app_trash2/main.dart';
// import 'package:flutter/rendering.dart';
// import 'package:side_bottombar/side_bottombar.dart';
// import 'package:app_trash2/Features/homepage_screen.dart';
// class SideMenu extends StatefulWidget {
 
//   @override
//   State<SideMenu> createState() => _SideMenuState();
// }

// class _SideMenuState extends State<SideMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.white,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             child: Text(
//               'Mae',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(1.0),
//                 bottomRight: Radius.circular(1.0),
//               ),
//               color: Colors.white,
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage('assets/trash_logo.png'),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home_filled),
//             title: Text('Home'),
//             onTap: ()=>{
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()))
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: 
//             Text('profile'),
//             onTap: ()=>{
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()))
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: 
//             Text('Team'),
//             onTap: ()=>{
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()))
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: 
//             Text('more'),
//             onTap: ()=>{
//               Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePageScreen(selectedIndex:3)))
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
