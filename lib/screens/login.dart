import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'UserInput.dart';
import './my_flutter_app_icons.dart';
import '../globals.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(bottom: 0.0, left: 50.0, right: 50.0, top: 120.0),
          child: Column(
            children: <Widget>[
              UserInput("EMAIL", "jomamady@example.com", false,
                  Icon(Icons.email, color: Colors.black87)),
              UserInput(
                  "PASSWORD",
                  ".......",
                  true,
                  Icon(
                    Icons.security,
                    color: Colors.black87,
                  )),
              Container(
                margin: EdgeInsets.only(
                    bottom: 10.0, left: 70.0, right: 70.0, top: 30),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    textColor: Colors.white,
                    color: primaryColor,
                    splashColor: Colors.orangeAccent,
                    child: Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.white),
                    ),
//                    padding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text("or log in with")),
              Container(
                margin: EdgeInsets.only(left: 60.0, right: 20.0, bottom: 10),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        MyFlutterApp.twitter_circled_1,
                        color: Colors.blueAccent,
                      ),
                    ),
                    new IconButton(
                      onPressed: () {},
                      icon: new Icon(
                        FontAwesomeIcons.google,
                        color: primaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
