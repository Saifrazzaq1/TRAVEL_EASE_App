import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../constants.dart';
import '../Redux/wishlist_actions.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFC5DDFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Connect to the Redux store and access the wishlist state
                StoreConnector<List<Map<String, dynamic>>,
                    List<Map<String, dynamic>>>(
                  converter: (Store<List<Map<String, dynamic>>> store) =>
                      store.state,
                  builder: (BuildContext context,
                      List<Map<String, dynamic>> wishlist) {
                    // Build UI based on wishlist state
                    return Column(
                      children: [
                        // Display items from the wishlist
                        ListView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), // Disable scrolling
                          shrinkWrap: true, // Wrap content
                          itemCount: wishlist.length,
                          itemBuilder: (context, index) {
                            final data = wishlist[index];
                            return Container(
                              margin:
                                  EdgeInsets.only(bottom: 15), // Apply margin
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    data["title"],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Color(0xff323643),
                                                    ),
                                                  ),
                                                  Text(
                                                    data["price"],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xff3277D8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromARGB(
                                                              255,
                                                              135,
                                                              138,
                                                              147),
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
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromARGB(
                                                              255,
                                                              135,
                                                              138,
                                                              147),
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
                                        icon: Icon(
                                          Icons.favorite,
                                          size: 22,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          // Dispatch action to remove item from wishlist
                                          StoreProvider.of<
                                              List<Map<String, dynamic>>>(
                                            context,
                                          ).dispatch(
                                            RemoveFromWishlistAction(data),
                                          );
                                          Utils().toastMessage(
                                            message:
                                                'Item removed from wishlist',
                                            backgroundColor: Colors.green,
                                          );
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
