import 'package:flutter/material.dart';

import '../screens/waste_list.dart';


class MyApp extends StatelessWidget {
  final routes = {
    WasteList.routeKey: (context) => WasteList(),
    //WasteDetails.routeKey: (context) => WasteDetails(),
    //NewWaste.routeKey: (context) => NewWaste()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wastegram',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark
        ),
        routes: routes
      );
  }
}
