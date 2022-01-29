import 'package:flutter/material.dart';
import 'package:flutter_layout/immutable_widget.dart';
import 'package:flutter_layout/text-layout.dart';

class BasicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Welcome to Flutter'),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*  AspectRatio(
            aspectRatio: 1.0,
            child: ImmutableWidget(),
          ), */
          Image.asset('assets/beach.jpg'),
          TextLayout()
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text('Im a Drawer!'),
          ),
        ),
      ),
    );
  }
}
