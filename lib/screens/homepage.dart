import 'package:flutter/material.dart';
import './my_flutter_app_icons.dart';
import './questionnaire.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../globals.dart';
import './statements.dart';

class HomePage extends StatelessWidget {

  _launchURL(x) async {
  var url = x == 1 ?   "mailto:kilamaurlien@yahoo.fr": "tel:+23797829793";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  customCard(title, icon, color) {
    return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Colors.grey[300],
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          // border: Border.all()
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> dashBoardList(context) {
    return <Widget>[
      GestureDetector(
        child: customCard("Questionaire", Icons.people, Colors.redAccent),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Questionnaire()));
        },
      ),
       GestureDetector(
        child:  customCard("Statement", Icons.redeem, Colors.yellow),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Statements()));
        },
      ),

       GestureDetector(
        child: customCard("Call an agent", Icons.call, Colors.deepPurpleAccent),
        onTap: () {
          _launchURL(0);
          
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => Questionnaire()));
        },
      ),

       GestureDetector(
        child: customCard("Contact us", Icons.contact_mail, Colors.green),
        onTap: () {
          _launchURL(1);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => Questionnaire()));
        },
      ),
      
     
      
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var redAccent = Colors.redAccent;
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Home",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(MyFlutterApp.th, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: StaggeredGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: dashBoardList(context),
              staggeredTiles: [
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 150),
                // StaggeredTile.extent(1, 150),
                // StaggeredTile.extent(2, 150),
                // StaggeredTile.extent(2, 150),
              ],
            ),
          ),
        ),

        // ListView(children: <Widget>[
        //   Column(
        //     children: <Widget>[
        //       Container(
        //         margin: EdgeInsets.only(
        //             top: 100.0, left: 50.0, right: 50.0, bottom: 20.0),
        //         child: Column(
        //           children: <Widget>[
        //             Row(
        //               children: <Widget>[
        //                 Expanded(
        //                   child: Container(
        //                     margin: EdgeInsets.only(right: 15.0, bottom: 10.0),
        //                     height: 160.0,
        //                     decoration: BoxDecoration(color: primaryColor),
        //                     child: FlatButton(
        //                       onPressed: () {
        //                         // print("object");
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => Questionnaire()));
        //                       },
        //                       child: Container(
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: <Widget>[
        //                             Center(
        //                               child: Icon(
        //                                 FontAwesomeIcons.question,
        //                                 color: Colors.white,
        //                               ),
        //                             ),
        //                             Center(
        //                               child: Padding(
        //                                 padding: EdgeInsets.only(top: 10),
        //                                 child: Text(
        //                                   "Questionnaire",
        //                                   style: TextStyle(
        //                                       color: Colors.white,
        //                                       fontSize: 12),
        //                                 ),
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   child: Container(
        //                     margin: EdgeInsets.only(left: 15.0, bottom: 10.0),
        //                     height: 160.0,
        //                     decoration: BoxDecoration(color: primaryColor),
        //                     child: FlatButton(
        //                       onPressed: () {
        //                         // print("My statement pressed");
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => Statements()));
        //                       },
        //                       child: Container(
        //                           child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: <Widget>[
        //                           Center(
        //                             child: Icon(
        //                               FontAwesomeIcons.book,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                           Center(
        //                             child: Padding(
        //                               padding: EdgeInsets.only(top: 10),
        //                               child: Text(
        //                                 "My Statement",
        //                                 textAlign: TextAlign.center,
        //                                 style: TextStyle(
        //                                     color: Colors.white, fontSize: 12),
        //                               ),
        //                             ),
        //                           )
        //                         ],
        //                       )),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //             Row(
        //               children: <Widget>[
        //                 Expanded(
        //                   child: Container(
        //                     margin: EdgeInsets.only(right: 15.0, top: 50.0),
        //                     height: 160.0,
        //                     decoration: BoxDecoration(color: primaryColor),
        //                     child: FlatButton(
        //                       onPressed: () {
        //                         // print("Call Pressed");
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => CallAgent()));
        //                       },
        //                       child: Container(
        //                           child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: <Widget>[
        //                           Center(
        //                             child: Icon(
        //                               FontAwesomeIcons.phone,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                           Center(
        //                             child: Padding(
        //                               padding: EdgeInsets.only(top: 10),
        //                               child: Text(
        //                                 "Call an Agent",
        //                                 style: TextStyle(
        //                                     color: Colors.white, fontSize: 12),
        //                               ),
        //                             ),
        //                           )
        //                         ],
        //                       )),
        //                     ),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   child: Container(
        //                     margin: EdgeInsets.only(left: 15.0, top: 50.0),
        //                     height: 160.0,
        //                     decoration: BoxDecoration(color: primaryColor),
        //                     child: FlatButton(
        //                       onPressed: () {
        //                         // print("Contact pressed");
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => ContactUs()));
        //                       },
        //                       child: Container(
        //                           child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         children: <Widget>[
        //                           Center(
        //                             child: Icon(
        //                               FontAwesomeIcons.user,
        //                               color: Colors.white,
        //                             ),
        //                           ),
        //                           Center(
        //                             child: Padding(
        //                               padding: EdgeInsets.only(top: 10),
        //                               child: Text(
        //                                 "Contact Us",
        //                                 style: TextStyle(
        //                                     color: Colors.white, fontSize: 12),
        //                               ),
        //                             ),
        //                           )
        //                         ],
        //                       )),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(bottom: 50),
        //         child: FlatButton(
        //             padding: EdgeInsets.only(top: 20.0),
        //             // color: Colors.white,
        //             splashColor: Colors.tealAccent,
        //             onPressed: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => Signin()));
        //               print("You have been signed out");
        //             },
        //             child: Text(
        //               "Sign Out",
        //               style: TextStyle(
        //                 color: primaryColor,
        //               ),
        //             )),
        //       )
        //     ],
        //   ),
        // ]),
      ),
    );
  }
}
