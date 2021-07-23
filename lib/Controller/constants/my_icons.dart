import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class AppIcons {
  static const home = FaIcon(FontAwesomeIcons.home);
  static const feeds = FaIcon(FontAwesomeIcons.rss);
  static FaIcon cart =
      FaIcon(FontAwesomeIcons.shoppingBag, color: ColorsConsts.cartColor);
  static const user = FaIcon(FontAwesomeIcons.user);
  static const search = FaIcon(FontAwesomeIcons.search);
  static const moon = FaIcon(FontAwesomeIcons.moon);
  static const signOut = FontAwesomeIcons.signOutAlt;
  static const cross = FontAwesomeIcons.removeFormat;
  static const minus = FontAwesomeIcons.minus;
  static const plus = FontAwesomeIcons.plus;
  static const star = FontAwesomeIcons.star;
  static const starAndCrescent = FontAwesomeIcons.starAndCrescent;
  static const cartPlus = FontAwesomeIcons.cartPlus;
  static const checkDouble = FontAwesomeIcons.checkDouble;
  static const trash = FontAwesomeIcons.trash;

  static const rss = FaIcon(FontAwesomeIcons.rss);

  static const wishList = FaIcon(
    FontAwesomeIcons.heart,
    color: Colors.white,
  );
  static const upload = FaIcon(FontAwesomeIcons.upload);
}
