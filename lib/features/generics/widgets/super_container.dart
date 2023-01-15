import 'package:flutter/material.dart';

class SuperContainer extends StatelessWidget {
  final double? borderRadius;
  final double? topLeftBorderRadius;
  final double? topRightBorderRadius;
  final double? botLeftBorderRadius;
  final double? botRightBorderRadius;

  final BorderSide? border;
  final BorderSide? borderTop;
  final BorderSide? borderBot;
  final BorderSide? borderLeft;
  final BorderSide? borderRight;

  final Clip? clip;
  final Color? color;

  final double? height;
  final double? width;

  final Widget? child;

  const SuperContainer({
    super.key,
    this.topLeftBorderRadius,
    this.topRightBorderRadius,
    this.botLeftBorderRadius,
    this.botRightBorderRadius,
    this.color,
    this.clip,
    this.height,
    this.width,
    this.child,
    this.border,
    this.borderBot,
    this.borderLeft,
    this.borderRight,
    this.borderTop,
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: clip ?? Clip.none,
      decoration: BoxDecoration(
        color: color,
        border: border != null
            ? Border.all(color: border!.color, width: border!.width)
            : BorderDirectional(
                top: border ?? BorderSide.none,
                start: borderLeft ?? BorderSide.none,
                end: borderRight ?? BorderSide.none,
                bottom: borderBot ?? BorderSide.none),
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius!)
            : BorderRadius.only(
                bottomLeft: Radius.circular(botLeftBorderRadius ?? 0),
                bottomRight: Radius.circular(botRightBorderRadius ?? 0),
                topLeft: Radius.circular(topLeftBorderRadius ?? 0),
                topRight: Radius.circular(topRightBorderRadius ?? 0),
              ),
      ),
      child: child,
    );
  }
}
