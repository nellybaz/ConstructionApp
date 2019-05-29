import 'package:construction_app/components/customTextInput.dart';
import 'package:construction_app/screens/questionnaire_specific.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import './homepage.dart';


class Questionnaire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuestionnaireState();
  }

}

class QuestionnaireState extends State<Questionnaire>{
  final _formKey = GlobalKey<FormState>();

  String questionValue = "one";

  List answers = ["Offices", "New", "New", "New", "New", "New", "New"];
  // String q1 = "";

  populateAnswers(){
    // for(int i=0; i < 50; i++){
    //     answers.add("Offices");
    // }
  }

customSelectInput(title, label, options, qNo){
  List<DropdownMenuItem> displayOptions = [];

  for(int x=0; x < options.length; x ++){
      displayOptions.add(
        DropdownMenuItem(
          value: options[x],
          child: Text("${options[x]}"),
        )
      );
  }
  return Padding(
    padding: const EdgeInsets.only(top:8.0),
    child: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$title", style: TextStyle(
          color: Colors.red
        ),),
        DropdownButton(
          value: answers[qNo],
          isExpanded: true,
      hint: Text("$label"),
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey
      ),
      onChanged: (val){
        setState(() {
          answers[qNo] = val;
        });
      },
      items: displayOptions,

    ),
      ],
    )
  );
}


  customPopupMenu(){
    return PopupMenuButton(
     itemBuilder: (context)=>[
        PopupMenuItem(
          child: Text(" Option 1"),
        ),
        PopupMenuItem(
          child: Text(" Option 2"),
        )
     ],
    );
  }

  // customTextInput(String title, String label, int qNo){
  //   return 
  // }

  @override
  void initState() {
    super.initState();
    populateAnswers();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: Scaffold(
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
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> Specific()));
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
        appBar: AppBar(
          title: Text("Questionnaire"),
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                icon: new Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: 

          Form(
                key: _formKey,
                child: ListView(
                  // shrinkWrap: true,
                  children: <Widget>[
                    customSelectInput("Purpose", "Choose purpose", ["Offices", "Bank", "Hospital", "Hotels"], 0),
                    customSelectInput("State", "Select the state", ["New", "Revamping", "Extension"], 1),
                    CustomTextInput(title:"Number of floors", label:"Enter number of floors"),
                    CustomTextInput(title:"Number of basement", label:"Enter number of basement"),
                    CustomTextInput(title:"Height of last floor", label:"Enter Height of last floor"),
                    customSelectInput("Total Area", "Total area", ["New", "Revamping", "Extension"], 5),
                    customSelectInput("Number of people in building", "Number of people in the building", ["New", "Revamping", "Extension"], 6),
                    customSelectInput("Estimated budget","Estimated budget", ["New", "Revamping", "Extension"], 6),
                                       

                  ],
                ),
              ),
      ),)
    );
  }
}
