import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/color_provider.dart';

void main() {
  runApp(
      // /    create: (context) => PhoneInputField()),
      // ChangeNotifierProvider<ListPart>(create: (context) => ListPart()),
      ChangeNotifierProvider<ColorCreator>(
          create: (context) => ColorCreator(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BackgroundRandomWidget());
  }
}

class BackgroundRandomWidget extends StatefulWidget {
  const BackgroundRandomWidget({Key? key}) : super(key: key);

  @override
  _BackgroundRandomWidgetState createState() => _BackgroundRandomWidgetState();
}

class _BackgroundRandomWidgetState extends State<BackgroundRandomWidget> {
  bool _pressed = true;

  void _buttonPressed() {
    _pressed = true;
  }

  @override
  Widget build(BuildContext context) {
    var colorRandom = Provider.of<ColorCreator>(context, listen: true);
    return Scaffold(
        backgroundColor: colorRandom.color,
        body: GestureDetector(
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Hey there!",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            ),
          ),
          onTapDown: (details) => setState(() => _pressed = false),
          onTapUp: (details) => setState(() => colorRandom.createRandomColor()),
          onTapCancel: () => setState(() => _pressed = false),
        ));
  }
}
