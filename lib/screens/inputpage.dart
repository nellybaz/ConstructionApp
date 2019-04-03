import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'UserInput.dart';
import './my_flutter_app_icons.dart';
import '../globals.dart';

class InputPage extends StatelessWidget{
  @override

  Widget build (BuildContext context){
    return Scaffold(
        body: ListView(
                  children:<Widget>[ Container(
            margin:
                EdgeInsets.only(bottom: 20.0, left: 50.0, right: 50.0, top: 70.0),
            child: Column(
              children: <Widget>[
                UserInput(
                    "FULL NAME",
                    "Joseph Mamady",
                    false,
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.black87,
                    )),
                UserInput(
                    "PHONE NUMBER",
                    "+250 783 820 538",
                    false,
                    Icon(
                      Icons.phone_android,
                      color: Colors.black87,
                    )),
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
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: primaryColor,
                      splashColor: Colors.orangeAccent,
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Text("or sign up with")),
                Container(
                  margin: EdgeInsets.only(
                      left: 75.0, right: 20.0, bottom: 10),
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
                          MyFlutterApp.facebook_squared,
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ]
        ),
      );
  }
}