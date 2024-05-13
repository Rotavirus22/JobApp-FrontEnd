import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/models/dashBoardModel.dart';
import 'package:jobapp/models/messageModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';

class LastMessageState extends ChangeNotifier {
  LastMessageState() {
    getUserInfo();
  }
  MessageModel? _lastMessage;
  bool isLoading = false;

  MessageModel? get lastMessage => _lastMessage;

  DashboardModel? dashboardModel;

  void updateLastMessage(MessageModel message) {
    _lastMessage = message;
    notifyListeners();
  }

  Dio dio = dioService();

  getUserInfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/users/dashboard');
      dashboardModel = DashboardModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
