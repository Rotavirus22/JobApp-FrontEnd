// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/models/dashBoardModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/themes/app_themes.dart';

class ProfileState extends ChangeNotifier {
  ProfileState() {
    getDashboardInfo();
  }

  File? photo;
  String? userName;
  String? workPosition;

  Dio dio = dioService();

  bool isLoading = false;

  onUserNameChanged(value) {
    userName = value;
    notifyListeners();
  }

  onWorkPositionChanged(value) {
    userName = value;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source, Function(File) setImage) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setImage(File(pickedImage.path));
      postImage();
      notifyListeners();
    }
  }

  void pickPhotoImage(ImageSource source) {
    pickImage(source, (File image) => photo = image);
    postImage();
  }

  DashboardModel? dashBoardModel;
  getDashboardInfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/users/dashboard');
      dashBoardModel = DashboardModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.message);
    }
    isLoading = false;
    notifyListeners();
  }

  postImage() async {
    isLoading = true;
    notifyListeners();
    var data = {'profilePicture': photo};
    try {
      var response = await dio.post('/users/uploadProfilePicture', data: data);
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      navigagorKey.currentState!.pop();
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  editInfo() async {
    isLoading = true;
    notifyListeners();
    var data = {
      'user_name': userName,
      'workPosition': workPosition,
    };
    try {
      var response = await dio.patch('/users', data: data);
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      navigagorKey.currentState!.pop();
    } on DioException catch (e) {
      print(e);
    }
  }
}
