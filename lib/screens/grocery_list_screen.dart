import 'package:flutter/material.dart';
import 'package:grocery_store/data/grocery_provider.dart';
import 'package:grocery_store/screens/grocery_details_screen.dart';
import 'package:grocery_store/screens/home_screen.dart';

import '../custom/staggered_dual_view_custom.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)?.bloc;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: cartBarHeight),
      child: StaggeredDualView(
          spacing: 10,
          aspectRation: 0.7,
          offsetPercent: 0.25,
          itemBuilder: (context, index) {
            final product = bloc!.catalog[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, __) {
                    return FadeTransition(
                        opacity: animation,
                        child: GroceryDetails(
                            product: product,
                            onProductAdded: () {
                              bloc.addProduct(product);
                            }));
                  },
                ));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                shadowColor: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: 'list_${product.name}',
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        'Q${product.price}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        product.name,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(
                        product.weight,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: bloc!.catalog.length),
    );
/*
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
*/
  }
}
