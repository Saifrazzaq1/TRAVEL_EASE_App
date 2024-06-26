// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:travel_ease/Redux/wishlist_actions.dart';
import 'package:travel_ease/UserSide/Offers.dart';
import 'package:travel_ease/UserSide/TourDetail.dart';
import 'package:travel_ease/UserSide/TourTypes.dart';
import 'package:travel_ease/Utils/ScreenSizes.dart';

import '../constants.dart';

class HomeScreenUser extends StatefulWidget {
  HomeScreenUser({Key? key}) : super(key: key);

  @override
  State<HomeScreenUser> createState() => _HomeScreenUserState();
}

class _HomeScreenUserState extends State<HomeScreenUser> {
  var text;
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> toursData = [];
  List<Map<String, dynamic>> filteredToursData = [];

  bool bottomSheetShown = false;
  int _currentIndex = 0;
  final List<String> _images = [
    "images/promo.png",
    "images/promo.png",
    "images/promo.png",
  ];

  // Define data for each card separately
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
  ];
  // late List<Map<String, dynamic>> toursData = [];
  @override
  void initState() {
    super.initState();
    fetchToursData();
    fetchFilteredToursData(); // Call function to fetch tours data
  }

  void fetchToursData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tours').get();
      List<Map<String, dynamic>> tours = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> tourData = doc.data() as Map<String, dynamic>;
        tours.add(tourData);
      });
      setState(() {
        toursData = tours; // Update toursData state with fetched data
        filteredToursData =
            tours; // Initially, filtered data is the same as all data
      });

      // Uncomment below to print fetched tour data
      // print("Fetched Tours Data:");
      // for (var tour in toursData) {
      //   print(tour);
      // }
    } catch (error) {
      print("Error fetching tours data: $error");
    }
  }

  void fetchFilteredToursData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tours').get();
      List<Map<String, dynamic>> tours = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> tourData = doc.data() as Map<String, dynamic>;
        // Only add tours with hasDiscount true to filteredToursData
        if (tourData["hasDiscount"] == true) {
          tours.add(tourData);
        }
      });
      setState(() {
        filteredToursData =
            tours; // Update filteredToursData with filtered data
      });
    } catch (error) {
      print("Error fetching filtered tours data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFC5DDFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Catogories',
                      style: TextStyle(
                        fontSize: 24 * SizeConfig.fontRef,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff323643),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightRef,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150 * SizeConfig.widthRef,
                      height: 50 * SizeConfig.heightRef,
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: const Color(0xFF167CF4),
                        elevation: 0, // Ensure no elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'For Person',
                          style: TextStyle(
                            fontSize: 14 * SizeConfig.fontRef,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => TourTypes(data: 'Person'));
                        }, // Set onPressed to null or a function
                      ),
                    ),
                    Container(
                      width: 150 * SizeConfig.widthRef,
                      height: 50 * SizeConfig.heightRef,
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: Color.fromARGB(255, 38, 117, 24),
                        elevation: 0, // Ensure no elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'For Couple',
                          style: TextStyle(
                            fontSize: 14 * SizeConfig.fontRef,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => TourTypes(data: 'Couple'));
                        }, // Set onPressed to null or a function
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightRef,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Deals',
                      style: TextStyle(
                        fontSize: 24 * SizeConfig.fontRef,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff323643),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightRef,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],
                            border: Border.all(
                                color: Colors.red, width: 2.0), // Edge/border
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 110 * SizeConfig.heightRef,
                                width: 165 * SizeConfig.widthRef,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Slightly smaller for inner content
                                  color: Colors
                                      .white, // Background color of inner content
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Same as inner content's borderRadius
                                  child: Image.network(
                                    filteredToursData.isNotEmpty
                                        ? filteredToursData[0]["imageURL"]
                                        : "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      filteredToursData.isNotEmpty &&
                                              filteredToursData.length > 1
                                          ? "${filteredToursData[0]["discountPercentage"]} % off"
                                          : "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10 * SizeConfig.heightRef,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10 * SizeConfig.widthRef),
                          child: Text(
                            filteredToursData.isNotEmpty
                                ? filteredToursData[0]["title"]
                                : "",
                            style: TextStyle(
                              fontSize: 18 * SizeConfig.fontRef,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff323643),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10 * SizeConfig.widthRef),
                          child: Text(
                            filteredToursData.isNotEmpty
                                ? filteredToursData[0]["placeName"]
                                : "",
                            style: TextStyle(
                              fontSize: 14 * SizeConfig.fontRef,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6 * SizeConfig.widthRef,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],
                            border: Border.all(
                                color: Colors.red, width: 2.0), // Edge/border
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 110 * SizeConfig.heightRef,
                                width: 165 * SizeConfig.widthRef,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Slightly smaller for inner content
                                  color: Colors
                                      .white, // Background color of inner content
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Same as inner content's borderRadius
                                  child: Image.network(
                                    filteredToursData.isNotEmpty
                                        ? filteredToursData[1]["imageURL"]
                                        : "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      filteredToursData.isNotEmpty &&
                                              filteredToursData.length > 1
                                          ? "${filteredToursData[1]["discountPercentage"]} % off"
                                          : "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10 * SizeConfig.heightRef,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10 * SizeConfig.widthRef),
                          child: Text(
                            filteredToursData.isNotEmpty
                                ? filteredToursData[1]["title"]
                                : "",
                            style: TextStyle(
                              fontSize: 18 * SizeConfig.fontRef,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff323643),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10 * SizeConfig.widthRef),
                          child: Text(
                            filteredToursData.isNotEmpty
                                ? filteredToursData[1]["placeName"]
                                : "",
                            style: TextStyle(
                              fontSize: 14 * SizeConfig.fontRef,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightRef,
                ),
                //Slider
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Adjust the value according to your preference
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                        items: _images.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(Offers());
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: MediaQuery.of(context).size.width / 60,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _images.asMap().entries.map((entry) {
                          int index = entry.key;
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.blueAccent
                                  : Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10 * SizeConfig.heightRef,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Top Tours',
                    style: TextStyle(
                      fontSize: 24 * SizeConfig.fontRef,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff323643),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10 * SizeConfig.heightRef,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  shrinkWrap: true, // Wrap content
                  itemCount: toursData.length,
                  itemBuilder: (context, index) {
                    final data = toursData[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(TourDetailScreen(data: data));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: 15 * SizeConfig.heightRef), // Apply margin
                        height: 140 * SizeConfig.heightRef,
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
                                    data["imageURL"], // Change to imageURL
                                    width: 160 * SizeConfig.widthRef,
                                    height: 130 * SizeConfig.heightRef,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0 * SizeConfig.heightRef),
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
                                              data["title"],
                                              style: TextStyle(
                                                fontSize:
                                                    15 * SizeConfig.fontRef,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff323643),
                                              ),
                                            ),
                                            Text(
                                              "Rs ${data["costPerPerson"]}",
                                              style: TextStyle(
                                                fontSize:
                                                    15 * SizeConfig.fontRef,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff3277D8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
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
                                        SizedBox(
                                            height: 5 * SizeConfig.heightRef),
                                        Text(
                                          data["description"],
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
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: StoreConnector<
                                      List<Map<String, dynamic>>, bool>(
                                    converter: (store) {
                                      // Check if the item exists in the wishlist
                                      return store.state.any((item) =>
                                          item["title"] == data["title"]);
                                    },
                                    builder: (context, isInWishlist) {
                                      return Icon(
                                        isInWishlist
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 22,
                                        color: isInWishlist
                                            ? Colors.red
                                            : Colors.red,
                                      );
                                    },
                                  ),
                                  onPressed: () async {
                                    final isInWishlist = StoreProvider.of<
                                            List<Map<String, dynamic>>>(context)
                                        .state
                                        .any((item) =>
                                            item["title"] == data["title"]);

                                    if (isInWishlist) {
                                      // Remove the item from the wishlist
                                      StoreProvider.of<
                                                  List<Map<String, dynamic>>>(
                                              context)
                                          .dispatch(
                                              RemoveFromWishlistAction(data));
                                      Utils().toastMessage(
                                        message: 'Item removed from wishlist',
                                        backgroundColor: Colors.green,
                                      );
                                    } else {
                                      // Add the item to the wishlist
                                      StoreProvider.of<
                                                  List<Map<String, dynamic>>>(
                                              context)
                                          .dispatch(AddToWishlistAction(data));
                                      Utils().toastMessage(
                                        message: 'Item added to wishlist',
                                        backgroundColor: Colors.green,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
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
