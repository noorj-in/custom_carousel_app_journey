import 'package:custom_carousel_app_journey/src/app_journey.dart';
import 'package:custom_carousel_app_journey/src/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_carousel_app_journey/custom_carousel_app_journey.dart';

void main() {
  testWidgets('Test CustomCarouselAppJourney widget', (widgetTester) async {
    await widgetTester.pumpWidget(CustomCarouselAppJourney(
      slides: const [
        AppJourney(
          title: 'Welcome to Flutter',
          image: 'assets/ic_flutter_logo.png',
          description:
              'Flutter is Google’s UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
        ),
        AppJourney(
          title: 'Welcome to Dart',
          image: 'assets/ic_flutter_logo.png',
          description:
              'Dart is a client-optimized language for fast apps on any platform.',
        ),
        AppJourney(
          title: 'Welcome to Dart',
          image: 'assets/ic_flutter_logo.png',
          description:
              'Dart is a client-optimized language for fast apps on any platform.',
        ),
        AppJourney(
          title: 'Welcome to Material',
          image: 'assets/ic_flutter_logo.png',
          description:
              'Material is a design system created by Google to help teams build high-quality digital experiences for Android, iOS, Flutter, and the web.',
        ),
      ],
      carouselOptions: CarouselOptions(
        imageHeight: 200,
        buttonType: CarouselButtonTypes.text,
        onDoneButtonPressed: () {},
      ),
    ));
    final customCarouselAppJourneyFinder =
        find.byType(CustomCarouselAppJourney);
    expect(customCarouselAppJourneyFinder, findsOneWidget);
    final appJourneyFinder = find.byType(AppJourney);
    expect(appJourneyFinder, findsNWidgets(4));
    final carouselOptionsFinder = find.byType(CarouselOptions);
    expect(carouselOptionsFinder, findsOneWidget);
    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsOneWidget);
    final columnFinder = find.byType(Column);
    expect(columnFinder, findsNWidgets(2));
    final expandedFinder = find.byType(Expanded);
    expect(expandedFinder, findsOneWidget);
    final animatedSwitcherFinder = find.byType(AnimatedSwitcher);
    expect(animatedSwitcherFinder, findsOneWidget);
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsNWidgets(2));
    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(3));
    final iconFinder = find.byIcon(Icons.arrow_forward);
    expect(iconFinder, findsOneWidget);
  });
}
