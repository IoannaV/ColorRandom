import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/color_provider.dart';

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

    return Scaffold(
        body: AnimatedContainer(
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
      ),
    ));
  }
}
