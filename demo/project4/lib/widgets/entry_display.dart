import "package:flutter/material.dart";

class EntryDisplay extends StatelessWidget {
  late final entry;
  EntryDisplay({Key? key, this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Column(
      children: [
        Text(entry.title,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        Text(entry.body + ' Rating: '+entry.rating.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
