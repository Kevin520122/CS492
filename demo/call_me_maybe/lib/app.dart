import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/business_card.dart';
import 'screens/resume.dart';
import 'screens/predictor.dart';


class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);
    
    
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabManager(),
    );
  }
} //Myapp class

class TabManager extends StatelessWidget {
  static const myTabs = [
    Tab(icon: Icon(Icons.face), text: 'Business Card'),
    Tab(icon: Icon(Icons.description), text: 'Resume'),
    Tab(icon: Icon(Icons.help_outline), text: 'Predictor')
  ];

  final screens = [business_card_screen(), resume_screen(), predictor_screen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: Text("Call Me Maybe"), bottom: TabBar(tabs: myTabs)),
            body: TabBarView(children: screens)));
  }
}
