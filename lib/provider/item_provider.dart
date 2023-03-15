import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  int numberOfItem;
  String itemName;

  ItemProvider({
    this.numberOfItem = 0,
    this.itemName = 'Mobile Phone',
  });

  void changeNumberOfItem(int newValue) {
    numberOfItem = newValue;
    notifyListeners();
  }
}

class PizzaProvider extends ChangeNotifier {
  int numberOfPizza;

  PizzaProvider({
    this.numberOfPizza = 0,
  });

  void changeNumberOfItem(int newValue) {
    numberOfPizza = newValue;
    notifyListeners();
  }
}
