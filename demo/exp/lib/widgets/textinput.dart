import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final Function(String) callback;

  const TextInput({Key? key, required this.callback}) : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final controller = TextEditingController();
  //late String text = '';
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onClick() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.blue,
            //Long press then prompt
            tooltip: "Post message",
            onPressed: this.onClick,
          )),
    ); //onChanged: (text) => this.setText(text)),
    //Expect to show input text, need to refresh widget
    //Text(this.text, style: TextStyle(color: Colors.red)),
  }
}
