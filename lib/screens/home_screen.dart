import 'package:flutter/material.dart';
import 'package:grocery_store/block.dart';

const _backgroundColor = Color(0xFFF6F5F2);
const _cartBarHeight = 100.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final block = GroceryStoreBlock();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: block,
      builder: (context, _) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: Column(children: [
              _AppBarGrocery(),
              Expanded(
                  child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      top: -_cartBarHeight,
                      height: size.height - kToolbarHeight,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                      )),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: size.height - kToolbarHeight - _cartBarHeight,
                      height: size.height,
                      child: Container(color: Colors.black))
                ],
              ))
            ]));
      },
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: _backgroundColor,
      child: Row(
        children: const [
          BackButton(
            color: Colors.black,
          ),
          Expanded(
              child: Center(
            child: Text(
              'Fruits and vegetables',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
          IconButton(
              onPressed: null, icon: Icon(Icons.settings_input_component_sharp))
        ],
      ),
    );
  }
}
