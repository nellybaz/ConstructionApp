import 'package:construction_app/components/customTextInput.dart';
import 'package:flutter/material.dart';

class Specific extends StatefulWidget{
  final purpose;
  Specific({this.purpose});
   @override
   State<StatefulWidget> createState() {
return SpecificState();
}
}
class SpecificState extends State<Specific>{
   @override
   Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Questions for ${widget.purpose}"),
       centerTitle: true,
     ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Form(
         child: ListView(
           children: <Widget>[
             CustomTextInput(title:"Number of hotel rooms", label:"Enter number of hotel rooms"),
                    CustomTextInput(title:"Number of car parks", label:"Enter number of car parks"),
                    CustomTextInput(title:"Number of stairs of hotel", label:"Enter number stairs of hotel"),

           ],
         ),
         
       ),
     ),
   );
}
}