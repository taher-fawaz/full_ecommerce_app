import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  UserListTile({this.title, this.subtitle, this.icon});

  late String? title;
  late String? subtitle;
  late IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          title: Text(title!),
          subtitle: Text(subtitle!),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
