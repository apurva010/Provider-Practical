import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/item_provider.dart';
import 'package:provider_example/views/screen2.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ItemProvider itemProvider = Provider.of<ItemProvider>(context);
    // PizzaProvider pizzaProvider = Provider.of<PizzaProvider>(context);
    print("object");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PizzaProvider(),
        ),
      ],
      builder: (context, child) {
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
                            .changeNumberOfItem(Provider.of<ItemProvider>(
                                        context,
                                        listen: false)
                                    .numberOfItem +
                                1);
                      },
                      child: Text("ADD"),
                    ),
                  ],
                ),
                Text("Number of Pizza"),
                Text(Provider.of<PizzaProvider>(context, listen: false)
                    .numberOfPizza
                    .toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("object2");
                        Provider.of<PizzaProvider>(context, listen: false)
                            .changeNumberOfItem(Provider.of<PizzaProvider>(
                                        context,
                                        listen: false)
                                    .numberOfPizza +
                                1);
                      },
                      child: Text("ADD"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Screen2(),
                      ),
                    );
                  },
                  child: Text(
                    "Screen 2",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
