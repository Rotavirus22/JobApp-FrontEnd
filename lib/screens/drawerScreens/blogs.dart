import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/kJobContainer.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/provider/features/getBlog.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    final blogState = Provider.of<BlogState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23458C),
        title: Text(
          'Blogs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 4),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemCount: blogState.blogModel?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  String? dateString =
                      blogState.blogModel?.data?[index].createdAt;
                  DateTime dateTime = DateTime.parse(dateString!);
                  String formattedDate = DateFormat.MMMMd().format(dateTime);

                  return GestureDetector(
                    onTap: () {
                      navigagorKey.currentState!.pushNamed(
                        '/blogDet',
                        arguments: {
                          'title': blogState.blogModel?.data?[index].blogTitle,
                          'logo': blogState.blogModel?.data?[index].userImage,
                          'company': blogState.blogModel?.data?[index].userName,
                          'date': formattedDate,
                          'content':
                              blogState.blogModel?.data?[index].blogContent,
                        },
                      );
                    },
                    child: KJobContainer(
                      title: blogState.blogModel?.data?[index].blogTitle,
                      logo: blogState.blogModel?.data?[index].userImage,
                      company: blogState.blogModel?.data?[index].userName,
                      salaryTitle: formattedDate,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
