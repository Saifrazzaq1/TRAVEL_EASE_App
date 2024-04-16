// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_redux/flutter_redux.dart';
import 'package:travel_ease/Redux/wishlist_actions.dart';

import '../constants.dart';

class HomeScreenUser extends StatefulWidget {
  HomeScreenUser({Key? key}) : super(key: key);

  @override
  State<HomeScreenUser> createState() => _HomeScreenUserState();
}

class _HomeScreenUserState extends State<HomeScreenUser> {
  var text;
  final _formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    _checkBottomSheetStatus();
  }

  void _checkBottomSheetStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool shown = prefs.getBool('bottomSheetShown') ?? false;
    if (!shown) {
      _showBottomSheet();
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildBottomSheet(),
    );
  }

  Widget _buildBottomSheet() {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFC5DDFF),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location Permission',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF323643),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Image.asset(
                    "images/Locat.png",
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'We have several location based services \nand offers you\'d like. ',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF323643),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'NO, NOT NOW',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3277D8),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _handleYesGoAhead();
                    },
                    child: Text(
                      'YES GO, AHEAD',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3277D8),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleYesGoAhead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bottomSheetShown', true);
    setState(() {
      bottomSheetShown = true;
    });
    Navigator.pop(context); // Dismiss the bottom sheet
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
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff323643),
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3277D8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 110,
                      height: 50,
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: const Color(0xFF167CF4),
                        elevation: 0, // Ensure no elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Adventure',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {}, // Set onPressed to null or a function
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: Color.fromARGB(255, 38, 117, 24),
                        elevation: 0, // Ensure no elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Art & Cultures',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {}, // Set onPressed to null or a function
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 50,
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: const Color(0xFFFE0000),
                        elevation: 0, // Ensure no elevation
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Ocean',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {}, // Set onPressed to null or a function
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Deals',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff323643),
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff3277D8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value according to your preference
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(0, 5), // Offset to bottom
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10.0), // Same as the container's borderRadius
                            child: Image.asset(
                              "images/tour.png",
                              fit: BoxFit
                                  .cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Kashmir',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff323643),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Dubai',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the value according to your preference
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: Offset(0, 5), // Offset to bottom
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10.0), // Same as the container's borderRadius
                            child: Image.asset(
                              "images/tour1.png",
                              fit: BoxFit
                                  .cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Gawaddar',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff323643),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Asia',
                            style: TextStyle(
                              fontSize: 14,
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
                  height: 20,
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
                              return Container(
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
                  height: 30,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  shrinkWrap: true, // Wrap content
                  itemCount: cardData.length,
                  itemBuilder: (context, index) {
                    final data = cardData[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 15), // Apply margin
                      height: 140,
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
                              SizedBox(width: 5),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  data["imagePath"],
                                  width: 160,
                                  height: 130,
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
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data["title"],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff323643),
                                            ),
                                          ),
                                          Text(
                                            data["price"],
                                            style: TextStyle(
                                              fontSize: 18,
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
                                                data["location"],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromARGB(
                                                      255, 135, 138, 147),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 70),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star_rate,
                                                color: Colors.green,
                                                size: 17,
                                              ),
                                              Text(
                                                data["rating"],
                                                style: TextStyle(
                                                  fontSize: 14,
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
                                        data["description"],
                                        style: TextStyle(
                                          fontSize: 14,
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
                                icon: StoreConnector<List<Map<String, dynamic>>,
                                    bool>(
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
                                            List<Map<String, dynamic>>>(context)
                                        .dispatch(
                                            RemoveFromWishlistAction(data));
                                    Utils().toastMessage(
                                      message: 'Item removed from wishlist',
                                      backgroundColor: Colors.green,
                                    );
                                  } else {
                                    // Add the item to the wishlist
                                    StoreProvider.of<
                                            List<Map<String, dynamic>>>(context)
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
