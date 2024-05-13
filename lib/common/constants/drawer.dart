import 'package:flutter/material.dart';
import 'package:jobapp/common/app_images.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/local_storage.dart';
import 'package:jobapp/themes/app_themes.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.asset(AppImages.logo),
          ),
          elHeightSpan,
          mHeightSpan,
          ListTile(
            title: Text(
              'Blogs',
              style: AppTheme().lightTheme.textTheme.bodyMedium,
            ),
            onTap: () {
              navigagorKey.currentState!.pushNamed('/blogScreen');
            },
          ),
          ListTile(
            title: Text(
              'My Applies',
              style: AppTheme().lightTheme.textTheme.bodyMedium,
            ),
            onTap: () {
              navigagorKey.currentState!.pushNamed('/MyApply');
            },
          ),
          ListTile(
            title: Text(
              'Terms and Conditons',
              style: AppTheme().lightTheme.textTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Lauda Lasun',
              style: AppTheme().lightTheme.textTheme.bodyMedium,
            ),
            onTap: () {},
          ),
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          elHeightSpan,
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text(
              'Log Out',
              style: AppTheme().lightTheme.textTheme.bodyMedium,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 150,
                            width: 100,
                            child: Column(
                              children: [
                                Text('Do you really want to Log Out?'),
                                lHeightSpan,
                                elHeightSpan,
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        localStorage.remove('token');
                                        navigagorKey.currentState!
                                            .pushReplacementNamed('/login');
                                      },
                                      child: Text('Yes'),
                                    ),
                                    elWidthSpan,
                                    elWidthSpan,
                                    TextButton(
                                      onPressed: () {
                                        navigagorKey.currentState!.pop();
                                      },
                                      child: Text('No'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}
