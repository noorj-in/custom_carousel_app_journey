import 'package:custom_carousel_app_journey/custom_carousel_app_journey.dart';
import 'package:flutter/material.dart';
import 'package:custom_carousel_app_journey/src/app_journey.dart';
import 'package:custom_carousel_app_journey/src/carousel_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Carousel App Journey',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCarouselAppJourney(
        // The list of the journey containing the image, title and description
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

        // The options of the carousel which contains the height of the image, the font size of the title,
        // the font size of the subtitle, the font size of the button, the type of the button,
        // the duration of the switch animation and the callback when the done button is pressed
        carouselOptions: CarouselOptions(
          imageHeight: 200.0,
          titleFontSize: 20.0,
          subTitleFontSize: 18.0,
          buttonFontSize: 28.0,
          buttonType: CarouselButtonTypes.text,
          onDoneButtonPressed: () {
            // The callback when the done button is pressed to perform an action
            print('Done button pressed');
          },
        ),
      ),
    );
  }
}
