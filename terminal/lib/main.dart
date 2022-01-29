import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SaaS.de Terminal'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Reload'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _buildGrid(),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Reload':
        break;
    }
  }

  int _returnRandom() {
    var rng = Random();
    return (1 + rng.nextInt(9)) * 100;
  }

  Widget _buildGrid() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              'Mitarbeiter  $index',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          color: Colors.teal[_returnRandom()],
        );
      }),
    );
  }
}
