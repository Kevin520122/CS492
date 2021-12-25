import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';


class WasteForm extends StatefulWidget {
  final imageURL;
  final image;
  const WasteForm({Key? key, required this.imageURL, required this.image})
      : super(key: key);

  @override
  _WasteFormState createState() => _WasteFormState();
}

class _WasteFormState extends State<WasteForm> {
  
  final formKey = GlobalKey<FormState>();
  Post post = Post(date: '', image: '', items: -1);

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
          title: Text("New Post"),
        ),
        body: postForm(context));
  }

  Widget postForm(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Image.file(widget.image),
                Expanded(
                  child: Container(child: Image.network(widget.imageURL), height: 150),
                ),

                SizedBox(height: 10),
                itemsRow(context),
                uploadButton()
              ],
            )));
  }

  Widget itemsRow(BuildContext context) {
    return Expanded(  
        child: Semantics(
          child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Number of Wasted Items', hintStyle: TextStyle(fontSize: 30)),
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.display1,
              onSaved: (value) {
                post.items = int.parse(value!);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'The input box can not be empty';
                } else {
                  return null;
                }
              }),
          enabled: true,
          onTapHint: "Enter a integer!",
        ));
  }

  Widget uploadButton() {
    // ignore: deprecated_member_use
    return Semantics(
      // ignore: deprecated_member_use
      child: FlatButton.icon(
        label: Text(''),
        icon: Icon(Icons.cloud_upload, size: 50),
        onPressed: uploadData,
        color: Colors.blue,
        
      ),
      enabled: true,
      onTapHint: "Upload data to datebase!",
    );
  }

  void uploadData() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      formatDate();
      print(post.items);
      FirebaseFirestore.instance.collection('posts').add(
          {'date': post.date, 'items': post.items, 'image': widget.imageURL});
      print("Added data to database");
      Navigator.of(context).pop();
    }
  }

  void formatDate() {
    //Format the date
    post.date = DateFormat('EEEE, MMMMd, y').format(DateTime.now());
  }
}
