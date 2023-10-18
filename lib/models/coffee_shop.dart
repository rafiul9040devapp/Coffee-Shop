import 'package:coffee/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale

  final List<Coffee> _shop = [
    Coffee(
        name: "Long Black",
        price: "4.10",
        imagePath: "assets/images/coffee_cup.png"),
    Coffee(
        name: "Espresso",
        price: "4.20",
        imagePath: "assets/images/espresso.png"),
    Coffee(
        name: "Latte",
        price: "3.50",
        imagePath: "assets/images/latte.png"),
    Coffee(
        name: "Iced Tea",
        price: "4.50",
        imagePath: "assets/images/latte_macchiato.png"),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
