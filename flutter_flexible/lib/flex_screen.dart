import 'package:flutter/material.dart';

class FlexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible and Expanded'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._header(context, 'Expanded'),
          _buildExpanded(context),
          ..._header(context, 'Flexible'),
          _buildFlexible(context),
        ],
      ),
    );
  }
}

Iterable<Widget> _header(BuildContext context, String text) {
  return [
    SizedBox(
      height: 20,
    ),
    Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    ),
  ];
}

Widget _buildExpanded(BuildContext context) {
  return Container();
}

Widget _buildFlexible(BuildContext context) {
  return Container();
}

Widget _buildFooter(BuildContext context) {
  return Container();
}
