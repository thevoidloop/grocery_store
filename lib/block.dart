import 'package:flutter/material.dart';
import 'package:grocery_store/data/products_data.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBlock with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];

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

  void addProduct(GroceryProduct product) {
    for (GroceryProductItem item in cart) {
      if (item.product.name == product.name) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  void deleteProduct(GroceryProductItem product) {
    cart.remove(product);
    notifyListeners();
  }

  int totalCartElement() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);

  double totalPrice() {
    return cart.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.product.price));
  }
}

class GroceryProductItem {
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}
