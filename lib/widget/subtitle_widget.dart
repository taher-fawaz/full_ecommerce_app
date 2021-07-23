import 'package:flutter/material.dart';
import 'package:e_commerce/Controller/constants/colors.dart';

class SubTitleWidget extends StatelessWidget {
  late bool darkTheme;
  late String title;
  SubTitleWidget(this.title, this.darkTheme);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: darkTheme
              ? Theme.of(context).disabledColor
              : ColorsConsts.subTitle,
          fontSize: 26,
          fontWeight: FontWeight.w600),
    );
  }
}
