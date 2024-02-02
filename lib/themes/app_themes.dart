import 'package:flutter/material.dart';

const mainFontFamily = 'Poppins';
const appPrimaryColor = Color(0xFF51FFAB);
const secondaryColor = Color(0xFFFFE70B);

const textFieldColor = Color(0xFFA4C2EB);
const suffixIconcolor = Color(0xFFBABABA);
final erorMessageColor = Colors.red.shade300;
const containerColor = Color(0xFFF3F6F9);

//task priority colors
const lowBgcolor = Colors.white;
const mediumBgColor = Color(0xFF91D5FF);
const highBgColor = Color(0xFFfffbe6);
const urgentBgColor = Color(0xFFFFF1f0);
//task priority text color
const lowTextColor = Colors.grey;
const mediumTextColor = Color(0xFF096dd9);
const highTextColor = Color(0xFFd48806);
const urgentTextColor = Color(0xFFcF1322);
//task priority boarder color

final lowBoarderColor = Colors.grey.shade400;
const mediumBoarderColor = Color(0xFF91D5FF);
const highBoarderColor = Color(0xFFffe58f);
const urgentBoarderColor = Color(0xFFFFa39e);

//error color
const errorColor = Color(0xFFF76567);
final sucessColor = Colors.greenAccent.shade700;

//circleAvatar color
const avatarBackgroundColor = Color.fromRGBO(91, 91, 91, 91);

//app light theme
class AppTheme {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFF6F6F6),

//Floating action buttom
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: appPrimaryColor,
    ),
    //for time
    timePickerTheme: const TimePickerThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)))),
    //for date
    dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)))),
    appBarTheme: const AppBarTheme(
        elevation: 1,
        backgroundColor: containerColor,
        iconTheme: IconThemeData(color: Colors.black)),

    //Text Theme
    textTheme: TextTheme(
      bodyLarge: const TextStyle(
          fontFamily: mainFontFamily,
          fontSize: 25,
          color: Colors.black,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600),
      bodyMedium: const TextStyle(
          fontFamily: mainFontFamily,
          fontSize: 15,
          letterSpacing: 0.5,
          color: Color(0xFF1e1e1e),
          fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
          fontFamily: mainFontFamily,
          fontSize: 12,
          letterSpacing: 0.5,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500),
    ),
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    // }),

    //card
    cardTheme: const CardTheme(
      margin: EdgeInsets.all(0),
      elevation: 0,
      // elevation: 4,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
    ),
  );
}
