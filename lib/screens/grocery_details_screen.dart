import 'package:flutter/material.dart';

import '../data/products_data.dart';

class GroceryDetails extends StatelessWidget {
  const GroceryDetails({Key? key, required this.product}) : super(key: key);

  final GroceryProduct product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'list_${product.name}',
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fitWidth,
                      height: size * 0.4,
                    ),
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    product.weight,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Q${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'About the product',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        )),
                  ),
                  Expanded(
                      flex: 4,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFF4C459),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
