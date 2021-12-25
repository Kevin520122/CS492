import 'package:exp/db/database.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/textinput.dart';
import 'postlist.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  //late final String name;
  final User user;
  Home({required this.user});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [];

  //Callback function
  void newPost(text) {
    var post = new Post(text: text, author: widget.user.displayName);
    post.setId(addPost(post));
    setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Start your post"),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(child: PostList(collections: posts, user: widget.user)),
          Align(
              alignment: Alignment.bottomCenter,
              child: TextInput(callback: this.newPost)),
          //Expanded(child: PostList())
        ]));
  }
}
