import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_identifier/features/cnh/widgets/cnh_info_container.dart';
import 'package:flutter_image_identifier/features/generics/widgets/super_container.dart';

class CNHFrame extends StatelessWidget {
  const CNHFrame({super.key});

  @override
  Widget build(BuildContext context) {
    const animationsDuration = Duration(milliseconds: 800);
    const initialDelayMilliseconds = 800;
    return AspectRatio(
      aspectRatio: 1.439,
      child: SuperContainer(
        borderRadius: 12,
        border: const BorderSide(color: Colors.white, width: 2.5),
        color: Colors.black.withOpacity(.1),
        child: FractionallySizedBox(
          widthFactor: 0.77,
          heightFactor: 0.714,
          alignment: const Alignment(0.35, .6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomIn(
                duration: animationsDuration,
                delay: const Duration(
                    milliseconds: initialDelayMilliseconds + 100),
                child: const CNHInfoContainer(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: AspectRatio(
                          aspectRatio: 0.7628,
                          child: ZoomIn(
                            duration: animationsDuration,
                            delay: const Duration(
                                milliseconds: initialDelayMilliseconds + 140),
                            child: const SuperContainer(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ZoomIn(
                              duration: animationsDuration,
                              delay: const Duration(
                                milliseconds: initialDelayMilliseconds + 180,
                              ),
                              child: const CNHInfoContainer(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child: ZoomIn(
                                duration: animationsDuration,
                                delay: const Duration(
                                  milliseconds: initialDelayMilliseconds + 200,
                                ),
                                child: const CNHInfoContainer(),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: ZoomIn(
                                  duration: animationsDuration,
                                  delay: const Duration(
                                    milliseconds:
                                        initialDelayMilliseconds + 240,
                                  ),
                                  child: const CNHInfoContainer(),
                                ),
                              ),
                            ),
                            ZoomIn(
                              duration: animationsDuration,
                              delay: const Duration(
                                milliseconds: initialDelayMilliseconds + 280,
                              ),
                              child: const CNHInfoContainer(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ZoomIn(
                duration: animationsDuration,
                delay: const Duration(
                  milliseconds: initialDelayMilliseconds + 320,
                ),
                child: const CNHInfoContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
