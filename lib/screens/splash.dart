import 'package:flutter/material.dart';
import 'package:jobapp/common/app_images.dart';
import 'package:jobapp/provider/splash/splash_state.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashState = Provider.of<SplashState>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(AppImages.logo),
            ),
          ],
        ),
      ),
    );
  }
}
