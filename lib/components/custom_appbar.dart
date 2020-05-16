import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  final double height;

  const CustomAppbar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
      ),
      actions: <Widget>[
        AppBarIcon(iconData: Icons.notifications, padding: 10,),
        AppBarIcon(iconData: Icons.more_vert, padding: 10,)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppBarIcon extends StatelessWidget {

  final IconData iconData;
  final double padding;

  AppBarIcon({this.iconData, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Icon(
          iconData
      ),
      padding: EdgeInsets.only(right: padding),
    );
  }
}