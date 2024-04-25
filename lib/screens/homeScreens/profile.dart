import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/provider/features/getJobs.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final dashBoardstate = Provider.of<JobState>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomAppBar(),
            Column(
              children: [
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          12), // Adjust the radius as needed
                    ),
                    height: 200,
                    width: 370,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
            ),
            Column(
              children: [
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                elHeightSpan,
                Center(child: Text('My Applied Job')),
                lHeightSpan,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
