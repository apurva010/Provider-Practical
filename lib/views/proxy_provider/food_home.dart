import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/proxy_provider.dart';

class FoodHome extends StatelessWidget {
  const FoodHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Food Price : ${context.select(
                (Billing b) => b.foodProvider.foodPrice.toString(),
              )}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Quantity Of Food : ${context.select(
                (Billing b) => b.foodProvider.quantity.toString(),
              )}",
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<FoodProvider>(context, listen: false).updatePrice(
                    Provider.of<FoodProvider>(context, listen: false)
                            .foodPrice +
                        500,
                    Provider.of<FoodProvider>(context, listen: false).quantity +
                        2);
              },
              child: const Text("Increment"),
            ),
            Text(
              "Billing Amount : ${context.watch<Billing>().billPrice()}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
