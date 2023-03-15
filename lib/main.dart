import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/proxy_provider.dart';
import 'package:provider_example/views/proxy_provider/food_home.dart';

import 'views/counter/counter_main.dart';
import 'views/counter/provider_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderCounter(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodProvider(),
        ),
        ChangeNotifierProxyProvider<FoodProvider, Billing>(
          create: (context) =>
              Billing(Provider.of<FoodProvider>(context, listen: false)),
          update: (context, foodProvider, previous) => Billing(foodProvider),
        )
      ],
      /*MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PizzaProvider(),
        ),
      ],*/
      child: MaterialApp(
        title: "Provider Practical",
        home: FoodHome(),
        //home: Counter1(),
      ),
    );
  }
}
