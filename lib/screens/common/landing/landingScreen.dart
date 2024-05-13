import 'package:flutter/material.dart';
import 'package:jobapp/common/app_images.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/themes/app_themes.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late final PageController pageController;
  int pageNo = 0;

  final List<String> imagePaths = [
    AppImages.landingPageImage1,
    AppImages.landingPageImage2,
    AppImages.landingPageImage3,
  ];

  final List<String> pageTexts = [
    'Find your dream job today!',
    'Explore exciting career opportunities.',
    'Take the next step in your career journey.',
  ];

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            elHeightSpan,
            elHeightSpan,
            elHeightSpan,
            elHeightSpan,
            SizedBox(
              height: 450,
              width: 331,
              child: PageView.builder(
                controller: pageController,
                itemCount: imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    pageNo = index % imagePaths.length;
                  });
                },
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      return child!;
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          margin: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePaths[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 330,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    pageTexts[index],
                                    style: AppTheme()
                                        .lightTheme
                                        .textTheme
                                        .bodyLarge,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Container(
                              margin: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.circle,
                                color: pageNo == index
                                    ? AppTheme().lightTheme.primaryColor
                                    : avatarBackgroundColor,
                                size: 8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            elHeightSpan,
            elHeightSpan,
            lHeightSpan,
            mHeightSpan,
            elHeightSpan,
            elHeightSpan,
            mHeightSpan,
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: appPrimColor,
                    height: 60,
                    onPressed: () {
                      navigagorKey.currentState!.pushReplacementNamed('/login');
                    },
                    child: Text('Login'),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    height: 60,
                    color: appPrimColor,
                    onPressed: () {
                      navigagorKey.currentState!
                          .pushReplacementNamed('/register');
                    },
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
