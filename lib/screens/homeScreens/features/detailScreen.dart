import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/themes/app_themes.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String title = args['title'];
    String userId = args['userId'];
    String userName = args['userName'];
    String userImage = args['userImage'];
    String id = args['id'];
    String location = args['location'];
    String salary = args['salary'];
    String company = args['company'];
    String description = args['description'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 411,
              height: 249,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 64,
                          width: 64,
                          child: Image.network(userImage),
                        ),
                        mHeightSpan,
                        xxsHeightSpan,
                        Text(
                          title,
                          style: AppTheme()
                              .lightTheme
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 26),
                        ),
                        xxsHeightSpan,
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          child: Image.network(userImage),
                                        ),
                                        sWidthSpan,
                                        Text(
                                          company,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      KButton(
                                        onPressed: () {
                                          navigagorKey.currentState!.pushNamed(
                                              '/chatScreen',
                                              arguments: {
                                                'userId': userId,
                                                'userName': userName,
                                                'userImage': userImage,
                                              });
                                        },
                                        child: Text('Send Message'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            company,
                            style: AppTheme()
                                .lightTheme
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            mHeightSpan,
            Container(
              height: 146,
              width: 411,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Apply Before',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sHeightSpan,
                            Text(
                              'N/A',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ],
                        ),
                        elWidthSpan,
                        elWidthSpan,
                        lWidthSpan,
                        elWidthSpan,
                        Column(
                          children: [
                            Text(
                              'Job Nature',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sHeightSpan,
                            Text(
                              'N/A',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    lHeightSpan,
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Salary',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sHeightSpan,
                            Text(
                              salary,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ],
                        ),
                        elWidthSpan,
                        elWidthSpan,
                        lWidthSpan,
                        elWidthSpan,
                        mWidthSpan,
                        Column(
                          children: [
                            Text(
                              'Job Location',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sHeightSpan,
                            Text(
                              location,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            mHeightSpan,
            Container(
              height: 229,
              width: 411,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Job Description'),
                    lHeightSpan,
                    Text(
                      description,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: KButton(
                onPressed: () {
                  navigagorKey.currentState!
                      .pushNamed('/applyScreen', arguments: {
                    'id': id,
                    'title': title,
                    'location': location,
                    'company': company,
                    'salary': salary,
                  });
                },
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
