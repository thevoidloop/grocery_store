import 'package:flutter/material.dart';
import 'package:grocery_store/block.dart';

import '../data/grocery_provider.dart';

class GroceryStoreCart extends StatefulWidget {
  const GroceryStoreCart({Key? key}) : super(key: key);

  @override
  State<GroceryStoreCart> createState() => _GroceryStoreCartState();
}

class _GroceryStoreCartState extends State<GroceryStoreCart> {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)!.bloc;
    return GroceryProvider(
      bloc: bloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Cart',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: bloc.cart.length,
                    itemBuilder: (context, index) {
                      final GroceryProductItem item = bloc.cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.product.image),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              item.quantity.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'X',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.product.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const Spacer(),
                            Text(
                              'Q${(item.product.price * item.quantity).toString()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    return bloc.deleteProduct(item);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(children: [
              const Text(
                'Total',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                'Q${bloc.totalPrice()}',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF4C459),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
