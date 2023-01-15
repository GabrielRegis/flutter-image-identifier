import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_image_identifier/features/cnh/models/cnh.dart';
import 'package:flutter_image_identifier/features/generics/widgets/super_container.dart';
import 'package:flutter_image_identifier_example/features/generics/widgets/label_value_container.dart';
import 'package:flutter_image_identifier_example/features/generics/widgets/margin_top.dart';
import 'package:flutter_image_identifier_example/features/generics/widgets/purplelish_gradient_container.dart';

class CNHCard extends StatelessWidget {
  final CNH cnh;
  const CNHCard(this.cnh, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.72,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: .4,
            color: Colors.purple.shade900.withOpacity(.3),
            strokeAlign: StrokeAlign.outside,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.purple.shade900.withOpacity(.2),
            ),
          ],
        ),
        child: Stack(
          children: [
            const PurplelishGradientContainer(),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 30.0, sigmaY: 30.0, tileMode: TileMode.repeated),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: AspectRatio(
                      aspectRatio: .7,
                      child: SuperContainer(
                        color: const Color(0xFF9362F9),
                        borderRadius: 8,
                        clip: Clip.antiAlias,
                        child: Image.network(
                          "https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LabelValueContainer(
                          label: "NAME",
                          value: cnh.name ?? "",
                        ),
                        MarginTop(
                          child: LabelValueContainer(
                            label: "CPF",
                            value: cnh.cpfNumber ?? "",
                          ),
                        ),
                        MarginTop(
                          child: LabelValueContainer(
                            label: "RG",
                            value: cnh.idNumber ?? "",
                          ),
                        ),
                        MarginTop(
                          child: LabelValueContainer(
                            label: "CNH",
                            value: cnh.cnhNumber ?? "",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
