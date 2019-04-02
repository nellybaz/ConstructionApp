import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'my_flutter_app_icons.dart';

String title = "Contact Us";
String about =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntut labore et dolore magna aliqua. Ut enim adminim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptatevelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
        body: ListView(children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.fromLTRB(0, 25.0, 0, 25.0),
                  child: new Row(
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          Text(
                            "About Us",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          Text(
                            "V.2019",
                            style: new TextStyle(fontSize: 17.5),
                          )
                        ],
                      ),
                      // new Image Logo;
                      Padding(
                        padding: EdgeInsets.only(left: 150),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
                new Text(
                  about,
                  style: new TextStyle(fontSize: 14),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                    child: Text(
                      "You can contact us via these means",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                Row(
                  children: <Widget>[
                    // Icon for mail;
                    IconButton(
                      icon: Icon(MyFlutterApp.mail_outline),
                      onPressed: () {},
                    ),
                    Text("hello@company.com"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    // Icon for phone
                    IconButton(
                      icon: Icon(MyFlutterApp.smartphone),
                      onPressed: () {},
                    ),
                    Text("+250 889 8953")
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                    child: Text("Say hello to us on social media")),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(MyFlutterApp.twitter_circled),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(MyFlutterApp.facebook_circled),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                    child: Text("Send Us Feedback")),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Full Name",
                      border: InputBorder.none,
                      fillColor: (Color(0xffFAFAFA))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email Address",
                          border: InputBorder.none,
                          fillColor: Color(0xffFAFAFA))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Phone",
                          border: InputBorder.none,
                          fillColor: Color(0xffFAFAFA))),
                ),
                // Text Area
                Container(
                  height: 200,
                  decoration: BoxDecoration(color: Color(0xffFAFAFA)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Message",
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),

                Align(
                  alignment: FractionalOffset(1, 0),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Color(0xffEB6B5E),
                  ),
                )
              ],
            ),
          ),
        ]),
        backgroundColor: Colors.white,
      ),
    );
  }
}
