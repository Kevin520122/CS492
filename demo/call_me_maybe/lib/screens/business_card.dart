import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types
class business_card_screen extends StatefulWidget {
  @override
  _business_card_screen_state createState() => _business_card_screen_state();
}

// ignore: camel_case_types
class _business_card_screen_state extends State<business_card_screen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Display my photo
      myPhoto(context),
      //Display my name
      myInfo('Shilong Zhao', 0),
      //Display my job title
      myInfo('Software Engineer', 0),
      //Display my phone number
      myPhone(),
      //Display the row containing my github and email
      Git_Email_Row()
    ]);
  }

  Widget myPhoto(BuildContext context) {
    return Flexible(
        child: FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 0.4,
            heightFactor: 0.4,
            child: GestureDetector(
                //Once tap, the snackbar will show
                onTap: () {
                  displaySnackBar(context);
                },
                child: Image.asset('assests/images/kev.jpg'))));
  }

  Widget myInfo(String info, int isRow) {
    if (isRow == 1) {
      return Text(info,
          style: TextStyle(
            fontFamily: 'Poppins-Bold',
            fontSize: 15,
          ));
    } else {
      return Text(info,
          style: TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 20,
              fontWeight: FontWeight.bold));
    }
  }

  Widget myPhone() {
    // ignore: deprecated_member_use
    return GestureDetector(
        //Once tap, it will direct to the message app
        onTap: () async {
          await launch('sms:5411234567');
        },
        child: Text("541-123-4567",
            style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 20)));
  }

  // ignore: non_constant_identifier_names
  Widget Git_Email_Row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [myGithub(), myInfo('12345@gmail.com', 1)],
    );
  }

  Widget myGithub() {
    // ignore: deprecated_member_use
    return GestureDetector(
        //Once tap, it will direct to the flutter website
        onTap: () async {
          await launch('https://flutter.dev');
        },
        child: myInfo('www.github.com/kev', 1));
  }

  void displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('That is me!!'));
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }

  double padding(BuildContext context) {
    //If screen is displayed horizontally
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      print(MediaQuery.of(context).size.width);
      return MediaQuery.of(context).size.width * 0.04;
    } else {
      return MediaQuery.of(context).size.width * 0.08;
    }
  }
}//class business_card_screen

