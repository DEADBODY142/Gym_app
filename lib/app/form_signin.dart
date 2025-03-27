import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/homepage.dart';
import 'package:flutter_application_1/app/signup.dart';
import 'package:flutter_application_1/commons/custombutton.dart';
import 'package:flutter_application_1/validators/form_validators.dart';

class FormSignin extends StatefulWidget {
  const FormSignin({super.key});

  @override
  State<FormSignin> createState() => _FormSigninState();
}

class _FormSigninState extends State<FormSignin> {
  bool _obscureText = true; //* for password visibility
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If valid, perform the login action
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>Homepage())
      );
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(SnackBar(content: Text('Form is valid')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Form is invalid')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //* to make alignment go left
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: emailValidator,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Gmail',
                        suffixIcon: Icon(Icons.mail),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: passwordValidator,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Password',
                        // suffixIcon: Icon(Icons.remove_red_eye),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !(_obscureText);
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 30),
                    //* For button
                    Center(
                      child: CustomButton(text: 'Sign In', onPressed: _submitForm)
                    ),
      
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 160.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Don't have account?",
                              style: TextStyle(fontSize: 14),
                            ),
                            InkWell(
                              onTap:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Signup(),
                                    ),
                                  ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}