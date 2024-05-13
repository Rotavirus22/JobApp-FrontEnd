import 'package:flutter/material.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/themes/app_themes.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String title = args['title'];
    String company = args['company'];
    String logo = args['logo'];
    String date = args['date'];
    String content = args['content'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimColor,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 90, 0, 0),
                child: CircleAvatar(
                  radius: 50,
                  child: Image.network(logo),
                ),
              ),
            ],
          ),
          mHeightSpan,
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: AppTheme().lightTheme.textTheme.bodyLarge,
                        ),
                        elHeightSpan,
                        lHeightSpan,
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_2_outlined),
                                xsWidthSpan,
                                Text(company),
                              ],
                            ),
                            elWidthSpan,
                            lWidthSpan,
                            elWidthSpan,
                            mWidthSpan,
                            Row(
                              children: [
                                Icon(Icons.calendar_month_outlined),
                                xsWidthSpan,
                                Text(date),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                elHeightSpan,
                Text(content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
