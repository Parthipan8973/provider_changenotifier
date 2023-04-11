import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: ChangeNotifierProvider(
        create: (BuildContext context) {
          return ChangeYourAge();
        },
        child: Providers(),
      )),
    );
  }
}

class Providers extends StatelessWidget {
  const Providers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Providers')),
      body: Center(
        child: Column(
          children: [
            Text('Count of numbers ${Provider.of<ChangeYourAge>(context).age}'),
            ElevatedButton(
                onPressed: () {
                  Provider.of<ChangeYourAge>(context, listen: false)
                      .decreaseage();
                },
                child: Text('Less'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ChangeYourAge>(context, listen: false).increaseage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ChangeYourAge extends ChangeNotifier {
  String name = 'Parthipan';
  int age = 25;

  void increaseage() {
    age++;
    notifyListeners();
  }

  void decreaseage() {
    age--;
    notifyListeners();
  }
}
