import 'package:flutter/material.dart';
import 'package:grocery_store/block.dart';
import 'package:grocery_store/data/grocery_provider.dart';
import 'package:grocery_store/screens/grocery_cart_screen.dart';
import 'package:grocery_store/screens/grocery_list_screen.dart';

const backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 500);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final block = GroceryStoreBlock();

  void _onVerticalGesture(DragUpdateDetails details) {
    //print(details.primaryDelta);
    if (details.primaryDelta! < -2) {
      block.changeToCart();
    } else if (details.primaryDelta! > 5) {
      block.changeToNormal();
    }
    setState(() {});
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return (size.height - cartBarHeight);
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceryState state) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GroceryProvider(
      bloc: block,
      child: AnimatedBuilder(
        animation: block,
        builder: (context, _) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  AnimatedPositioned(
                      left: 0,
                      right: 0,
                      top: _getTopForWhitePanel(block.groceryState, size),
                      height: size.height - kToolbarHeight,
                      duration: _panelTransition,
                      curve: Curves.decelerate,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const GroceryStoreList(),
                        ),
                      )),
                  AnimatedPositioned(
                      left: 0,
                      right: 0,
                      top: _getTopForBlackPanel(block.groceryState, size),
                      height: size.height - kToolbarHeight,
                      duration: _panelTransition,
                      curve: Curves.decelerate,
                      child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: AnimatedSwitcher(
                                    duration: _panelTransition,
                                    child: SizedBox(
                                      height: kToolbarHeight,
                                      child:
                                          block.groceryState ==
                                                  GroceryState.normal
                                              ? Row(
                                                  children: [
                                                    const Text(
                                                      'Cart',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          children:
                                                              List.generate(
                                                                  block.cart
                                                                      .length,
                                                                  (index) =>
                                                                      Stack(
                                                                          children: [
                                                                            Hero(
                                                                              tag: 'list_${block.cart[index].product.name}details',
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                                child: CircleAvatar(
                                                                                  backgroundColor: Colors.white,
                                                                                  backgroundImage: AssetImage(block.cart[index].product.image),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Positioned(
                                                                              right: 0,
                                                                              child: CircleAvatar(
                                                                                backgroundColor: Colors.red,
                                                                                radius: 10,
                                                                                child: Text(block.cart[index].quantity.toString()),
                                                                              ),
                                                                            ),
                                                                          ])),
                                                        ),
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFF4C459),
                                                      child: Text(block
                                                          .totalCartElement()
                                                          .toString()),
                                                    )
                                                  ],
                                                )
                                              : const SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                                const Expanded(child: GroceryStoreCart()),
                              ],
                            ),
                          ))),
                  AnimatedPositioned(
                      duration: _panelTransition,
                      curve: Curves.decelerate,
                      left: 0,
                      right: 0,
                      top: _getTopForAppBar(block.groceryState),
                      child: _AppBarGrocery()),
                ],
              ));
        },
      ),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: backgroundColor,
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
