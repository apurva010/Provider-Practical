import 'package:flutter/material.dart';

class ProviderCounter extends ChangeNotifier {
  int counter;
  ProviderCounter({this.counter = 0});

  void increment() {
    counter++;
    notifyListeners();
  }

  void decriment() {
    counter--;
    notifyListeners();
  }
}
