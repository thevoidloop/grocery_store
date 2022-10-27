import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView(
      {Key? key,
      required this.itemBuilder,
      required this.itemCount,
      this.spacing = 0.0,
      this.aspectRation = 0.5,
      this.offsetPercent = 0.5})
      : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRation;
  final double offsetPercent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final itemHeight = (width * 0.5) / aspectRation;
      final height = constraints.maxHeight + itemHeight;

      return OverflowBox(
        maxHeight: height,
        minHeight: height,
        maxWidth: width,
        minWidth: width,
        child: GridView.builder(
            padding: EdgeInsets.only(top: itemHeight * 0.5, bottom: itemHeight),
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: aspectRation,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing),
            itemBuilder: (context, index) {
              return Transform.translate(
                offset: Offset(
                    0.0, index.isOdd ? (itemHeight * offsetPercent) : 0.0),
                child: itemBuilder(context, index),
              );
            }),
      );
    });
  }
}

class Enmarcar extends StatelessWidget {
  final Widget child;
  const Enmarcar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.red)),
      child: child,
    );
  }
}
