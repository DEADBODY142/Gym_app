import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/form_signin.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xffb31837), Color(0xff391a3a)],
              begin: Alignment.center,
              // end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            //* Add appbar height
            toolbarHeight: 150,
            title: Padding(
              padding: const EdgeInsets.only(top: 90, bottom: 50),
              child: Text(
                "Hello \nSign In!",
                style: TextStyle(color: Colors.white, fontSize: 34),
              ),
            ),
            actions: [
              //* Popup menu
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(value: 'Profile', child: Text('Profile')),
                    PopupMenuItem(value: 'Settings', child: Text('Settings')),
                    PopupMenuItem(value: 'Logout', child: Text('Logout')),
                  ];
                },
                icon: Icon(Icons.more_horiz_outlined, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      // ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xffb31837), Color(0xff391a3a)],
              begin: Alignment.center,
              // end: Alignment.bottomRight,
            ),
          ),

        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              
            ),
            
            
            child: SizedBox(
              // height: double.infinity, //* to make height take full
            
            child: FormSignin(),
          ),
        ),
        ),
      ),
    );
  }
}
