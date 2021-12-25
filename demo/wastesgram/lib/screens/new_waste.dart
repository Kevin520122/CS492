import 'package:flutter/material.dart';
import '../widgets/new_waste_form.dart';

class NewWaste extends StatefulWidget {
  static const routeKey = '/new';
  final imageURL;
  final image;
  const NewWaste({Key? key, required this.imageURL, required this.image})
      : super(key: key);

  @override
  _NewWasteState createState() => _NewWasteState();
}

class _NewWasteState extends State<NewWaste> {
  @override
  Widget build(BuildContext context) {
    if (widget.image == null || widget.imageURL == '') {
      return Center(child: CircularProgressIndicator());
    } else {
      return WasteForm(imageURL: widget.imageURL, image: widget.image);
    }
  }
}
