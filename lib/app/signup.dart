import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/form_signup.dart';
import 'package:flutter_application_1/commons/common.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            toolbarHeight: 150,
            title: Padding(
              padding: const EdgeInsets.only(top: 90, bottom: 50),
              child: Text(
                "Create \nYour Account",
                style: TextStyle(color: Colors.white, fontSize: 34),
              ),
            ),
            actions: [
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
      backgroundColor: Colors.red,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xffb31837), Color(0xff391a3a)],
              begin: Alignment.center,
              // end: Alignment.bottomRight,
            ),
          ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 610,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Constants().secondaryColor,
              ),
              child: FormSignup(),
            ),
          ),
        ),
      ),
    );
  }
}