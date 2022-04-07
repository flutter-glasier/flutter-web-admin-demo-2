import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 197, 193, 193),
        highlightColor: Colors.grey[300]!,
        period: Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.grey[400]!,
              borderRadius: BorderRadius.circular(10)),
        ),
      );
}
