import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/login_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // To remove debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // AppBar with gradient background
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0), // Set height of AppBar
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xffb31837), Color(0xff391a3a)],
                begin: Alignment.center,
                // end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent, // Make AppBar background transparent to show the gradient
              elevation: 0, // Remove shadow for the AppBar
              actions: [
                // Popup menu
                PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        value: 'Profile',
                        child: Text('Profile'),
                      ),
                      PopupMenuItem(
                        value: 'Settings',
                        child: Text('Settings'),
                      ),
                      PopupMenuItem(
                        value: 'Logout',
                        child: Text('Logout'),
                      ),
                    ];
                  },
                  icon: Icon(Icons.more_horiz_outlined, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        // Scaffold background with gradient
        body: LoginWidget(),
      ),
    );
  }
}
