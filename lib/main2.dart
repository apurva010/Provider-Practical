import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person with ChangeNotifier {
  Person({required this.name, required this.age});

  final String name;
  int age;

  void increaseAge() {
    age++;
    notifyListeners();
  }
}

class Job with ChangeNotifier {
  Job(
    this.person, {
    required this.career,
  });

  final Person person;
  String career;
  String get title {
    if (person.age >= 28) return 'Dr. ${person.name}, $career PhD';
    return '${person.name}, Student';
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Person>(
          create: (_) => Person(name: 'Yohan', age: 25),
        ),
        ChangeNotifierProxyProvider<Person, Job>(
          create: (BuildContext context) =>
              Job(Provider.of<Person>(context, listen: false), career: 'PhD'),
          update: (context, person, previous) => Job(person, career: 'Vet'),
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
      home: HomeScreen2(),
    );
  }
}

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Hi, may name is ${context.select((Job j) => j.person.name)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Age: ${context.select((Job j) => j.person.age)}',
              ),
              Text(context.watch<Job>().title),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Person>(context, listen: false).increaseAge(),
      ),
    );
  }
}
