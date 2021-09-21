import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/color_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundRandomWidget(),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Hey there!",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundRandomWidget extends StatefulWidget {
  const BackgroundRandomWidget({Key? key}) : super(key: key);

  @override
  _BackgroundRandomWidgetState createState() => _BackgroundRandomWidgetState();
}

class _BackgroundRandomWidgetState extends State<BackgroundRandomWidget> {
  void generatePrevColor(BuildContext context) {
    var colorRandom = Provider.of<ColorCreator>(context, listen: true);
    colorRandom.createRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    var colorRandom = Provider.of<ColorCreator>(context, listen: true);

    return AnimatedContainer(
        duration: const Duration(seconds: 10),
        curve: Curves.easeIn,
        child: Material(
          color: colorRandom.colorPrev,
          child: InkWell(
            splashColor: colorRandom.color,
            onTap: () {
              setState(() {
                colorRandom.rewriteColor();
                colorRandom.createRandomColor();
              });
            },
          ),
        ));
  }
}
