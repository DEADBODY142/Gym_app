import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/signin.dart';
import 'package:flutter_application_1/app/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  // URL to be opened when the button is clicked
  final Uri _url = Uri.parse('https://facebook.com');
  final Uri _url1 = Uri.parse('https://x.com');
  final Uri _url2 = Uri.parse('https://youtube.com');

  // Function to launch the URL
  Future<void> _launchFacebook() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  Future<void> _launchX() async {
    if (!await launchUrl(_url1)) {
      throw 'Could not launch $_url1';
    }
  }
  Future<void> _launchYoutube() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url2';
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xffb31837), Color(0xff391a3a)],  // Red to Blue gradient
              begin: Alignment.center,
              // end: Alignment.,
            ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Image.asset(
              'assets/images/images.png', // Path to the image in your assets folder
              width: 100.0, // Set the image width
              height: 100.0, // Set the image height
              fit: BoxFit.cover, // Control how the image scales within the space
            ),
            // First Text at the top
            Text(
              'Fitness Gym',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
      
            // Spacer (vertical space between text and buttons)
            SizedBox(height: 80),
      
            // Second Text
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            // Spacer (vertical space between second text and buttons)
            SizedBox(height: 20),
      
            // Button 1
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>SignIn())
                );
                print('Button 1 Pressed');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40), // Width: 200, Height: 50
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.white, // Border color
                  width: 2, // Border width
                ),
                elevation: 0, //to make transparent work and remove shadows
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(12), // Optional: rounded corners
                // ),
              ),
              child: Text('Sign In', style: TextStyle(fontSize: 18)),
            ),
      
            // Spacer (vertical space between the buttons)
            SizedBox(height: 10),
      
            // Button 2
            ElevatedButton(
              onPressed: () {
                print('Button 2 Pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 40), // Width: 200, Height: 50
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text('Sign Up', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 50),
            Text(
              'Login With Social Media',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.facebook, color: Colors.white),
                IconButton(
                  onPressed: _launchFacebook,
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  color: Colors.white,
                ), // Twitter Icon)
                IconButton(
                  onPressed: _launchX,
                  icon: FaIcon(FontAwesomeIcons.twitter),
                  color: Colors.white,
                ), // Twitter Icon)
                IconButton(
                  onPressed: _launchYoutube,
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  color: Colors.white,
                ), // Twitter Icon)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
