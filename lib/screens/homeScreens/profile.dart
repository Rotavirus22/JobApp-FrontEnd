import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobapp/common/constants/k_button.dart';
import 'package:jobapp/common/constants/text_field.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/provider/features/profile.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileState = Provider.of<ProfileState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimColor,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: profileState.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Choose Image Source',
                                        style: AppTheme()
                                            .lightTheme
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            navigagorKey.currentState!.pop();
                                            profileState.pickPhotoImage(
                                                ImageSource.camera);
                                          },
                                          child: Text('Capture from Camera'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            profileState.pickPhotoImage(
                                                ImageSource.gallery);
                                            profileState.postImage();
                                          },
                                          child: Text('Pick from Gallery'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.network(profileState
                                      .dashBoardModel?.data?.profilePicture ??
                                  ''),
                            ),
                          ),
                          mWidthSpan,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              lHeightSpan,
                              Text(
                                profileState.dashBoardModel?.data?.fullName ??
                                    'N/A',
                                style: AppTheme()
                                    .lightTheme
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(letterSpacing: 1.5),
                              ),
                              xsHeightSpan,
                              Text(
                                profileState
                                        .dashBoardModel?.data?.workPosition ??
                                    'N/A',
                                style: AppTheme()
                                    .lightTheme
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(letterSpacing: 1.5),
                              ),
                            ],
                          ),
                          elWidthSpan,
                          elWidthSpan,
                          lWidthSpan,
                          lWidthSpan,
                          Align(
                            alignment: FractionalOffset.centerRight,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Edit Info',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        actions: [
                                          kTextFormFIeld(
                                            onChanged:
                                                profileState.onUserNameChanged,
                                            obscureText: false,
                                            labelText: 'User name',
                                          ),
                                          mHeightSpan,
                                          kTextFormFIeld(
                                            onChanged: profileState
                                                .onWorkPositionChanged,
                                            obscureText: false,
                                            labelText: 'Work Position',
                                          ),
                                          lHeightSpan,
                                          KButton(
                                            onPressed: () {
                                              profileState.editInfo();
                                              navigagorKey.currentState!.pop();
                                            },
                                            child: Text('Edit'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.edit_square),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  mHeightSpan,
                  Text('My Details'),
                  lHeightSpan,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      sHeightSpan,
                      Container(
                        height: 40,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              profileState.dashBoardModel?.data?.email ??
                                  'N/A'),
                        ),
                      ),
                      mHeightSpan,
                      Text('Phone Number'),
                      sHeightSpan,
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      mHeightSpan,
                      Text('Email'),
                      sHeightSpan,
                      Container(
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
