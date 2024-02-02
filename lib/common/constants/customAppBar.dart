import 'package:flutter/material.dart';
import 'package:jobapp/themes/app_themes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.child});
  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              appPrimaryColor,
              Color(0xFF5effb1),
              Color(0xFF68FFB6),
              Color(0xFF7FFFC0),
              Color(0xFF8AFFC6),
              Color(0xFFAAFFD6),
              Color(0xFFBDFCDD),
            ],
            tileMode: TileMode.mirror),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
        ),
      ),
      child: child,
    );
  }
}
