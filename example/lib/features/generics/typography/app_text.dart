import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTypography extends StatelessWidget {
  final String data;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const AppTypography(this.data,
      {super.key, this.size = 24, this.color, this.weight});

  const AppTypography.mediumClassy(
    this.data, {
    super.key,
    this.size = 12,
    this.color,
    this.weight = FontWeight.w400,
  });

  const AppTypography.classy(
    this.data, {
    super.key,
    this.size = 14,
    this.color,
    this.weight = FontWeight.w200,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        // fontFamily: "Sofia",
        fontSize: size,
        fontWeight: weight,
        color: color ?? Colors.white,
      ),
    );
  }
}
