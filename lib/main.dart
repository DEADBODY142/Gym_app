import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/homepage.dart';
import 'package:flutter_application_1/app/login_widget.dart';
import 'package:flutter_application_1/app/second_home_page.dart';
import 'package:flutter_application_1/app/signin.dart';
import 'package:flutter_application_1/app/signup.dart';
import 'package:flutter_application_1/app/third_page.dart';
import 'package:flutter_application_1/providers/image_selection_provider.dart';
// import 'package:flutter_application_1/service/notif_service.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // NotifService().initNotification();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImageSelectionProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // To remove debug banner
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginWidget(),
        '/signup': (context) => Signup(),
        '/signin': (context) => SignIn(),
        '/homepage': (context) => Homepage(),
        '/second':(context) => SecondHomePage(),
        '/profile':(context) => ThirdPage(),
      },
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
              backgroundColor:
                  Colors
                      .transparent, // Make AppBar background transparent to show the gradient
              elevation: 0, // Remove shadow for the AppBar
              actions: [
                // Popup menu
                PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(value: 'Profile', child: Text('Profile')),
                      PopupMenuItem(value: 'Settings', child: Text('Settings')),
                      PopupMenuItem(
                        value: 'Logout',
                        child: Text('Logout'),
                        // onTap: () => Navigator.pushNamed(context, '/login'),
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
