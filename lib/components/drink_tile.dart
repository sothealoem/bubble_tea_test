import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  final Widget trailing;
  DrinkTile({
    super.key,
    required this.onTap,
    required this.drink,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 226, 225, 222),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: trailing,
        ),
      ),
    );
  }
}
