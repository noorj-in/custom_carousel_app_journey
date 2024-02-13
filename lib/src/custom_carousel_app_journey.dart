import 'package:custom_carousel_app_journey/src/app_journey.dart';
import 'package:custom_carousel_app_journey/src/carousel_options.dart';
import 'package:custom_carousel_app_journey/src/custom_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// CarouselButtonTypes is an enum that contains the types of the button
enum CarouselButtonTypes { text, icon }

class CustomCarouselAppJourney extends StatefulWidget {
  const CustomCarouselAppJourney({
    super.key,
    required this.slides,
    required this.carouselOptions,
  });

  /// The list of the journey containing the image, title and description
  final List<AppJourney> slides;

  /// The options of the carousel
  final CarouselOptions carouselOptions;

  @override
  State<CustomCarouselAppJourney> createState() =>
      _CustomCarouselAppJourneyState();
}

class _CustomCarouselAppJourneyState extends State<CustomCarouselAppJourney> {
  /// The index of the current slide
  int index = 0;

  @override
  Widget build(BuildContext context) {
    /// The final style of the previous button
    final (
      String,
      double?,
      FontWeight?,
      Color,
      VoidCallback
    ) previousButtonStyle = getButtonStyle('Previous');

    /// The final style of the next button
    final (String, double?, FontWeight?, Color, VoidCallback) nextButtonStyle =
        getButtonStyle('Next');

    return Padding(
      padding: widget.carouselOptions.padding ??
          EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: widget.carouselOptions.switchAnimationDuration,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return SlideTransition(
                      position:
                          widget.carouselOptions.slideTransitionPosition ??
                              Tween(
                                begin: const Offset(2.0, 0.0),
                                end: Offset.zero,
                              ).animate(animation),
                      child: child,
                    );
                  },
                  child: Column(
                    key: ValueKey<int>(index),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      extendedImage(
                        url: widget.slides[index].image,
                        fit: BoxFit.contain,
                        height: widget.carouselOptions.imageHeight,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Text(
                        widget.slides[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize:
                              widget.carouselOptions.titleFontSize ?? 20.0,
                          fontWeight: widget.carouselOptions.titleFontWeight ??
                              FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        widget.slides[index].description,
                        softWrap: true,
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize:
                              widget.carouselOptions.subTitleFontSize ?? 17.0,
                          fontWeight:
                              widget.carouselOptions.subTitleFontWeight ??
                                  FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.slides.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      index = entry.key;
                    });
                  },
                  child: Container(
                    width: index == entry.key ? 16.0 : 10.0,
                    height: 9.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: index == entry.key
                          ? BorderRadius.circular(8.0)
                          : null,
                      shape: index == entry.key
                          ? BoxShape.rectangle
                          : BoxShape.circle,
                      color: index == entry.key
                          ? (widget.carouselOptions.indicatorColor)
                          : Colors.grey.withOpacity(0.8),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.carouselOptions.buttonType ==
                  CarouselButtonTypes.text) ...[
                textButton(
                  message: previousButtonStyle.$1,
                  fontSize: (previousButtonStyle.$2 ?? 10.0) - 8.0,
                  fontWeight: previousButtonStyle.$3,
                  color: previousButtonStyle.$4,
                  callBack: previousButtonStyle.$5,
                ),
                const Spacer(),
                textButton(
                  message: nextButtonStyle.$1,
                  fontSize: (nextButtonStyle.$2 ?? 10.0) - 8.0,
                  fontWeight: nextButtonStyle.$3,
                  color: nextButtonStyle.$4,
                  callBack: nextButtonStyle.$5,
                ),
              ] else ...[
                iconButton(
                  icon: defaultTargetPlatform == TargetPlatform.iOS
                      ? Icons.arrow_back_ios
                      : Icons.arrow_back,
                  color: previousButtonStyle.$4,
                  callBack: previousButtonStyle.$5,
                  size: previousButtonStyle.$2,
                ),
                const Spacer(),
                iconButton(
                  icon: defaultTargetPlatform == TargetPlatform.iOS
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_forward,
                  color: nextButtonStyle.$4,
                  callBack: nextButtonStyle.$5,
                  size: nextButtonStyle.$2,
                ),
              ],
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    );
  }

  (String, double?, FontWeight?, Color, VoidCallback) getButtonStyle(
      String message) {
    if (message == 'Previous') {
      return (
        'Previous',
        widget.carouselOptions.buttonFontSize,
        widget.carouselOptions.buttonFontWeight,
        index == 0
            ? Colors.grey.withOpacity(0.8)
            : widget.carouselOptions.textColor,
        () {
          if (index != 0) {
            setState(() {
              index--;
            });
          }
        },
      );
    } else {
      return (
        index == (widget.slides.length - 1) ? 'Done' : 'Next',
        widget.carouselOptions.buttonFontSize,
        widget.carouselOptions.buttonFontWeight,
        index >= 0
            ? widget.carouselOptions.textColor
            : Colors.grey.withOpacity(0.8),
        () {
          if (index != (widget.slides.length - 1)) {
            setState(() {
              index++;
            });
          } else {
            widget.carouselOptions.onDoneButtonPressed();
          }
        },
      );
    }
  }
}
