import 'package:flutter/material.dart';

import 'package:quizz_project/utils/constants/color_constants.dart';

class CustomSection extends StatelessWidget {
  String section;
  void Function()? onCardTaped;
  CustomSection({
    required this.section,
    this.onCardTaped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTaped,
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.BoxColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  section,
                  style:
                      TextStyle(color: ColorConstants.TextColor, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
