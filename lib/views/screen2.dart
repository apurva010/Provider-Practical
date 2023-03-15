import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/item_provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ItemProvider itemProvider = Provider.of<ItemProvider>(context);
    // PizzaProvider pizzaProvider = Provider.of<PizzaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${Provider.of<ItemProvider>(context).itemName}\'s Quantity : ',
            ),
            Text(
              '${Provider.of<ItemProvider>(context).numberOfItem}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ItemProvider>(context, listen: false)
                        .changeNumberOfItem(
                            Provider.of<ItemProvider>(context, listen: false)
                                    .numberOfItem +
                                1);
                  },
                  child: Text("ADD"),
                ),
              ],
            ),
            Text("Number of Pizza"),
            Text(Provider.of<PizzaProvider>(context).numberOfPizza.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("object2");
                    Provider.of<PizzaProvider>(context, listen: false)
                        .changeNumberOfItem(
                            Provider.of<PizzaProvider>(context, listen: false)
                                    .numberOfPizza +
                                1);
                  },
                  child: Text("ADD"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
