import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './my_flutter_app_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'questionnaireinput.dart';
import '../globals.dart';
import './homepage.dart';

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Questionnaire"),
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                icon: new Icon(Icons.apps),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 50, right: 50),
              // decoration: BoxDecoration(color: primaryColor),
              child: Column(
                children: <Widget>[
                  Text(
                      "The following Questions will help us make best projection for your building developments. Please answer them as best to your knowledge"),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Project Description",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "{i. e new home, renovation, green, commercial, etc}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Describe the project in detail",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(15.0))),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                        QuestionnaireInput("Project Location",
                            "Describe the project location", false),
                        QuestionnaireInput(
                            "Budget Range", "Give your Budget estimate", true),
                        QuestionnaireInput(
                            "Time Range",
                            "Give the time you expect your building to be complete",
                            false),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "What Type of Building",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: primaryColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                    items: <String>[
                                      'Bungalow',
                                      'One Storey',
                                      'Two Storey',
                                      'Apartments',
                                      'Flats'
                                    ].map((String val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    }).toList(),
                                    hint: Container(
                                        margin: EdgeInsets.only(left: 10.0),
                                        child: Text(
                                            "Please choose the building type")),
                                    onChanged: (newVal) {}),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Number of Floors",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "Below are some images to help with your decision",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              CarouselSlider(
                                // height: 300.0,
                                items: [
                                  "asset/image2.jpeg",
                                  "asset/image2.jpeg",
                                  "asset/image2.jpeg",
                                  "asset/image2.jpeg",
                                  "asset/image2.jpeg",
                                  "asset/image2.jpeg"
                                ].map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Stack(
                                            children: <Widget>[
                                              Positioned(child: Image.asset(i)),
                                              Positioned(
                                                top: 120,
                                                left: 180,
                                                child: IconButton(
                                                  onPressed: () {
                                                    print("Downloading...");
                                                  },
                                                  icon: Icon(
                                                      FontAwesomeIcons.download,
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ));
                                    },
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: primaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          child: DropdownButton<String>(
                              items: <String>[
                                'One',
                                'Two',
                                'Three',
                                'Four or Higher'
                              ].map((String val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              }).toList(),
                              hint: Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Text(
                                    "Please choose your preferred Storey size"),
                              ),
                              onChanged: (newVal) {}),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "Is Sunlight important?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: primaryColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                    items: <String>[
                                      'Yes',
                                      'No',
                                    ].map((String val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    }).toList(),
                                    hint: Container(
                                      margin: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                          "You wanna wake up to Beautiful Mornings"),
                                    ),
                                    onChanged: (newVal) {}),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      "What Type of Cladding do you prefer?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0,
                                        style: BorderStyle.solid,
                                        color: primaryColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                    items: <String>[
                                      'Low Maintenance',
                                      'Paint Finish Maintenance',
                                      'Brick',
                                      'Paster',
                                      'Shadow Clad'
                                    ].map((String val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    }).toList(),
                                    hint: Container(
                                        margin: EdgeInsets.only(left: 10.0),
                                        child:
                                            Text("Specify preferred cladding")),
                                    onChanged: (newVal) {}),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                "What type of roofing appeals to you?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: primaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          child: DropdownButton<String>(
                              items: <String>[
                                'Long run corrugated iron',
                                'Ribbed iron',
                                'Tiles'
                              ].map((String val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              }).toList(),
                              hint: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Text("Choose roofing style")),
                              onChanged: (newVal) {}),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10.0, left: 70.0, right: 70.0, top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        color: primaryColor,
                        splashColor: Colors.orangeAccent,
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(20.0),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
