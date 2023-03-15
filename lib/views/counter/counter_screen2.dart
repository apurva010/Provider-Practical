import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_class.dart';

class Counter2 extends StatelessWidget {
  const Counter2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      ProviderCounter count = Provider.of<ProviderCounter>(context);
      return Scaffold(
        body: Center(
          child: Text(context.watch<ProviderCounter>().counter.toString()),
        ),
      );
    });
  }
}
