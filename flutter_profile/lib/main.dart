import 'package:flutter/material.dart';
import 'package:flutter_profile/deep_tree.dart';
import 'package:flutter_profile/e_commerce_screen.dart';
import 'package:flutter_profile/profile_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ProfileScreen(),
      //home: DeepTree(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 10,
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 24,
            ),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6: TextStyle(
              fontFamily: 'LeckerliOne',
              fontSize: 24,
            ),
          ).headline6,
        ),
      ),
      home: ECommerceScreen(),
    );
  }
}
