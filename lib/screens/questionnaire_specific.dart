import 'package:construction_app/components/customTextInput.dart';
import 'package:flutter/material.dart';

class Specific extends StatefulWidget{
  final purpose;
  final submitFnc;
  final controllers;
  Specific({this.purpose, this.submitFnc, this.controllers});
   @override
   State<StatefulWidget> createState() {
return SpecificState();
}
}
class SpecificState extends State<Specific>{
  var _formKey = GlobalKey<FormState>();
   @override
   Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Questions for ${widget.purpose}"),
       centerTitle: true,
     ),
     floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          width: MediaQuery.of(context).size.width * 0.40,
          child: RaisedButton(
            color: Colors.deepOrangeAccent,
            onPressed: (){

            },
            child: GestureDetector(
              onTap: (){
                var form = _formKey.currentState;
                if(form.validate()){
                  print("validated");
                  widget.submitFnc();
                    // Navigator.push(context, MaterialPageRoute(builder:(context)=> Specific(purpose: answers[0],)));
                }
                
              },
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Next ", style: TextStyle(
                    color: Colors.white,
                  ),),
                  Icon(Icons.navigate_next, color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Form(
         key: _formKey,
         child: ListView(
           children: <Widget>[
                    CustomTextInput(title:"Number of hotel rooms", label:"Enter number of hotel rooms",),
                    CustomTextInput(title:"Number of car parks", label:"Enter number of car parks"),
                    CustomTextInput(title:"Number of stairs of hotel", label:"Enter number stairs of hotel"),

           ],
         ),
         
       ),
     ),
   );
}
}