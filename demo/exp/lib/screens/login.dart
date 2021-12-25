import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import '../auth.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: loginBody());
  }
}

// ignore: camel_case_types
class loginBody extends StatefulWidget {
  const loginBody({Key? key}) : super(key: key);

  @override
  _loginBodyState createState() => _loginBodyState();
}

// ignore: camel_case_types
class _loginBodyState extends State<loginBody> {
  late String name;
  TextEditingController controller = new TextEditingController();
  late User user;

  @override
  void initState() {
    super.initState();
    //signOutGoogle();
  }

  void onClick() {
    // setState(() {
    //   this.name = controller.text;
    // });
    signInWithGoogle().then((user) => {
          this.user = user!,
          //Navigator implemented as the stack
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(user: this.user)))
        });
  }

  Widget loginButton() {
    // ignore: deprecated_member_use
    return OutlineButton(
        onPressed: this.onClick,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assests/google_logo.png'), height: 35),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sign in with Google',
                        style: TextStyle(color: Colors.grey, fontSize: 25)))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: loginButton()

        // child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: TextField(
        //       controller: this.controller,
        //       decoration: InputDecoration(
        //           prefixIcon: Icon(Icons.person),
        //           labelText: "Type your name",
        //           border: OutlineInputBorder(
        //               borderSide: BorderSide(width: 5, color: Colors.black)),
        //           suffixIcon: IconButton(
        //             icon: Icon(Icons.done),
        //             splashColor: Colors.blue,
        //             //Long press then prompt
        //             tooltip: "Submit",
        //             onPressed: this.onClick,
        //           )),
        //     ))
        );
  }
}
