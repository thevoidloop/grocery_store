import 'package:flutter/material.dart';
import 'package:grocery_store/block.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoreBlock bloc;
  final Widget child;

  GroceryProvider({Key? key, required this.bloc, required this.child})
      : super(key: key, child: child);

  static GroceryProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(GroceryProvider oldWidget) => true;
}
