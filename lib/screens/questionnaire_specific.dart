import 'package:construction_app/components/customTextInput.dart';
import 'package:construction_app/screens/statements.dart';
import 'package:flutter/material.dart';

class Specific extends StatefulWidget{
  final purpose;
  final submitFnc;
  final controllers;
  final setAnswers;
  Specific({this.purpose, this.submitFnc, this.controllers, this.setAnswers});
   @override
   State<StatefulWidget> createState() {
return SpecificState();
}
}
class SpecificState extends State<Specific>{
   List<TextEditingController> controllersList = [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),
  
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  ];

  var _formKey = GlobalKey<FormState>();


  setStateInParent(){
    for(int x=0; x<controllersList.length; x++){
        if(controllersList[x].text != null && controllersList[x].text.length  > 0){
            widget.setAnswers(x, controllersList[x].text);
        }
    }
  }
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
                  print("ANSWERS BELOW");
                  setStateInParent();
                  widget.submitFnc();
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> Statements()));
                }
                
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Send ", style: TextStyle(
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
                    CustomTextInput(title:"Number of hotel rooms", label:"Enter number of hotel rooms", controller: controllersList[8],qNo: 8,),
                    CustomTextInput(title:"Number of car parks", label:"Enter number of car parks", controller: controllersList[9],qNo: 9,),
                    CustomTextInput(title:"Number of stairs of hotel", label:"Enter number stairs of hotel", controller: controllersList[10], qNo: 10,),

           ],
         ),
         
       ),
     ),
   );
}
}