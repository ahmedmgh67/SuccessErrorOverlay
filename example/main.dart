import 'package:flutter/material.dart';
import 'package:success_error_overlay/success_error_overlay.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () => setState(() => isVisible = true),
              child: Text("Show Overlay"),
            ),
          ),
          !isVisible ? Container() : SuccessErrorOverlay(
            onTap: () => setState(() => isVisible = false),
            isCorrect: true,
          ),
        ],
      ),
    );
  }
}
