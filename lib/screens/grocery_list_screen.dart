import 'package:flutter/material.dart';
import 'package:grocery_store/data/grocery_provider.dart';
import 'package:grocery_store/screens/home_screen.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc;

    return ListView.builder(
        padding: const EdgeInsets.only(top: cartBarHeight),
        itemCount: bloc?.catalog.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        });
  }
}
