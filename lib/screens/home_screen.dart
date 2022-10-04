import 'package:flutter/material.dart';

const _backgroundColor = Color(0xFFF6F5F2);
const _cartBarHeight = 100.0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                  ))
            ],
          ))
        ]));
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
              child: Text(
            'Fruits and vegetables',
            style: TextStyle(color: Colors.black),
          )),
          IconButton(
              onPressed: null, icon: Icon(Icons.settings_input_component_sharp))
        ],
      ),
    );
  }
}
