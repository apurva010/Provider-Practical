import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/burger_pizza_billing.dart';
import 'package:provider_example/views/proxy_provider2/burger_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Burger>(
          create: (_) => Burger(),
        ),
        ChangeNotifierProvider<Pizza>(
          create: (_) => Pizza(),
        ),
        ChangeNotifierProxyProvider2<Burger, Pizza, Bill>(
          create: (BuildContext context) => Bill(
              Provider.of<Burger>(context, listen: false),
              Provider.of<Pizza>(context, listen: false)),
          update: (context, burger, pizza, previous) => Bill(burger, pizza),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BurgerScreen(),
    );
  }
}
