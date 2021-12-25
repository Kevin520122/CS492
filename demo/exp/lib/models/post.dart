import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Post {
  late String text;
  late String? author;
  // bool isLiked = false;
  // int likes = 0;
  Set userLiked = {};
  late DatabaseReference _id;

  Post({required this.text, required this.author});

  void likePost(User user) {
    if (this.userLiked.contains(user.uid)) {
      this.userLiked.remove(user.uid);
    } else {
      this.userLiked.add(user.uid);
    }
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'userLiked': this.userLiked.toList(),
      'body': this.text
    };
  }
}
