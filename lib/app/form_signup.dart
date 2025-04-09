import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/shared_preference.dart';
import 'package:flutter_application_1/app/signin.dart';
import 'package:flutter_application_1/commons/custombutton.dart';
import 'package:flutter_application_1/validators/form_validators.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _passwordController.text == _confirmPasswordController.text ) {
      final mail = _emailController.text;
      final password = _passwordController.text;
      await Shared_Preference_Help.saveCredentials(mail,password);
      // If valid, perform the login action
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Form is valid')),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form is invalid')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //* to make alignment go left
                        children: [
                          Text(
                            'Full Name',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          TextFormField(
                            controller: _nameController,
                            validator: nameValidator,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'John Doe',
                              suffixIcon: Icon(Icons.check),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Phone or Gmail',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: emailValidator,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'abc@gmail.com',
                              // labelText: 'abc@gmail.com',
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
                            obscureText: _obscureText1,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              // labelText: 'Password',
                              // hintText: Icon(Icons.pattern),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText1 = !_obscureText1;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Confirm Password',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            validator: (value)=>confirmPasswordValidator(value,_passwordController.text),
                            obscureText: _obscureText2,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              // labelText: 'Password',
                              // suffixIcon: Icon(Icons.remove_red_eye_sharp),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText2 = !_obscureText2;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: CustomButton(text: 'Sign Up', onPressed: _submitForm)
                          ),
                    
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Already have account?",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignIn(),
                                        ),
                                      );
                                      print('Button 2 Pressed');
                                    },
                                    child: Text(
                                      "Sign In",
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
                        ],
                      ),
                    ),
                  ),
    );
  }
}