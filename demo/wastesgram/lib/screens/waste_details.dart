import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';


class WasteDetails extends StatefulWidget {
  static const routeKey = '/details';
  final File? image;
  final post;
  const WasteDetails({Key? key, this.image, required this.post})
      : super(key: key);

  @override
  _WasteDetailsState createState() => _WasteDetailsState();
}

class _WasteDetailsState extends State<WasteDetails> {
  late LocationData? location;

  @override
  void initState() {
    super.initState();
    location = null;
    retrieveLocation();
  }

  void retrieveLocation() async {
    var locationService = Location();
    location = await locationService.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (location == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            title: Text('Wasteagram'),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                    child: Text(widget.post['date'],
                        style: TextStyle(fontSize: 30))),
                SizedBox(height: 20),
                //Image
                ConstrainedBox(
                    constraints: BoxConstraints.tight(
                        Size(MediaQuery.of(context).size.width / 2, 200)),
                    child: Image.network(widget.post['image'])),
                SizedBox(height: 20),
                Center(
                    child: Text(
                  "Items: ${widget.post['items'].toString()}",
                  style: TextStyle(fontSize: 30),
                )),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("(${location!.latitude}, ${location!.longitude})",
                      style: TextStyle(fontSize: 20))
                ])
              ]));
    }
  }
}
