import 'package:flutter/material.dart';
import '../widgets/entry_display.dart';

class EntryScreen extends StatefulWidget {
  static const routeKey = '/entry_content';
  late final changeTheme;
  late final state;
  late final entry;
  EntryScreen({Key? key, this.changeTheme, this.state, this.entry});
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(widget.entry.date),
        ),
        endDrawer: settingDrawer(),
        body: EntryDisplay(entry: widget.entry));
  }

  Widget settingDrawer() {
    return Drawer(
        child: ListView(
      children: [
        Container(
          height: 50,
          child: DrawerHeader(
            child:
                Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode"),
            Switch(
                value: widget.state,
                onChanged: (value) {
                  widget.changeTheme(value);
                })
          ],
        )
      ],
    ));
  }
}
