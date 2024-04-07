// ignore_for_file: prefer_const_constructors

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var text;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFC5DDFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "images/logo.png",
                  height: 190,
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 70,
                ),
                CustomInputField(
                  icon: Icons.email_outlined,
                  hintText: 'Email',
                  backgroundColor: Colors.white,
                  iconColor: Color(0xff606470),
                  placeholderColor: Color(0xff606470),
                ),
                SizedBox(height: 30.0),
                CustomInputField(
                  icon: Icons.lock_outline,
                  hintText: 'Password',
                  backgroundColor: Colors.white,
                  iconColor: Color(0xff606470),
                  placeholderColor: Color(0xff606470),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password screen
                      Get.to(() => ForgotPassScreen());
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF606470),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  buttonText: 'Login',
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '  New User?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF606470),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Forgot password screen
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        'Sign up for a new account',
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
    );
  }
}
