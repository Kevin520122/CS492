import 'package:flutter/material.dart';

class JournalScaffold extends StatefulWidget {
  static const routeName = '/';
  final bodyContent;
  final floatingActionButton;
  final title;
  final changeTheme;
  final state;
  JournalScaffold(
      {Key? key,
      this.bodyContent,
      this.floatingActionButton,
      this.title,
      this.changeTheme,
      this.state})
      : super(key: key);
  @override
  _JournalScaffoldState createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      endDrawer: settingDrawer(),
      floatingActionButton: widget.floatingActionButton,
      body: widget.bodyContent,
    );
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
