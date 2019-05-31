//
import 'package:flutter/material.dart';
import '../globals.dart';
import 'homepage.dart';

// String title = "";
String topText =
    "View some sample photos of what your building could look like";

class Statements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                icon: new Icon(Icons.apps),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ),
          title: Text(
            "Statement",
            style: TextStyle(),
          ),
          backgroundColor: primaryColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Dear Mr Paul, below is the statement for your building vision",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 15.0,
                    ),
                  ),
                ),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Number of Floors: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Ground floor to first floor")
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Output: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          Text("Individual house")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Standard Applicable: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          Text("arrêté du 31 janvier 1986")
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Deliverables: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          Text("fire safety statement")
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "In charge of deliverables: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          Flexible(
                            child: Text(" fire brigade or dedicated consultant"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //       border: Border.all(width: 1, color: Colors.black)),
                //   padding: EdgeInsets.fromLTRB(62.5, 0, 62.5, 0),
                //   child: Image.asset(
                //     'assets/logo.png',
                //     height: 175.0,
                //   ),
                // ),

                // Padding()
                // new Padding(
                //   padding: EdgeInsets.only(top: 15.0),
                //   child: Card(
                //     child: Container(

                //       padding: EdgeInsets.only(left: 5),
                //       height: 250,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(8),
                //           border: Border.all(width: 1, color: primaryColor)),
                //       child: TextField(
                //           maxLines: null,
                //           decoration: InputDecoration(border: InputBorder.none
                //               // border: OutlineInputBorder(
                //               //     borderSide: BorderSide(color: primaryColor)),
                //               ),
                //           style: TextStyle(
                //               // height: 10,
                //               fontSize: 14,
                //               color: Colors.black)),
                //     ),
                //   ),
                // ),

                Align(
                  alignment: FractionalOffset(1, 0.6),
                  child: Container(
                    child: new RaisedButton(
                      onPressed: () {},
                      child: Text("DOWNLOAD",
                          style: TextStyle(color: Colors.white)),
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
