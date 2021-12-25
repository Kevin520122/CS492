import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final bool isApptitle;
  final String title;
  final isBackButton;
  const AppHeader(
      {Key? key,
      required this.isApptitle,
      required this.title,
      required this.isBackButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      automaticallyImplyLeading: isBackButton ? true : false,
      title: Text(
        isApptitle ? 'Dragonsgram' : this.title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: isApptitle ? 'Signatra' : '',
            fontSize: isApptitle ? 45.0 : 22.0),
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).accentColor,
    ));
  }
}
