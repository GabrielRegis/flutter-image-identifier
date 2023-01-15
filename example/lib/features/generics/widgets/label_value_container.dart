import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_identifier/features/generics/widgets/super_container.dart';
import 'package:flutter_image_identifier_example/features/generics/typography/app_text.dart';
import 'package:flutter_image_identifier_example/features/generics/widgets/margin_left.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class LabelValueContainer extends StatelessWidget {
  final String label;
  final String value;
  const LabelValueContainer({
    required this.label,
    required this.value,
    super.key,
  });

  onPressed(BuildContext context) {
    Clipboard.setData(
      ClipboardData(text: value),
    );
    showToastWidget(
      SuperContainer(
        color: const Color(0xFFEA3799),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.library_add_check_rounded,
                color: Colors.white,
                size: 20,
              ),
              MarginLeft(
                child: AppTypography.classy("Copied to clipboard!"),
              ),
            ],
          ),
        ),
      ),
      context: context,
      dismissOtherToast: true,
      position: const StyledToastPosition(
        align: Alignment.bottomCenter,
      ),
      duration: const Duration(milliseconds: 1500),
      animDuration: const Duration(milliseconds: 300),
      reverseAnimation: StyledToastAnimation.slideFromBottomFade,
      animation: StyledToastAnimation.slideFromBottomFade,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperContainer(
      clip: Clip.antiAlias,
      color: Colors.white.withOpacity(
        .05,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.pink,
          onTap: () => onPressed(
            context,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 2,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppTypography.mediumClassy(
                    label,
                  ),
                ),
                Expanded(
                  child: AppTypography.classy(
                    value,
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.copy,
                    size: 10,
                    color: Colors.white.withOpacity(
                      .2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
