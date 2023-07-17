import 'package:flutter/material.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page1.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page2.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page3.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page4.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  /**
   * Page Controller Object that used with both PageView Widget and smoothIndicator package
   */
  final pageController = PageController();

  late AssetImage image1;
  late AssetImage image2;
  late AssetImage image3;
  late AssetImage image4;
  /**
   * Object that will carry all intro Screen Pages . 
   */
  List<Widget> introPages = [];
  @override
  void initState() {
    /**
     * initialize images with it's path
     */
    image1 = const AssetImage('assets/introduction_images/first_design.png');
    image2 = const AssetImage('assets/introduction_images/second_design.png');
    image3 = const AssetImage('assets/introduction_images/third_design.png');
    image4 = const AssetImage('assets/introduction_images/fourth_design.png');
    /**
     * initialize introPages List to load pages with images , text , idicator m colors and buttons .
     */
    introPages = [
      Page1(image: image1, controller: pageController),
      Page2(image: image2, controller: pageController),
      Page3(image: image3, controller: pageController),
      Page4(image: image4, controller: pageController),
    ];
    super.initState();
  }

  @override
  /**
   * To make images preloaded while splach animation working , to increase the perfromance of the application
   */
  void didChangeDependencies() {
    /**
     * load image to memory to avoid loading glitch .
     */
    super.didChangeDependencies();
    precacheImage(image1, context);
    precacheImage(image2, context);
    precacheImage(image3, context);
    precacheImage(image4, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: introPages.length,
        itemBuilder: ((context, index) {
          return introPages[index];
        }),
      ),
    );
  }
}
