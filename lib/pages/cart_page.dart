import 'package:coffee/components/coffee_tile.dart';
import 'package:coffee/models/coffee.dart';
import 'package:coffee/models/coffee_shop.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    // Flushbar(
    //   title: "${coffee.name} is removed...",
    //   titleColor: Colors.black,
    //   titleSize: 15,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   flushbarStyle: FlushbarStyle.FLOATING,
    //   reverseAnimationCurve: Curves.decelerate,
    //   forwardAnimationCurve: Curves.elasticOut,
    //   backgroundColor: Colors.white10,
    //   duration: const Duration(seconds: 2),
    // ).show(context);

    var snackBar = SnackBar(
      content: Text(
        "${coffee.name} is removed...",
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.white10,
      clipBehavior: Clip.none,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void payNow() {
    var cart = Provider.of<CoffeeShop>(context, listen: false).userCart;
    double total = 0;
    for (var coffee in cart) {
      total = total + double.parse(coffee.price);
    }
    var subTotal = double.parse(total.toStringAsFixed(2));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("You Have To Pay: \$$subTotal"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, index) => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            Coffee eachCoffee = value.userCart[index];
                            return CoffeeTile(
                                coffee: eachCoffee,
                                onPressed: () => removeFromCart(eachCoffee),
                                icon: const Icon(Icons.delete));
                          })),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: payNow,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
