import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




















// Future<void> main() async {
//   await SentryFlutter.init(
//     (options) => options.dsn = DSN_URL,
//     appRunner: () => runApp(MyApp()),
//   );
// }

// void main() async{
//   runApp(MyApp(preferences: await SharedPreferences.getInstance()));
// }

//import 'package:flutter/material.dart';

//void main() => runApp(App());

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   late Counter counter;
//   @override
//   void initState() {
//     super.initState();
//     counter = Counter(initialValue: 0);
//   }

//   void updateCounter() {
//     setState(() {
//       counter.increment();
//     });
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Example',
//         theme: ThemeData.dark(),
//         home: Scaffold(
//             appBar: AppBar(title: Text('Example')),
//             body: Center(
//                 child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     // TODO: Pass down state (once lifted up here).
//                     children: [
//                   DecreasingWidget(counter: counter),
//                   IncreasingWidget(
//                       counter: counter, updateCounter: updateCounter)
//                 ] // TODO: And eventually, a state change function
//                     ))));
//   }
// }

// class IncreasingWidget extends StatelessWidget {
//   final Counter counter;
//   final void Function() updateCounter;
//   IncreasingWidget({required this.counter, required this.updateCounter});
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Text('${counter.value} done',
//           style: Theme.of(context).textTheme.headline3),
//       CounterChangingButton(
//           updateCounter:
//               updateCounter) // TODO: Pass down a callback into the constructor.
//       //       After lifting state, you may need to pass
//       //       this down twice.
//     ]);
//   }
// }

// class DecreasingWidget extends StatelessWidget {
//   final Counter counter;
//   DecreasingWidget({required this.counter});
//   @override
//   Widget build(BuildContext context) {
//     // TODO: Use the state to display the number of taps left.
//     return Container(
//         child: Text('${100 - counter.value} left',
//             style: Theme.of(context).textTheme.headline3));
//   }
// }

// class CounterChangingButton extends StatelessWidget {
//   final void Function() updateCounter;

//   CounterChangingButton({required this.updateCounter});

//   @override
//   Widget build(BuildContext context) {
//     // ignore: deprecated_member_use
//     return RaisedButton(
//         onPressed: updateCounter,
//         child: Text('Tap Me!', style: Theme.of(context).textTheme.headline3));
//   }
// }

// class Counter {
//   int value;

//   Counter({required int initialValue}) : value = initialValue;

//   void increment() {
//     ++value;
//   }
// }
