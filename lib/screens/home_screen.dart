import 'package:flutter/material.dart';
import 'package:grocery_store/block.dart';

const _backgroundColor = Color(0xFFF6F5F2);
const _cartBarHeight = 100.0;
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
      print(details.primaryDelta);
      block.changeToCart();
    } else if (details.primaryDelta! > 5) {
      print(details.primaryDelta);
      block.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -_cartBarHeight;
    } //else if (state == GroceryState.cart) {
    return -(size.height - kToolbarHeight - _cartBarHeight / 2);
    //}
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return (size.height - kToolbarHeight - _cartBarHeight);
    } //else if (state == GroceryState.cart) {
    return _cartBarHeight / 2;
    //}
  }

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
                  AnimatedPositioned(
                      left: 0,
                      right: 0,
                      top: _getTopForWhitePanel(block.groceryState, size),
                      height: size.height - kToolbarHeight,
                      duration: _panelTransition,
                      curve: Curves.decelerate,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                      )),
                  AnimatedPositioned(
                      left: 0,
                      right: 0,
                      top: _getTopForBlackPanel(block.groceryState, size),
                      height: size.height,
                      duration: _panelTransition,
                      curve: Curves.decelerate,
                      child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(color: Colors.black)))
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
