import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count;

  CounterProvider({this.count = 0});

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
