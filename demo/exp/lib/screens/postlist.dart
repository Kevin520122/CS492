import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostList extends StatefulWidget {
  final List<Post> collections;
  final User user;

  const PostList({Key? key, required this.collections, required this.user}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void likeState(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.collections.length,
      itemBuilder: (context, index) {
        var post = widget.collections[index];
        return Card(
            child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text(post.text),
              subtitle: Text(post.author!),
            )),
            Row(
              children: [
                Container(
                    child: Text(post.userLiked.length.toString(),
                        style: TextStyle(fontSize: 20)),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                IconButton(
                    onPressed: () => this.likeState(() => post.likePost(widget.user)),
                    icon: Icon(Icons.thumb_up),
                    color: post.userLiked.contains(widget.user.uid) ? Colors.red : Colors.black),
              ],
            )
          ],
        ));
      },
    );
  }
}
