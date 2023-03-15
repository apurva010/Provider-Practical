import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/views/counter/counter_screen2.dart';
import 'package:provider_example/views/counter/provider_class.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderCounter(),
      child: MaterialApp(
        home: Counter1(),
      ),
    );
  }
}

class Counter1 extends StatelessWidget {
  const Counter1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => ProviderCounter(),
    //   builder: (context, child) {
    ProviderCounter count = Provider.of<ProviderCounter>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${count.counter}"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => count.increment(), child: Text("add")),
            ElevatedButton(
                onPressed: () => count.decriment(), child: Text("remove")),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Counter2())),
              child: Text("Screen2"),
            ),
          ],
        ),
      ),
    );
    //     },
    //   );
  }
}
