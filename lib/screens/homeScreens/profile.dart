import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
