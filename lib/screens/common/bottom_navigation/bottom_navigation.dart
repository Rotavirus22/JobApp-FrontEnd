import 'package:flutter/material.dart';
import 'package:jobapp/provider/bottomState/bottomState.dart';
import 'package:jobapp/screens/homeScreens/home.dart';
import 'package:jobapp/screens/homeScreens/more.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomState = Provider.of<BottomState>(context);
    List<Widget> pages = [
      HomeScreen(),
      MoreScreen(),
    ];
    return Scaffold(
      body: pages[bottomState.currentValue],
      bottomNavigationBar: Container(
        color: appPrimaryColor,
        child: BottomNavigationBar(
          onTap: bottomState.onTap,
          type: BottomNavigationBarType.fixed,
          iconSize: 26.0,
          currentIndex: bottomState.currentValue,
          backgroundColor: Color(0xFF23458C),
          selectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.black),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 50,
                child: Icon(
                  Icons.home_outlined,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: 50,
                child: Icon(
                  Icons.chat_bubble_outline,
                ),
              ),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
}
