import 'package:flutter/widgets.dart';

class MarginLeft extends StatelessWidget {
  final double margin;
  final Widget? child;
  const MarginLeft({
    super.key,
    this.child,
    this.margin = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: margin),
      child: child,
    );
  }
}
