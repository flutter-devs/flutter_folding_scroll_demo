import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final int index;
  final String img;
  final double width;

  const PageViewItem({
    Key? key,
    required this.index,
    required this.width,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(index),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Image.asset(
          img,
          fit: BoxFit.fill,
          width: width,
        ),
      ),
    );
  }
}
