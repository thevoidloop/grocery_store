import 'package:flutter/material.dart';

import '../data/products_data.dart';

class GroceryDetails extends StatefulWidget {
  const GroceryDetails(
      {Key? key, required this.product, required this.onProductAdded})
      : super(key: key);

  final GroceryProduct product;
  final VoidCallback onProductAdded;

  @override
  State<GroceryDetails> createState() => _GroceryDetailsState();
}

class _GroceryDetailsState extends State<GroceryDetails> {
  String heroTag = '';

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

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
                    tag: 'list_${widget.product.name}$heroTag',
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.fitWidth,
                      height: size * 0.4,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    widget.product.weight,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Q${widget.product.price}',
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
                    widget.product.description,
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
                        onPressed: () => _addToCart(context),
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
