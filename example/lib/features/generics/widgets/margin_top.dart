import 'package:flutter/widgets.dart';

class MarginTop extends StatelessWidget {
  final double margin;
  final Widget? child;
  const MarginTop({
    super.key,
    this.child,
    this.margin = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: margin),
      child: child,
    );
  }
}
