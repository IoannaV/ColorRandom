import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.pink),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          "Hey there!",
          //style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
