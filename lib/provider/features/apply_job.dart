import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobapp/common/constants/flutterToast.dart';
import 'package:jobapp/main.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:jobapp/themes/app_themes.dart';

class ApplyState extends ChangeNotifier {
  ApplyState(context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    jobId = args["id"];
    jobTitle = args["title"];
    jobSalary = args["salary"];
    company = args["company"];
    location = args["location"];
  }

  Dio dio = dioService();

  String? location;
  String? company;
  String? jobSalary;
  String? jobTitle;
  String? jobId;
  String? coverLetter;
  String? salaryDemand;
  File? pdfFile;
  bool isLoading = false;
  double uploadProgress = 0;

  onCoverLetterChanged(value) {
    coverLetter = value;
    notifyListeners();
  }

  onSalaryDemandChanged(value) {
    salaryDemand = value;
    notifyListeners();
  }

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      pdfFile = File(result.files.single.path!);
      notifyListeners();
    } else {
      print('User canceled the file picker.');
    }
  }

  applyJob() async {
    isLoading = true;
    notifyListeners();

    if (pdfFile == null) {
      print('No PDF file selected.');
      isLoading = false;
      notifyListeners();

      Utils().toastMessage(
          message: "No PDF Selected",
          bgColor: errorColor,
          gravity: ToastGravity.TOP);

      return;
    }

    FormData data = FormData.fromMap({
      'job_id': jobId,
      'cover_letter': coverLetter,
      'expected_Salary': salaryDemand,
      'pdf': await MultipartFile.fromFile(pdfFile!.path,
          filename: 'selected_pdf.pdf'),
    });
    try {
      var response = await dio.post(
        '/job/applyJob',
        data: data,
        onSendProgress: (int sent, int total) {
          // Calculate the upload progress and update the UI
          double progress = sent / total;
          print('Upload progress: $progress');
          // You can use this progress value to update UI elements, like a progress bar
        },
      );
      Utils().toastMessage(
          message: response.data["message"], bgColor: sucessColor);
      navigagorKey.currentState!.pushReplacementNamed('/home');
    } on DioException catch (e) {
      print(e);
      var errorMessage =
          e.response?.data != null && e.response?.data['message'] != null
              ? e.response?.data['message']
              : 'Unknown error occurred';
      Utils().toastMessage(
          message: errorMessage,
          bgColor: errorColor,
          gravity: ToastGravity.TOP);
    }
    isLoading = false;
    notifyListeners();
  }
}
