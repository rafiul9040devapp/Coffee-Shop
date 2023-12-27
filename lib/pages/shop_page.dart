import 'package:coffee/components/coffee_tile.dart';
import 'package:coffee/models/coffee.dart';
import 'package:coffee/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    var snackBar = SnackBar(
      content: Text(
        "Successfully added to cart:  ${coffee.name}",
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
      ),
      duration: const Duration(milliseconds: 25),
      backgroundColor: Colors.white10,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //           title: Text("Successfully added to cart:  ${coffee.name}"),
    //         ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        Coffee eachCoffee = value.coffeeShop[index];
                        return CoffeeTile(
                          coffee: eachCoffee,
                          onPressed: () => addToCart(eachCoffee),
                          icon: const Icon(Icons.add),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
