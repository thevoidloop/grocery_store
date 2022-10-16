import 'package:flutter/material.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBlock with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToDetails() {
    groceryState = GroceryState.details;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }
}
