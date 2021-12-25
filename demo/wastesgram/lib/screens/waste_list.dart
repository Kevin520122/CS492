import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'waste_details.dart';
import 'new_waste.dart';


class WasteList extends StatefulWidget {
  static const routeKey = '/';
  const WasteList({Key? key}) : super(key: key);

  @override
  _WasteListState createState() => _WasteListState();
}

class _WasteListState extends State<WasteList> {
  File? image;
  late String imageURL;
  final picker = ImagePicker();
  bool loading = false;

  Future getImage(BuildContext context) async {
    
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    var fileName = DateTime.now().toString() + '.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    final url = await storageReference.getDownloadURL();
    imageURL = url;
    setState(() {});
    print('url is $url');
    push_new_post(context);
  }

  @override
  void initState() {
    super.initState();
    image = null;
    imageURL = '';
  }

  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Wastegram')),
          floatingActionButton: cameraFab(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData &&
                    // ignore: unnecessary_null_comparison
                    snapshot.data!.docs != null &&
                    snapshot.data!.docs.length > 0) {
                  return Column(
                    children: [
                      Expanded(child: displayPosts(context, postRow, snapshot)),
                     
                    ],
                  );
                } else {
                  return emptyScreen();
                }
              }));
    
  }

  Widget emptyScreen() {
    return Center(child: CircularProgressIndicator());
  }

  Widget displayPosts(BuildContext context, display, snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        var post = snapshot.data!.docs[index];
        return display(context, post);
      },
    );
  }

  Widget postRow(BuildContext contxet, post) {
    return Semantics(
      child: GestureDetector(
          onTap: () {
            push_detail(context, post);
          },
          child: ListTile(
            leading: Text(post['date']),
            trailing: Text(post['items'].toString()),
          )),
      enabled: true,
      onTapHint: "Post details!",
    );
  }

  Widget cameraFab(BuildContext context) {
    return Semantics(
      child: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () {
            loading = true;
            getImage(context);
          }),
      button: true,
      enabled: true,
      onTapHint: "Select a phtoto!",
    );
  }

  // ignore: non_constant_identifier_names
  void push_new_post(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewWaste(imageURL: imageURL, image: image)));
  }

  // ignore: non_constant_identifier_names
  void push_detail(BuildContext context, post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WasteDetails(post: post)));
  }
}
