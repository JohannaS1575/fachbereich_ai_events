import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
        image: AssetImage("assets/image.jpg"),
        ),
        /*Container(
        child: ListView(
          padding: EdgeInsets.all(2.0),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.games),
              title: Text("Prometheus LAN"),
            ),

            ListTile(
              leading: Icon(Icons.work),
              title: Text("Firmenveranstaltungen"),
            ),

            ListTile(
              leading: Icon(Icons.party_mode),
              title: Text("Erstsemesterparty"),
            ),
          ],
         ),
        ),*/
      ],
    );
  }
}
