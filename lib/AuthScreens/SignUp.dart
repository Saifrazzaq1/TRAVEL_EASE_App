// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:travel_ease/AuthServises.dart/authFun.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var text;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setState(() {
      RefreshIndicatorState;
    });
  }

  String email = '';
  String password = '';
  String fullname = '';
  String number = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFC5DDFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF323643),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomInputField(
                    key: ValueKey('fullname'),
                    icon: Icons.person_outline,
                    hintText: 'Name',
                    backgroundColor: Colors.white,
                    iconColor: Color(0xff606470),
                    placeholderColor: Color(0xff606470),
                  ),
                  SizedBox(height: 30.0),
                  CustomInputField(
                    key: ValueKey('number'),
                    icon: Icons.phone_outlined,
                    hintText: 'Phone Number',
                    backgroundColor: Colors.white,
                    iconColor: Color(0xff606470),
                    placeholderColor: Color(0xff606470),
                  ),
                  SizedBox(height: 30.0),
                  CustomInputField(
                    key: ValueKey('email'),
                    icon: Icons.email_outlined,
                    hintText: 'Email',
                    backgroundColor: Colors.white,
                    iconColor: Color(0xff606470),
                    placeholderColor: Color(0xff606470),
                  ),
                  SizedBox(height: 30.0),
                  CustomInputField(
                    key: ValueKey('password'),
                    icon: Icons.lock_outline,
                    hintText: 'Password',
                    backgroundColor: Colors.white,
                    iconColor: Color(0xff606470),
                    placeholderColor: Color(0xff606470),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  // CustomButton(
                  //   buttonText: 'Sign up',
                  //   onPressed: () async {
                  //     _formKey.currentState!.save();
                  //     try {
                  //       await AuthServices.signupUser(
                  //         email,
                  //         password,
                  //         fullname,
                  //         number,
                  //         context,
                  //       );
                  //       // Signup successful, navigate to the next screen
                  //       // Navigator.of(context).pushReplacement(
                  //       //   MaterialPageRoute(builder: (context) => NextScreen()),
                  //       // );
                  //     } catch (error) {
                  //       // Signup failed, show error message
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('Sign Up Failed'),
                  //             content: Text(
                  //                 'An error occurred during signup. Please try again.'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'),
                  //               ),
                  //             ],
                  //           );
                  //         },
                  //       );
                  //     }
                  //   },
                  // ),
                  CustomButton(
                    buttonText: 'Sign up',
                    onPressed: () async {
                      // Print the values of variables for verification
                      print('Email: $email');
                      print('Password: $password');
                      print('Fullname: $fullname');
                      print('Number: $number');

                      // Call the signup method directly
                      try {
                        await AuthServices.signupUser(
                          email,
                          password,
                          fullname,
                          number,
                          context,
                        );
                        // Signup successful, navigate to the next screen
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(builder: (context) => NextScreen()),
                        // );
                      } catch (error) {
                        // Signup failed, show error message
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Sign Up Failed'),
                              content: Text(
                                  'An error occurred during signup. Please try again.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a user ?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF606470),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());

                          // Forgot password screen
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3277D8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
