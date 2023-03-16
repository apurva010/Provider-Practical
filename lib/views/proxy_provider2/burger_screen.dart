import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/burger_pizza_billing.dart';

class BurgerScreen extends StatelessWidget {
  const BurgerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burger"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer2<Burger, Pizza>(
              builder: (context, burger, pizza, child) {
                return Column(
                  children: [
                    Text(burger.burgerPrice.toString()),
                    ElevatedButton(
                      onPressed: () {
                        burger.updateBurgerPrice(burger.burgerPrice + 50);
                      },
                      child: Text(
                        "Add Burger",
                      ),
                    ),
                    Text(pizza.pizzaPrice.toString()),
                    ElevatedButton(
                      onPressed: () {
                        pizza.updatePizzaPrice(pizza.pizzaPrice + 50);
                      },
                      child: Text(
                        "Add Pizza",
                      ),
                    ),
                    Text(context.watch<Bill>().billAmount.toString()),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
