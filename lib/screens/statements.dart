//
import 'package:flutter/material.dart';
import '../globals.dart';
import 'homepage.dart';

// String title = "";
String topText =
    "View some sample photos of what your building could look like";

class Statements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
         leading: IconButton(
           onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
           },
           icon: Icon(Icons.home),
         ),
          title: Text(
            "Statement",
            style: TextStyle(),
          ),
          backgroundColor: primaryColor,
        ),
        floatingActionButton: Container(
          
          child: RaisedButton(
            color: Colors.red,
            onPressed: (){},
            child: Text("Download Statement", style: TextStyle(
              color: Colors.white
            ),),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: [

            Material(
              color: Colors.blue[50],
              elevation: 14,
              shadowColor: Colors.blue[50],
               borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 150,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Statement for Hotel project \nState: New \nDate: ${DateTime.now().toIso8601String().substring(0,10)}" , style: TextStyle(
                        fontWeight: FontWeight.bold
                      ), textAlign: TextAlign.center,),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Column(
                          children: <Widget>[
                              Text(
                                "Number of Floors: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Ground floor to first floor", style: TextStyle(
                                fontSize: 12
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              //  color: Colors.blue[50],
              elevation: 14,
              shadowColor: Colors.blue[50],
               borderRadius: BorderRadius.circular(8),
               child: Container(
                 height: 80,
                 child:  Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Output: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                              Text("Individual house")
                            ],
                        ),
                      ),
               ),
            ),
            SizedBox(
              height: 20,
            ),

            Material(
              color: Colors.blue[50],
              elevation: 14,
              shadowColor: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Column(
                    children: <Widget>[
                      
                     
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                            children: <Widget>[
                              Text(
                                "Standard Applicable: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                              Text("arrêté du 31 janvier 1986")
                            ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                            children: <Widget>[
                              Text(
                                "Deliverables: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                              Text("fire safety statement")
                            ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                            children: <Widget>[
                              Text(
                                "In charge of deliverables: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                              Text(" fire brigade or dedicated consultant"),
                            ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                          ),
            ),
          ]),
        ),
      );
    
  }
}
