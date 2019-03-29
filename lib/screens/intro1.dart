import 'package:flutter/material.dart';
import '../globals.dart';
import './signin.dart';

class Intro1 extends StatelessWidget{
   @override
   Widget build(BuildContext context) {
   return Material(
     child: Center(
     child: Container(
       padding: EdgeInsets.all(20),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Expanded(
             flex: 1,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(right: 30),
                   child: FlatButton(
                     onPressed: (){},
                     child: Text("Skip",)))
               ],
             ),
           ),
           Expanded(
             flex: 3,
             child: Column(
               children: <Widget>[
                 Image.asset("assets/images/intro1_pic.png"),
           Padding(
             padding: EdgeInsets.all(10),
                        child: Text('Questionaire', style: TextStyle(
               fontWeight: FontWeight.bold
             ),),
           ),

           Text("Answer a short and detailed set of questions to help us taylor projections specifically for your building project.")
               ],
             ),
           ),


           Expanded(
             flex: 1,
             child: Row(
               children: <Widget>[
                 Expanded(
                   flex: 5,
                   child: Row(
                     children: <Widget>[
                       Container(
                         margin: EdgeInsets.only(right: 3),
                         height: 8,
                         width: 8,
                         decoration: BoxDecoration(
                           color: primaryColor,
                           borderRadius: BorderRadius.circular(20)
                         ),
                        //  
                       ),
                       Container(
                         margin: EdgeInsets.only(right: 3),
                         height: 8,
                         width: 8,
                         decoration: BoxDecoration(
                           color: primaryColor,
                           borderRadius: BorderRadius.circular(20)
                         ),
                        //  
                       ),
                       Container(
                         margin: EdgeInsets.only(right: 3),
                         height: 8,
                         width: 8,
                         decoration: BoxDecoration(
                           color: primaryColor,
                           borderRadius: BorderRadius.circular(20)
                         ),
                        //  
                       )
                     ],
                   ),
                 ),

                 Expanded(
                   flex: 2,
                   child: FlatButton(
                     onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));
                     },
                                        child: Row(
                       children: <Widget>[
                         Text("Next", style: TextStyle(color: primaryColor),),
                         Icon(Icons.navigate_next, color: primaryColor,)

                       ],
                     ),
                   ),
                 )
               ],
             ),
           )
         ],
       ),
     ),
   ),
   );
}
}