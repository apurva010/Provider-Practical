import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/counter_provider.dart';
import 'package:provider_example/views/counter/counter_screen2.dart';

class CounterScreen1 extends StatelessWidget {
  const CounterScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<CounterProvider>(context).count.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterProvider>(context, listen: false)
                        .increment();
                  },
                  child: Text("Add"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterProvider>(context, listen: false)
                        .decrement();
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CounterScreen2(),
                  ));
                },
                child: Text("Counter Screen 2")),
          ],
        ),
      ),
    );
  }
}
