import 'package:flutter/material.dart';

String title = "Live Chat";
String status1 = "Searching";
String status2 = "Connected";
String agentAssigned = "STEPHENY";
String text1 =
    "Welcome to our Live Chat, a representative will be with you shortly.";
String text2 =
    "You are currently number 3 on the queue. Please wait while we conect you to a chat agent.";
String message =
    "Hello Joseph, Welcome to our live chat, I’m Stephany. How may I help you?";

class LiveChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(fontFamily: 'Open Sans'),
        home: Scaffold(
          drawer: Drawer(),
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
            padding: EdgeInsets.only(top: 25.0),
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Color(0xffEEEEEE)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: Row(
                      children: <Widget>[
                        Text("Status: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text(
                          status2,
                          style:
                              TextStyle(color: Color(0xffEB6B5E), fontSize: 20),
                        )
                      ],
                    ),
                  )),

              // ###################################

              // Padding(
              //   padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              //   child: Column(
              //     children: <Widget>[
              //       Padding(
              //           padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //           child: Text(text1)),
              //       Padding(
              //           padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //           child: Text(text2)),
              //     ],
              //   ),
              // )

              // ###################################

              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 11),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffEB6B5E))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffEEEEEE),
                            border: Border.all(color: Color(0xffEB6B5E))),
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              agentAssigned + " ",
                            ),
                            Text(
                              "Online",
                              style: TextStyle(color: Color(0xffEB6B5E)),
                            )
                          ],
                        ),
                      ),
                      Container(
                          //Messages wrapper
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                agentAssigned + ": " + message,
                                softWrap: true,
                                maxLines: null,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                child: Column(
                  children: <Widget>[
                  
                    Row(children:<Widget>[Text("Type a new message here"), 
                    Padding(padding:EdgeInsets.fromLTRB(25, 2.5, 0, 0) ,child: Text("Attach files", style: TextStyle(color: Color(0xffEB6B5E), fontSize: 8),))]),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff000000),width: 0.5)),
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  Align(
                  alignment: FractionalOffset(1, 0.6),
                  child: Container(
                    child: new RaisedButton(
                      onPressed: () {},
                      child: Text("SEND", style: TextStyle(color: Colors.white),),
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                  ],
                ),
              )

              // ###################################
            ],
          ),
        ));
  }
}
