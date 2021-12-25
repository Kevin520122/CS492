import 'package:dragonsgram/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AppHeader(isApptitle: false ,title: 'Profile', isBackButton: false);
  }
}
