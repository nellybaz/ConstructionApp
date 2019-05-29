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

  customTextInput(String title, String label, int qNo){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(title, style: TextStyle(
            color: Colors.red
          ),),
        ),
        Container(
      height: 48,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(3)
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (val)=> val.isEmpty ? "Cannot be empty" : null,
      decoration: InputDecoration(
      border: InputBorder.none,
        labelText: " $label",
        labelStyle: TextStyle(
          fontSize: 12,
          
        )
      ),

    ),
    )
      ],
    );
  }

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
        appBar: AppBar(
          title: Text("Questionnaire"),
          backgroundColor: primaryColor,
          centerTitle: true,
          // leading: Builder(
          //   builder: (context) => IconButton(
          //       icon: new Icon(Icons.apps),
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => HomePage()));
          //       }),
          // ),
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
                    customTextInput("Number of floors", "Enter number of floors",2),
                    customTextInput("Number of basement", "Enter number of basement",3),
                    customTextInput("Height of last floor", "Enter Height of last floor", 4),
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
