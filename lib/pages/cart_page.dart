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
  }

  void payNow() {
    var cart = Provider.of<CoffeeShop>(context, listen: false).userCart;
    double total = 0;
    for (var coffee in cart) {
      total = total + double.parse(coffee.price);
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("You Have To Pay \$$total"),
            ));
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
                                icon: const Icon(Icons.delete)
                            );
                          })
                  ),
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
