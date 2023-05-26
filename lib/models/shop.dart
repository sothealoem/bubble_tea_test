import 'package:bubble_tea/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  //list of drink for sale
  final List<Drink> _shop = [
    //pearl milk tea
    Drink(
      name: "pearl Milk Tea",
      price: "4.00",
      imagePath: "lib/images/bub_tea.png",
    )
  ];
  //list of drinks in user cart
  final List<Drink> _userCart = [];
  //get drinks for sale

  List<Drink> get shop => _shop;

  //get user cart
  List<Drink> get cart => _userCart;

  //add drink to cart

  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove drink from cat
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
