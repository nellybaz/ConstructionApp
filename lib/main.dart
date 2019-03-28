import 'package:flutter/material.dart';
import 'about.dart';

String title = "My Statement";
String topText = "View some sample photos of what your building could look like";

void main() => runApp(new About());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        drawer: Drawer(), 
        appBar: AppBar(
           title: new Center(child: Center(child: Text(title),),),
          backgroundColor: Colors.redAccent,
        ),

        body:  new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Padding(  padding: EdgeInsets.all(25.0),  child: const Card(
              child: Center(child:
              Text( "View some sample photos of what your building could look like", style: TextStyle( fontSize: 15.0, ),),
              ),
              // new Container(
              //   padding: new EdgeInsets.all( 25.0),
              //   child: new Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       new Text(
              //           '\$  ',
              //           style: new TextStyle(
              //             fontSize: 20.0,
              //             fontFamily: 'Roboto',
              //             color: new Color(0xFF26C6DA),
              //           )
              //       ),
              //       new Text(
              //         '3,435.23',
              //         style: new TextStyle(
              //             fontSize: 35.0,
              //             fontFamily: 'Roboto',
              //             color: new Color(0xFF26C6DA)
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // new Text('general balance'),
              ),)],
          ), 
        

//        body: new Padding(  padding: EdgeInsets.all(25.0),  child: const Card(
//          child: Center(child:
//          Text( "View some sample photos of what your building could look like", style: TextStyle( fontSize: 15.0, ),),
//          ),
//)
//        ),
      
      ),
      
    );
  }
}