import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feed_back_page.dart';
import 'package:green_egypt/screens/home_page/home_page.dart';
import 'package:green_egypt/screens/introduction_screen/intro_screen_2.dart';
import 'package:green_egypt/screens/login_screen/login_screen.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:green_egypt/screens/register_page/register_page.dart';
import 'package:green_egypt/screens/splach_screen/splach_screen.dart';
import 'package:green_egypt/screens/start_screen/start_screen.dart';

class PagesNames {
  static String introductionScreen = "/intro";
  static String splachScreen = "/splach";
  static String loginScreen = "/login";
  static String homePage = "/homePage";
  static String startScreen = "/start";
  static String registerPage = "/register";
  static String feedBackPage = "/feedBack";
  static String morePage = "/morePage";
  static String qrcodePage = "/qrcodePage";
  static String transactionsHistoryPage = "/transactionsHistoryPage";
  static List<GetPage> listOfPages = [
    GetPage(
        name: PagesNames.splachScreen,
        page: () => SplachScreenCustom(),
        transition: Transition.fade),
    GetPage(
        name: PagesNames.introductionScreen,
        page: () => IntroductionScreen(),
        transition: Transition.fade),
    GetPage(
        name: PagesNames.loginScreen,
        page: () => LoginScreen(),
        transition: Transition.fade),
    GetPage(
        name: homePage, page: () => HomePage(), transition: Transition.fade),
    GetPage(
        name: startScreen,
        page: () => StartScreen(),
        transition: Transition.fade),
    GetPage(
        name: registerPage,
        page: () => RegisterPage(),
        transition: Transition.fade),
    GetPage(
        name: feedBackPage,
        page: () => FeedbackPage(),
        transition: Transition.rightToLeft),
    // GetPage(
    //     name: morePage, page: () => MorePage(), transition: Transition.fade),
    // GetPage(
    //     name: qrcodePage,
    //     page: () => QrCodePageBody(),
    //     transition: Transition.fade),

    // GetPage(
    //     name: transactionsHistoryPage,
    //     page: () => TransactionPage(),
    //     transition: Transition.fade),
  ];
}
