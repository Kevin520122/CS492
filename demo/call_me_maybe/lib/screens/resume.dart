import 'package:flutter/material.dart';

// ignore: camel_case_types
class resume_screen extends StatelessWidget {
  static String experience =
      'uiabvjidsbvjisbvdksbvdsbvdksbvdskvdsjbvdjksbvAVcadsbvdjkasbvadsbvsdbvjdsbvdksvksbvdsvndsvndslvkndvjbskjbnlodbnbkdnbnzsnbgidfbuierherlnjbdbnnbdfklsnbnbdfklsbn dfklsnbdflsn bdfls bkldfbndfknberk;lbnbklsnbvkldsnber;swnbesw';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      myInfo('Kevin', 1),
      myInfo('123456@gmail.com', 0),
      myInfo('www.github.com/kev', 0),
      //Identical work experience
      experience_column(),
      experience_column(),
      experience_column(),
      experience_column(),
      experience_column(),
      experience_column(),
      experience_column(),
    ]));
  }

  Widget myInfo(String info, int isName) {
    if (isName == 1) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(info,
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 30))
      ]);
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(info,
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 20))
      ]);
    }
  }

  // ignore: non_constant_identifier_names
  Widget experience_column() {
    return Column(
      children: [
        Divider(thickness: 10, color: Colors.purple),
        job_row("Software Engineering Intern"),
        info_row(['Google', '09/01/2020 - present', 'San Fransico, CA']),
        display_content(experience)
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget job_row(String job) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(job,
            style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 20,
                fontWeight: FontWeight.bold))
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget info_row(List<String> info) {
    return 
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(info[0],
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 15)),
        Text(info[1],
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 15)),
        Text(info[2],
            textAlign: TextAlign.end,
            style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 15))
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget display_content(String content) {
    return Text(content,
        style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 20));
  }
}
