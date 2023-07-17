import 'package:flutter/material.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';

class ApplicationTheme {
  /**
   ####################### Application dark theme property ##############################
   */
  static ThemeData applicationDarkTheme = ThemeData.dark().copyWith(
      textTheme: TextTheme(
        button: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline1: TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline2: TextStyle(
            color: Colors.white,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline3: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline4: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline5: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline6: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),

      /**
     * -------------------- Scaffold Background Color -----------------------
     */
      scaffoldBackgroundColor: Colors.black,
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: Color(0xFF90AD19),
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */
      primaryTextTheme: TextTheme(
        button: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline1: TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline2: TextStyle(
            color: Colors.white,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline3: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline4: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline5: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline6: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: DrawerThemeData(backgroundColor: Colors.black),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Color(0xFF90AD19),
          side: BorderSide(color: Color(0xFF90AD19), width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Color(0xFF90AD19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          primary: Color(0xFF90AD19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF90AD19),
        foregroundColor: Colors.white,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Color(0xFF90AD19),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF90AD19))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFF90AD19)),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Color(0xFF90AD19)),
      /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: IconThemeData(color: Color(0xFF90AD19)));

  /**
   * ############################# Application light theme property ###########################
   */

  static ThemeData applicationLightTheme = ThemeData.light().copyWith(
      /**
     * -------------------- Scaffold Background Color -----------------------
     */
      scaffoldBackgroundColor: Colors.white,
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: Color(0xFF90AD19),
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */

      textTheme: TextTheme(
        button: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline1: TextStyle(
            color: Colors.black,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline2: TextStyle(
            color: Colors.black,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline3: TextStyle(
            color: Colors.black,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline4: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline5: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyText2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        subtitle1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),
      primaryTextTheme: TextTheme(
        button: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline1: TextStyle(
            color: Colors.black,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline2: TextStyle(
            color: Colors.black,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline3: TextStyle(
            color: Colors.black,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline4: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline5: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headline6: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyText2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        subtitle1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          primary: Color(0xFF90AD19),
          side: BorderSide(color: Color(0xFF90AD19), width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          primary: Color(0xFF90AD19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: Colors.black),
          primary: Color(0xFF90AD19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF90AD19),
        foregroundColor: Colors.black,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Color(0xFF90AD19),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF90AD19))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFF90AD19)),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Color(0xFF90AD19)),
      /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: IconThemeData(color: Color(0xFF90AD19)));
}
