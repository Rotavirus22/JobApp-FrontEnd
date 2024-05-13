import 'package:flutter/material.dart';
import 'package:jobapp/themes/app_themes.dart';

class KButton extends StatelessWidget {
  const KButton({
    super.key,
    required this.onPressed,
    this.height,
    required this.child,
  });
  final Function() onPressed;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          foregroundColor: Colors.white,
          backgroundColor: appPrimColor),
    );
  }
}
