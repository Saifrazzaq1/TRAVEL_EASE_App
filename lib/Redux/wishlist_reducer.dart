// Redux/wishlist_reducer.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:travel_ease/Redux/wishlist_actions.dart';

List<Map<String, dynamic>> wishlistReducer(
    List<Map<String, dynamic>> state, dynamic action) {
  if (action is AddToWishlistAction) {
    // Add the item data to the wishlist
    List<Map<String, dynamic>> newState = List.from(state)
      ..add(action.itemData);
    _saveWishlistToLocalStorage(newState);
    return newState;
  } else if (action is RemoveFromWishlistAction) {
    // Remove the item data from the wishlist
    List<Map<String, dynamic>> newState = List.from(state);
    newState.removeWhere((item) => item["title"] == action.itemData["title"]);
    _saveWishlistToLocalStorage(newState);
    return newState;
  }
  return state;
}

void _saveWishlistToLocalStorage(List<Map<String, dynamic>> wishlist) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('wishlist', json.encode(wishlist));
}
