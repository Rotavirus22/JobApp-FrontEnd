import 'package:flutter/material.dart';
import 'package:jobapp/provider/login/login_state.dart';
import 'package:jobapp/provider/register/registerState.dart';
import 'package:jobapp/provider/splash/splash_state.dart';
import 'package:jobapp/screens/home.dart';
import 'package:jobapp/screens/users/login.dart';
import 'package:jobapp/screens/users/register.dart';
import 'package:jobapp/screens/splash.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigagorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().lightTheme,
      initialRoute: "/login",
      navigatorKey: navigagorKey,
      routes: {
        "/": (context) => ChangeNotifierProvider(
              create: (_) => SplashState(),
              child: const SplashScreen(),
            ),
        "/login": (context) => ChangeNotifierProvider(
              create: (_) => LoginState(),
              child: LoginScreen(),
            ),
        "/register": (context) => ChangeNotifierProvider(
              create: (_) => RegisterState(),
              child: RegisterScreen(),
            ),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
