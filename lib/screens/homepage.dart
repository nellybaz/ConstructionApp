import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './my_flutter_app_icons.dart';
import './questionnaire.dart';
import './statements.dart';
import './call_agent.dart';
import './contact_us.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(MyFlutterApp.th, color: Colors.white),
          ),
        ),
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: 140.0, left: 50.0, right: 50.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 15.0, bottom: 10.0),
                            height: 160.0,
                            decoration: BoxDecoration(color: Colors.redAccent),
                            child: FlatButton(
                              onPressed: () {
                                // print("object");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Questionnaire()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 40.0),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Icon(
                                        FontAwesomeIcons.question,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Questionnaire",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 15.0, bottom: 10.0),
                            height: 160.0,
                            decoration: BoxDecoration(color: Colors.redAccent),
                            child: FlatButton(
                              onPressed: () {
                                // print("My statement pressed");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Statements()));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Icon(
                                          FontAwesomeIcons.book,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "My Statement",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 15.0, top: 70.0),
                            height: 160.0,
                            decoration: BoxDecoration(color: Colors.redAccent),
                            child: FlatButton(
                              onPressed: () {
                                // print("Call Pressed");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CallAgent()));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Icon(
                                          FontAwesomeIcons.phone,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Call an Agent",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 15.0, top: 70.0),
                            height: 160.0,
                            decoration: BoxDecoration(color: Colors.redAccent),
                            child: FlatButton(
                              onPressed: () {
                                // print("Contact pressed");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContactUs()));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                        child: Icon(
                                          FontAwesomeIcons.user,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Contact Us",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 130.0),
                child: FlatButton(
                    padding: EdgeInsets.all(20.0),
                    // color: Colors.white,
                    splashColor: Colors.tealAccent,
                    onPressed: () {
                      print("You have been signed out");
                    },
                    child: Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.redAccent),
                    )),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
