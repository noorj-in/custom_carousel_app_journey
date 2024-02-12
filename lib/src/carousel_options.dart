import 'package:custom_carousel_app_journey/src/custom_carousel_app_journey.dart';
import 'package:flutter/material.dart';

class CarouselOptions {
  /// The height of the image in the carousel
  final double imageHeight;

  /// The font size of the title
  final double? titleFontSize;

  /// The font weight of the title
  final FontWeight? titleFontWeight;

  /// The font size of the subtitle
  final double? subTitleFontSize;

  /// The font weight of the subtitle
  final FontWeight? subTitleFontWeight;

  /// The font size of the button
  final double? buttonFontSize;

  /// The font weight of the button
  final FontWeight? buttonFontWeight;

  /// The color of the indicator
  final Color indicatorColor;

  /// The color to be displayed on the text and icon
  final Color textColor;

  /// The duration of the switch animation
  final Duration switchAnimationDuration;

  /// The padding of the carousel
  final EdgeInsetsGeometry? padding;

  /// The position of the slide transition
  final Animation<Offset>? slideTransitionPosition;

  /// The type of the button to be displayed in the carousel
  final CarouselButtonTypes buttonType;

  /// The callback when the done button is pressed
  final VoidCallback onDoneButtonPressed;

  CarouselOptions({
    required this.imageHeight,
    this.padding,
    this.titleFontSize,
    this.titleFontWeight,
    this.subTitleFontSize,
    this.subTitleFontWeight,
    this.buttonFontSize = 20.0,
    this.buttonFontWeight = FontWeight.w600,
    this.indicatorColor = Colors.blue,
    this.textColor = Colors.blue,
    this.slideTransitionPosition,
    this.switchAnimationDuration = const Duration(seconds: 1),
    this.buttonType = CarouselButtonTypes.text,
    required this.onDoneButtonPressed,
  });
}
