// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:travel_ease/Components/CustomCard.dart';
import 'package:travel_ease/Redux/wishlist_actions.dart';
import 'package:travel_ease/UserSide/TourDetail.dart';
import 'package:travel_ease/Utils/ScreenSizes.dart';
import 'package:travel_ease/Utils/Utils.dart';

import '../constants.dart';

// Define your TripScreen widget
class TripScreen extends StatefulWidget {
  TripScreen({Key? key}) : super(key: key);

  @override
  State<TripScreen> createState() => _TripScreenState();
}

// Define your TripScreenState
class _TripScreenState extends State<TripScreen> {
  // Declare variables and constants
  var text;
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> cardData = []; // Initialize as empty list

  // Function to fetch booking data from Firestore
  Future<void> _fetchBookingData() async {
    try {
      // Get the current user
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print('User not logged in');
        return;
      }
      final String userId = user.uid;

      // Fetch booking data from Firestore
      final QuerySnapshot bookingSnapshot = await FirebaseFirestore.instance
          .collection('bookings')
          .doc(userId)
          .collection('userBookings')
          .get();

      // Process fetched booking data
      final List<Map<String, dynamic>> bookings = bookingSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Update cardData with fetched booking data
      setState(() {
        cardData.addAll(bookings);
      });

      // Show fetched booking data
      print('Fetched Booking Data: $bookings');
    } catch (e) {
      print('Error fetching booking data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Call _fetchBookingData when the screen initializes
    _fetchBookingData();
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
            // leading: IconButton(
            //   icon: Image.asset(
            //     "images/back.png",
            //     height: 70,
            //     width: 70,
            //   ), // Customize your drawer icon here
            //   onPressed: () {
            //     // Handle back button press
            //     Navigator.pop(context);
            //   },
            // ),
            title: Text(
              'Trips',
              style: TextStyle(
                color: Color(0xff323643),
                fontWeight: FontWeight.bold,
              ),
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
                    return GestureDetector(
                      onTap: () {
                        Get.to(TourDetailScreen(data: data));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: 15 * SizeConfig.heightRef), // Apply margin
                        height: 150 * SizeConfig.heightRef,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5 * SizeConfig.widthRef),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    data["imageURLTour"], // Change to imageURL
                                    width: 160 * SizeConfig.widthRef,
                                    height: 130 * SizeConfig.heightRef,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 8 * SizeConfig.heightRef),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              data["tourTitle"] ?? "",
                                              style: TextStyle(
                                                fontSize:
                                                    16 * SizeConfig.fontRef,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff323643),
                                              ),
                                            ),
                                            Text(
                                              "Rs ${data["costPerPerson"] ?? ""}",
                                              style: TextStyle(
                                                fontSize:
                                                    14 * SizeConfig.fontRef,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff3277D8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: 5 * SizeConfig.heightRef),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  data["placeName"],
                                                  style: TextStyle(
                                                    fontSize:
                                                        14 * SizeConfig.fontRef,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 135, 138, 147),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                width:
                                                    20 * SizeConfig.widthRef),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_rate,
                                                  color: Colors.green,
                                                  size: 17 * SizeConfig.fontRef,
                                                ),
                                                Text(
                                                  "4.5",
                                                  style: TextStyle(
                                                    fontSize:
                                                        14 * SizeConfig.fontRef,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 135, 138, 147),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          data["description"] ?? "",
                                          style: TextStyle(
                                            fontSize: 14 * SizeConfig.fontRef,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 135, 138, 147),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Positioned(
                            //   top: 10,
                            //   left: 10,
                            //   child: Container(
                            //     height: 35 * SizeConfig.heightRef,
                            //     width: 35 * SizeConfig.widthRef,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Colors.white,
                            //     ),
                            //     child: IconButton(
                            //       icon: StoreConnector<
                            //           List<Map<String, dynamic>>, bool>(
                            //         converter: (store) {
                            //           // Check if the item exists in the wishlist
                            //           return store.state.any((item) =>
                            //               item["title"] == data["title"]);
                            //         },
                            //         builder: (context, isInWishlist) {
                            //           return Icon(
                            //             isInWishlist
                            //                 ? Icons.favorite
                            //                 : Icons.favorite_border,
                            //             size: 22 * SizeConfig.fontRef,
                            //             color: isInWishlist
                            //                 ? Colors.red
                            //                 : Colors.red,
                            //           );
                            //         },
                            //       ),
                            //       onPressed: () async {
                            //         final isInWishlist = StoreProvider.of<
                            //                 List<Map<String, dynamic>>>(context)
                            //             .state
                            //             .any((item) =>
                            //                 item["title"] == data["title"]);

                            //         if (isInWishlist) {
                            //           // Remove the item from the wishlist
                            //           StoreProvider.of<
                            //                       List<Map<String, dynamic>>>(
                            //                   context)
                            //               .dispatch(
                            //                   RemoveFromWishlistAction(data));
                            //           Utils().toastMessage(
                            //             message: 'Item removed from wishlist',
                            //             backgroundColor: Colors.green,
                            //           );
                            //         } else {
                            //           // Add the item to the wishlist
                            //           StoreProvider.of<
                            //                       List<Map<String, dynamic>>>(
                            //                   context)
                            //               .dispatch(AddToWishlistAction(data));
                            //           Utils().toastMessage(
                            //             message: 'Item added to wishlist',
                            //             backgroundColor: Colors.green,
                            //           );
                            //         }
                            //       },
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 60 * SizeConfig.heightRef,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
