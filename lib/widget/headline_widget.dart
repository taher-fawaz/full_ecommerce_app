import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineWidget extends StatelessWidget {
  late bool darkTheme;
  late String title;
  HeadlineWidget(this.title, this.darkTheme);
  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            color: darkTheme ? Theme.of(context).disabledColor : Colors.black,
            textStyle: Theme.of(context).textTheme.headline4));
  }
}
