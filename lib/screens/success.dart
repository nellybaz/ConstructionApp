import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(color: Colors.redAccent),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 170.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4.0),
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                          child: Icon(
                        Icons.done,
                        size: 90.0,color: Colors.white,
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 50.0, right: 100.0, left: 100.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Hi Joseph,",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "You have Successfully filled the Questionnaire and you are one step closer to achieving your dream building!",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100.0),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.redAccent,
                        child: Text("VIEW MY STATEMENT"),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
