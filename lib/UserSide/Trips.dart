// ignore_for_file: prefer_const_constructors

import '../constants.dart';
import 'package:flutter/services.dart';

class TripScreen extends StatefulWidget {
  TripScreen({Key? key}) : super(key: key);

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  var text;
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> cardData = [
    {
      "imagePath": "images/tour6.png",
      "title": "New York ",
      "price": "\$ 300",
      "location": "New York",
      "rating": "4.8",
      "description": "Explore the Big Apple in style!",
    },
    {
      "imagePath": "images/tour2.png",
      "title": "Paris Adventure",
      "price": "\$ 400",
      "location": "Paris",
      "rating": "4.7",
      "description": "Discover the romantic streets of Paris.",
    },
    {
      "imagePath": "images/tour3.png",
      "title": "Loss Angeles",
      "price": "\$ 350",
      "location": "California",
      "rating": "4.5",
      "description": "Sed ut perspiciatis und omnis iste natus error",
    },
    {
      "imagePath": "images/tour.png",
      "title": "New York ",
      "price": "\$ 300",
      "location": "New York",
      "rating": "4.8",
      "description": "Explore the Big Apple in style!",
    },
    {
      "imagePath": "images/tour6.png",
      "title": "Paris Adventure",
      "price": "\$ 400",
      "location": "Paris",
      "rating": "4.7",
      "description": "Discover the romantic streets of Paris.",
    },
    {
      "imagePath": "images/tour7.png",
      "title": "Loss Angeles",
      "price": "\$ 350",
      "location": "California",
      "rating": "4.5",
      "description": "Sed ut perspiciatis und omnis iste natus error",
    },
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
              'Trips',
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
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  shrinkWrap: true, // Wrap content
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    final data = cardData[index];
                    return CustomCard(
                      imagePath: data["imagePath"],
                      title: data["title"],
                      price: data["price"],
                      location: data["location"],
                      rating: data["rating"],
                      description: data["description"],
                    );
                  },
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
