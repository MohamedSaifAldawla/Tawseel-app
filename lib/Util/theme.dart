import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kPrimaryColor = Color(0xFF308B85);
const kPrimary2Color = Color(0xFFEC920B);
const kPrimary3Color = Color(0xFFC0DEDC);
const kPrimaryLightColor = Colors.white;
const kInputColor = Color(0xffF9F9F9);
const kContainerColor = Color(0xffF3F3F3);
const kContainer2Color = Color(0xffD7DCF4);
const kInputIconColor = Color(0xff1C274C);
const kPrimaryDarkColor = Color(0xFF22272B);
const kPrimaryDark2Color = Color(0xff3D4144);
const kPrimaryDark3Color = Color(0xff2E343B);
const kSecondaryColor = Color.fromARGB(255, 134, 134, 134);
const kTextColor = Color.fromARGB(255, 62, 62, 62);
const kText2Color = Color(0xff2E2D3A);
const Color shadow = Color.fromARGB(60, 170, 170, 170);
const Color shadow2 = Color.fromARGB(255, 25, 24, 37);
const Color success = Color(0xFF40C7A5);
const Color error = Color(0xFFE84C5C);
const boxShadow = BoxShadow(
  color: shadow,
  blurRadius: 10,
  offset: Offset(0, 2),
);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [kPrimaryColor, kPrimary2Color],
);
const kSuccessGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF40C7A5), Color(0xFF21AD8B)],
);

const kErrorGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFE84C5C), Color(0xFFD82D3E)],
);

const kIndividualGradientColor = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: [kPrimary2Color, Color(0xff004EF8)],
);
const kAnimationDuration = Duration(milliseconds: 200);
const defaultDuration = Duration(milliseconds: 250);
double horizontalPadding = 30;

const appBarText = TextStyle(
  fontFamily: "Tajawal",
  fontSize: 18,
  color: kText2Color,
  fontWeight: FontWeight.w600,
);

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: kPrimaryLightColor,
    fontFamily: "Tajawal",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: kPrimaryLightColor,
      titleTextStyle: appBarText,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: kTextColor),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: kTextColor,
        height: 1.5,
      ),
      bodyText1: TextStyle(
        color: kTextColor,
      ),
      bodyText2: TextStyle(
        color: kTextColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 40,
        bottom: 0,
      ),
      filled: true,
      fillColor: kInputColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: kSecondaryColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: kPrimaryColor),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kPrimaryDarkColor,
    fontFamily: "Tajawal",
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: kPrimaryDarkColor,
      foregroundColor: kPrimaryLightColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: kPrimaryLightColor),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: kPrimaryLightColor,
        height: 1.5,
      ),
      bodyText1: TextStyle(
        color: kPrimaryLightColor,
      ),
      bodyText2: TextStyle(
        color: kPrimaryLightColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 40,
        bottom: 0,
      ),
      filled: true,
      fillColor: kPrimaryDarkColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: kPrimaryLightColor),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: kPrimaryColor),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
