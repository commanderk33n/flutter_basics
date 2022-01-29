import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello World',
          style: GoogleFonts.leckerliOne(fontSize: 40),
        ),
        Text(
          'Text can wrap without issue',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. '),
        Divider(),
        RichText(
          text: TextSpan(
            text: 'Flutter text is ',
            style: TextStyle(fontSize: 22, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'really ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                children: [
                  TextSpan(
                    text: 'Powerful.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
