import 'package:flutter/material.dart';

String title = "Call an Agent";
String heading = "Chat with one of our Service Agents";
String text1 =
    "Enter a live chat or place a phone to have a conversation with an agent ready to help you solve any issue you may have.";

class CallAgent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Open Sans'),
        home: Scaffold(
            drawer: new Drawer(),
            appBar: new AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                      icon: new Icon(Icons.apps),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
              title: new Center(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Color(0xffEB6B5E),
            ),
            body: ListView(
              padding: EdgeInsets.all(25.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      heading,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                Text(
                  text1,
                  style: TextStyle(fontSize: 12),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(0, 0),
                        child: Text(
                          "Chat Subject",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color(0xffEB6B5E),
                            )),
                            child: TextFormField(
                              // maxLines: 2,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                      Align(
                          alignment: FractionalOffset(0, 0),
                          child: Text("Name")),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color(0xffEB6B5E),
                            )),
                            child: TextFormField(
                              // maxLines: 2,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                      Align(
                          alignment: FractionalOffset(0, 0),
                          child: Text("Phone Number")),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color(0xffEB6B5E),
                            )),
                            child: TextFormField(
                              // maxLines: 2,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(top:10),
                                              child: RaisedButton(
                            onPressed: () {},
                            color: Color(0xffEB6B5E),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                              child: Text(
                                "LIVE CHART",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(top:20),
                                              child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xffEB6B5E),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "PHONE CALL",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
