import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/models/blogModel.dart';

import 'package:jobapp/services/dio_interceptor.dart';

class BlogState extends ChangeNotifier {
  BlogState() {
    getBlog();
  }
  bool isLoading = false;

  Dio dio = dioService();
  BlogModel? blogModel;

  getBlog() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/blogs');
      blogModel = BlogModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
