import 'package:firebase_database/firebase_database.dart';
import '../models/post.dart';

final dbReference = FirebaseDatabase.instance.reference();

DatabaseReference addPost(Post post) {
  //Automatically create the reference named posts in DB
  var id = dbReference.child('posts/').push();
  id.set(post.toJson());
  return id;
}
