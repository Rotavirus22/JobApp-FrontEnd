import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobapp/provider/bottomState/bottomState.dart';
import 'package:jobapp/provider/chat/lastMessage.dart';
import 'package:jobapp/provider/features/apply_job.dart';
import 'package:jobapp/provider/features/chatState.dart';
import 'package:jobapp/provider/features/getBlog.dart';
import 'package:jobapp/provider/features/getJobs.dart';
import 'package:jobapp/provider/features/get_apply.dart';
import 'package:jobapp/provider/features/profile.dart';
import 'package:jobapp/provider/features/search_state.dart';
import 'package:jobapp/provider/forgotPassword/forgotPassword.dart';
import 'package:jobapp/provider/forgotPassword/resetPassword.dart';
import 'package:jobapp/provider/login/login_state.dart';
import 'package:jobapp/provider/register/registerState.dart';
import 'package:jobapp/provider/splash/splash_state.dart';
import 'package:jobapp/screens/common/bottom_navigation/bottom_navigation.dart';
import 'package:jobapp/screens/common/landing/landingScreen.dart';
import 'package:jobapp/screens/drawerScreens/blogs.dart';
import 'package:jobapp/screens/drawerScreens/myapplies.dart';
import 'package:jobapp/screens/homeScreens/chat/chatScreen.dart';
import 'package:jobapp/screens/homeScreens/features/apply_screen.dart';
import 'package:jobapp/screens/homeScreens/features/blogDetail.dart';
import 'package:jobapp/screens/homeScreens/features/detailScreen.dart';
import 'package:jobapp/screens/homeScreens/home.dart';
import 'package:jobapp/screens/homeScreens/profile.dart';
import 'package:jobapp/screens/homeScreens/search/search.dart';
import 'package:jobapp/screens/users/forgot_password.dart';
import 'package:jobapp/screens/users/login.dart';
import 'package:jobapp/screens/users/register.dart';
import 'package:jobapp/screens/splash.dart';
import 'package:jobapp/screens/users/reset_password.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigagorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
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
        "/home": (context) => ChangeNotifierProvider(
              create: (_) => JobState(),
              child: HomeScreen(),
            ),
        '/profile': (context) => ChangeNotifierProvider(
              create: (_) => ProfileState(),
              child: Profile(),
            ),
        '/bottomNav': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => BottomState(),
                ),
                ChangeNotifierProvider(
                  create: (_) => JobState(),
                ),
                ChangeNotifierProvider(
                  create: (_) => LastMessageState(),
                ),
              ],
              child: const BottomNavigation(),
            ),
        '/applyScreen': (context) => ChangeNotifierProvider(
              create: (_) => ApplyState(context),
              child: ApplyScreen(),
            ),
        '/forgotPassword': (context) => ChangeNotifierProvider(
              create: (_) => ForgotPasswordState(),
              child: ForgotPassword(),
            ),
        '/resetPassword': (context) => ChangeNotifierProvider(
              create: (_) => ResetPasswordState(context),
              child: ResetPassword(),
            ),
        '/details': (context) => DetailScreen(),
        '/blogScreen': (context) => ChangeNotifierProvider(
              create: (_) => BlogState(),
              child: Blogs(),
            ),
        '/blogDet': (context) => BlogDetails(),
        '/landing': (context) => LandingScreen(),
        '/chatScreen': (context) => ChangeNotifierProvider(
              create: (_) => ChatState(context),
              child: ChatScreen(),
            ),
        '/search': (context) => ChangeNotifierProvider(
              create: (_) => SearchState(context),
              child: SearchScreen(),
            ),
        '/MyApply': (context) => ChangeNotifierProvider(
              create: (_) => MyApply(),
              child: MyApplies(),
            ),
      },
    );
  }
}
