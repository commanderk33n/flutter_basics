import 'package:flutter/material.dart';
import 'package:stopwatch/stopwatch.dart';
import './login_screen.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        StopWatch.route: (context) => StopWatch(),
      },
      initialRoute: '/',
    );
  }
}
