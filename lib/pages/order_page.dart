import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';
import '../models/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  //customize sweetness
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  //customize sweetness
  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  //add to cart
  void addToCart() {
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);
//direct user back to shop page
    Navigator.pop(context);
    //let user know it has been successfully  added

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: const Color.fromARGB(255, 195, 169, 159),
      body: Column(children: [
        //drinks image
        Image.asset(widget.drink.imagePath),
        //sliders to customize drink
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //sweetness
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Sweet'),
                  ),
                  Expanded(
                    child: Slider(
                      value: sweetValue,
                      label: sweetValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizeSweet(value),
                    ),
                  )
                ],
              ),
              //Ice
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Ice'),
                  ),
                  Expanded(
                    child: Slider(
                      value: iceValue,
                      label: iceValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizeIce(value),
                    ),
                  )
                ],
              ),
              //Pearl
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Pearl'),
                  ),
                  Expanded(
                    child: Slider(
                      value: pearlValue,
                      label: pearlValue.toString(),
                      divisions: 4,
                      onChanged: (value) => customizePearl(value),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        //add to cart button
        MaterialButton(
          child:  Text(
            'Add to Cart',
            style:  TextStyle(color: Colors.white),
          ),
          color: Colors.brown,
          onPressed: addToCart,
        ),
      ]),
    );
  }
}
