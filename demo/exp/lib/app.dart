import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry/sentry.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/post.dart';
import '../screens/login.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData.dark(), home: login());
  }
}




  // void setText(text) {
  //   if (text == "kev") {
  //     controller.clear();
  //     text = '';
  //   }
  //   setState(() {
  //     this.text = text;
  //   });
  // }


// class MyApp extends StatefulWidget {
//   // static Future<void> reportError(dynamic error, dynamic stackTrace) async {
//   //   final sentryId =
//   //       await Sentry.captureException(error, stackTrace: stackTrace);
//   // }
//   late final preferences;
//   MyApp({Key? key, required this.preferences}) : super(key: key);
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   static const KEY = 'favoriteThing';
//   String get favoriteThing =>
//     widget.preferences.getString(KEY) ?? 'Inital: nsdvn';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData.dark(),
//         home: Scaffold(
//             appBar: AppBar(title: Text("Example Preference")),
//             body: Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // ignore: deprecated_member_use
//                 Text(favoriteThing,
//                     // ignore: deprecated_member_use
//                     style: Theme.of(context).textTheme.display3),
//                 SizedBox(height: 20),
//                 // ignore: deprecated_member_use
//                 RaisedButton(
//                   child: Text("Pick new favorite thing"),
//                   onPressed: pickNew,
//                 )
//               ],
//             ))));
//   }

//   void pickNew() async {
//     setState(() {
//       widget.preferences.setString(KEY,
//         generateWordPairs().take(1).first.join(' ')
//      );
//     });

//     widget.preferences.setString('favoriteThing', favoriteThing);
//   }
// }
