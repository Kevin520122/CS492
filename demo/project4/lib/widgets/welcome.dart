import 'package:flutter/material.dart';
import '../screens/new_entries.dart';


class Welcome extends StatefulWidget {
  

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(Icons.book_rounded, size: 80.0));
  }

  // ignore: non_constant_identifier_names
  void push_new_entries(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntriesScreen.routeKey);
  }
}//Welcome class
