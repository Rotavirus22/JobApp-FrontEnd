import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/models/jobModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';

class SearchState extends ChangeNotifier {
  late TextEditingController searchController;
  late FocusNode searchFocusNode;
  late bool isKeyboardOpen;

  String? searchVal;
  bool isLoading = false;
  JobModel? jobModel;

  Dio dio = dioService();

  SearchState(BuildContext context) {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    isKeyboardOpen = false;
    _openKeyboard(context);
    fetchSearchResult();
  }

  void _openKeyboard(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      FocusScope.of(context).requestFocus(searchFocusNode);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  onSearchChanged(value) {
    searchVal = value;
    notifyListeners();
  }

  fetchSearchResult() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get(
        "/search",
        queryParameters: {'title': searchVal},
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        jobModel = JobModel.fromJson(responseData);
      } else {
        throw Exception('Failed to load search results');
      }
      print(response.data);
    } on DioException catch (e) {
      print(e);
    } finally {
      // Ensure to call notifyListeners after the operation is complete
      isLoading = false;
      notifyListeners();
    }
  }
}
