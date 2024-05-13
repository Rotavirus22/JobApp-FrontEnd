import 'package:carousel_slider/carousel_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/services/dio_interceptor.dart';

class BottomState extends ChangeNotifier {
  PageController pageController = PageController();

  Dio dio = dioService();
  int currentValue = 0;
  bool isLoading = false;

  int current = 0;

  onPageChanged(value) {
    currentValue = value;
    notifyListeners();
  }

  onTap(value) {
    currentValue = value;
    notifyListeners();
  }

  onCarChanged(int index, CarouselPageChangedReason reason) {
    current = index;
    notifyListeners();
  }
}
