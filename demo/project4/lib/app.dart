import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'screens/new_entries.dart';
import 'screens/journal_entry_content.dart';
import 'screens/journal_entries_list.dart';



class MyApp extends StatefulWidget {
  // This widget is the root of your application.
 
  final SharedPreferences preferences;
  const MyApp({Key? key, required this.preferences}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   
  @override
  Widget build(BuildContext context) {
    final routes = {
    //Welcome.routeKey: (context) => Welcome(),
    JournalEntryListScreen.routeKey: (context) => JournalEntryListScreen(changeTheme: switchTheme, state: isDark),
    NewEntriesScreen.routeKey: (context) => NewEntriesScreen(changeTheme: switchTheme, state: isDark),
    EntryScreen.routeKey: (context) => EntryScreen()
    };

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
        title: 'Journal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: isDark ? Brightness.dark : Brightness.light
        ),
        routes: routes,
        );

  }

   bool get isDark =>
    widget.preferences.getBool('dark') ?? false;
  
  void switchTheme(state) {
    setState(() {
      widget.preferences.setBool('dark', state);
    });
  }
}//Class myApp
