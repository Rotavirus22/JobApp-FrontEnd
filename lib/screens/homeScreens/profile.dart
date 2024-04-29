import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/customAppBar.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/provider/features/profile.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final dashBoardstate = Provider.of<ProfileState>(context);
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          12), // Adjust the radius as needed
                    ),
                    height: 200,
                    width: 370,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dashBoardstate.dashBoardModel?.data?.fullName ??
                            'N/A'),
                        sHeightSpan,
                        Text(
                            dashBoardstate.dashBoardModel?.data?.workPosition ??
                                'N/A'),
                      ],
                    ),
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
