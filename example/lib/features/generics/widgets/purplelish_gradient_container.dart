import 'package:flutter/widgets.dart';

class PurplelishGradientContainer extends StatelessWidget {
  const PurplelishGradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 1.5,
          focalRadius: .2,
          stops: [.02, .3, .6],
          focal: Alignment.bottomCenter,
          colors: [
            Color(0xFFB3C8F0),
            Color(0xFFE2A9DB),
            Color(0xFF9362F9),
          ],
        ),
      ),
    );
  }
}
