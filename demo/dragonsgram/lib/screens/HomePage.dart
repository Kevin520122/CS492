import 'package:dragonsgram/screens/TimeLine.dart';
import 'package:dragonsgram/screens/notification.dart';
import 'package:dragonsgram/screens/profile.dart';
import 'package:dragonsgram/screens/search.dart';
import 'package:dragonsgram/screens/upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//In charge of log in/out
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSignedIn = true;
  // ignore: non_constant_identifier_names
  late PageController page_controller;
  int curIdx = 0;

  @override
  void initState() {
    super.initState();
    this.page_controller = PageController();
  }

  void dispose() {
    this.page_controller.dispose();
    super.dispose();
  }

  void pageChanged(int pageIdx) {
    setState(() {
      this.curIdx = pageIdx;
    });
  }

  void bottomPageChanged(int pageIdx) {
    this.page_controller.animateToPage(pageIdx,
        duration: Duration(milliseconds: 400), curve: Curves.bounceInOut);
  }

  // ignore: non_constant_identifier_names
  Widget WelcomeScreen() {
    return Scaffold(
      body: PageView(
        children: [
          TimeLinePage(),
          SearchPage(),
          UploadPage(),
          NotificationsPage(),
          ProfilePage(),
        ],
        controller: this.page_controller,
        onPageChanged: pageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar:
          CupertinoTabBar(
            currentIndex: this.curIdx, 
            onTap: bottomPageChanged,
            activeColor: Colors.white,
            inactiveColor: Colors.blueGrey,
            backgroundColor: Theme.of(context).accentColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home)),
              BottomNavigationBarItem(icon: Icon(Icons.search)),
              BottomNavigationBarItem(icon: Icon(Icons.photo_camera)),
              BottomNavigationBarItem(icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(icon: Icon(Icons.person)),
            ],

        ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SignInScreen() {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Dragonsgram',
            style: TextStyle(
                fontSize: 92, color: Colors.white, fontFamily: 'Signatra')),
        GestureDetector(
            onTap: () => 'Button Tapped!',
            child: Image(
                image: AssetImage("assets/images/google_signin_button.png"),
                width: 270,
                height: 65))
      ],
    )));
  }

  @override
  Widget build(BuildContext context) {
    if (this.isSignedIn) {
      return WelcomeScreen();
    } else {
      return SignInScreen();
    }
  }
}
