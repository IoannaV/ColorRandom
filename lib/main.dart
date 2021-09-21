import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/color_provider.dart';
import 'home_page.dart';

//TODO: call color random before widget
void main() {
  runApp(ChangeNotifierProvider<ColorCreator>(
      create: (context) => ColorCreator(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
