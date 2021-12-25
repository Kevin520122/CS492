import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(context) {
    return AppHeader(isApptitle: true, title: '', isBackButton: false);
    
  }
}
