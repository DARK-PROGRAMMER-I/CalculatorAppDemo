import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {

  final color;
  final textColor;
  final String buttonText;

  MyButtons({this.color, this.textColor, this.buttonText: "abc"});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8),

      child: ClipRRect( // Basically we are using this widget as we want our container to be rounded

        borderRadius: BorderRadius.circular(20),

        child: Container(

          color: color,
          child: Container(

            child: Center(
              child: Text(buttonText, style: TextStyle( color: textColor),),
            ),
          ),
        ),
      ),
    );
  }
}
