// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '../constants.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var text;
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> dataList = [
    {"name": "My Wallet", "icon": Icons.wallet_outlined},
    {"name": "Language", "icon": Icons.language_outlined},
    {"name": "About US", "icon": Icons.announcement_outlined},
    {"name": "Privacy Policy", "icon": Icons.front_hand_outlined},
    {"name": "Term & Conditions", "icon": Icons.help_outline},
    {"name": "Log out", "icon": Icons.logout},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFC5DDFF), // Set status bar color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFC5DDFF),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: const Color(0xFFC5DDFF),
            leading: IconButton(
              icon: Image.asset(
                "images/back.png",
                height: 70,
                width: 70,
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
              ), // Customize your drawer icon here
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Color(0xff323643), fontWeight: FontWeight.bold),
            ),
            centerTitle: true, // Center the title
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150, // Adjust according to your needs
                      height: 150, // Adjust according to your needs
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            75), // Half of the width or height
                        color: Colors.grey[200], // Background color
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            75), // Same as container's borderRadius
                        child: Image.asset(
                          "images/tour4.png", // Replace with your image asset path
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saif Razzaq ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF323643),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Color.fromARGB(255, 96, 97, 100),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Pakistan',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 96, 97, 100),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              child: MaterialButton(
                                textColor: Colors.white,
                                color: const Color(0xFF167CF4),
                                elevation: 0, // Ensure no elevation
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'Edit Prifle',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed:
                                    () {}, // Set onPressed to null or a function
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 90,
                              height: 30,
                              child: MaterialButton(
                                textColor: Colors.white,
                                color: Color.fromARGB(255, 38, 117, 24),
                                elevation: 0, // Ensure no elevation
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'My Trips',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed:
                                    () {}, // Set onPressed to null or a function
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.grey, // Color of the divider line
                  thickness: 1, // Thickness of the divider line
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey, // Color of the bottom border
                            width: 0.8, // Thickness of the bottom border
                          ),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Add your onPressed functionality here
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove default padding
                          minimumSize: Size(double.infinity,
                              70), // Set the height of the button
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  dataList[index]["icon"], // Icon
                                  size: 30,
                                  color: Color(0xff3277D8),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  dataList[index]["name"] ?? "", // Name
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff323643)),
                                ),
                              ],
                            ),
                            Icon(Icons.chevron_right_sharp,
                                size: 40, color: Colors.grey),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
