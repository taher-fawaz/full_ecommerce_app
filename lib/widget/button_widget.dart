import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  late String title;
  late Color color;
  late void Function() onPressed;
  ButtonWidget(this.title, this.color, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.red),
      ),
      color: color,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: TextSelectionTheme.of(context).selectionColor,
            fontSize: 26,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
