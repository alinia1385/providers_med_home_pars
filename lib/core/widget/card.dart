import 'package:note_app/core/const/FxBox.dart';

import 'package:flutter/material.dart';
import 'package:note_app/core/const/text.dart';
Widget CardContainer({
  required IconData boxIcon,
  required String productTitle,
  required String value,
  required List<Color> color,

}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(18.0),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: color.withOpacity(0.25),
            borderRadius: BorderRadius.circular(18.0),
            gradient: LinearGradient(colors: color),
            // boxShadow: [
            //   BoxShadow(
            //     color: color.withOpacity(0.5),
            //     blurRadius: 5.0,
            //     offset: const Offset(0.0, 5.0),
            //   ),
            // ],
          ),
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstText.lightText(
                    text:
                    productTitle,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(boxIcon, color: Colors.white),
                ],
              ),
              FxBox.h12,
              ConstText.mediumText(
                text: value,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),

            ],
          ),
        ),
        Positioned(
          right: -75.0,
          top: -25.0,
          child: Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
        ),
        Positioned(
          bottom: -87.5,
          right: -37.5,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
        ),
      ],
    ),
  );
}