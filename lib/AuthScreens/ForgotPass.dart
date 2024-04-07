// ignore_for_file: prefer_const_constructors

import '../constants.dart';

class ForgotPassScreen extends StatefulWidget {
  ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
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
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      "images/back.png",
                      height: 20,
                      width: 30,
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Forgot Passord ?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff323643),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Enter your email to get reset password link',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff606470),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                CustomInputField(
                  icon: Icons.email_outlined,
                  hintText: 'Enter your email',
                  backgroundColor: Colors.white,
                  iconColor: Color(0xff606470),
                  placeholderColor: Color(0xff606470),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: 'Send',
                  onPressed: () {
                    Get.to(() => CongratScreen());
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "images/forgot.png",
                  height: 300,
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
