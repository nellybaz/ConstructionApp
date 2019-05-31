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

  List answers = ["Select", "Select", "Select", "Select", "Select", "Select", "Select", "Select", "Select", "Select", "Select"];


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

  populateControllers(){
    // for(int i=0; i < 50; i++){
    //     controllersList.add(new TextEditingController());
    // }
  }

customSelectInputHeight(title, label, options, qNo){
  List<DropdownMenuItem> displayOptions = [];
  String img = "";

  for(int x=0; x < options.length; x ++){

      switch (x) {
        case 1:
          img = "https://cdn3.vectorstock.com/i/1000x1000/74/02/architecture-design-for-three-storey-building-vector-14477402.jpg";
          break;
        case 0:
          img = "http://greenmodule.weebly.com/uploads/1/3/0/5/13058629/7309140_orig.jpg";
          break;
                case 2:
          img = "http://www.jkaarchitects.com/wp-content/uploads/2016/03/1-768x1024.jpg";
          break;
                case 1:
          img = "http://greenmodule.weebly.com/uploads/1/3/0/5/13058629/7309140_orig.jpg";
          break;
                case 1:
          img = "http://greenmodule.weebly.com/uploads/1/3/0/5/13058629/7309140_orig.jpg";
          break;
        default:
      }
      displayOptions.add(
        DropdownMenuItem(
          value: options[x],
          child: Container(
            height: 60,
            child: Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 50,
                  child: Image.network("$img"),
                ),
              Text("${options[x]}")
              ],
            ),
          ),
        )
      );
  }
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: 
       Material(
        shadowColor: qNo % 2 == 0 ?  Colors.blue[50]:Colors.white,
        borderRadius: BorderRadius.circular(8),
        
        color: qNo % 2 == 0 ? Colors.grey[200]: Colors.white,
        elevation: qNo % 2 == 0 ? 14: 0,
            child: Container(
              padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // border: Border.all(
            //   // color: Colors.blue[700],
            //   width: 1.5
            // ),
            borderRadius: BorderRadius.circular(8)
          ),
          child:
      Container(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$title", style: TextStyle(
              color: Colors.red,
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
        ),
      )
    ))),
  );
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
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Padding(
      padding: const EdgeInsets.only(top:0.0),
      child: 
      Material(
        shadowColor: qNo % 2 == 0 ?  Colors.blue[50]:Colors.white,
        borderRadius: BorderRadius.circular(8),
            
        
        color: qNo % 2 == 0 ? Colors.grey[200]: Colors.white,
        elevation: qNo % 2 == 0 ? 14: 0,
            child: Container(
              padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // border: Border.all(
            //   // color: Colors.blue[700],
            //   width: 1.5
            // ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            )
          ),
          child: Column(
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
          ),
        ),
      )
    ),
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


setAnswers(x, value){
  setState(() {
    answers[x] = value;
  });
}

 setStateInParent(){
    for(int x=0; x<controllersList.length; x++){
        if(controllersList[x].text != null && controllersList[x].text.length  > 0){
            setAnswers(x, controllersList[x].text);
        }
    }
  }
  submit(){
    setStateInParent();
    for(int x=0; x< controllersList.length; x++){
      try {
        print(answers[x]);
      } catch (e) {
        print("error is $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    populateControllers();
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
                  print("printed");
                  print(controllersList[0]);
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> Specific(purpose: answers[0], submitFnc:submit, setAnswers:setAnswers)));
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
          title: Text("General Questions"),
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
                    customSelectInput("Purpose", "Choose purpose", ["Select","Hotels", "Administration, offices or bank", "Commercial centers, shops", "Hospital", "Schools", "Housing"], 0),
                    customSelectInput("State", "Select the state", ["Select", "New", "Revamping", "Extension"], 1),
                    customSelectInputHeight("Number of floors", "Enter number of floors", ["Select","Ground level to first floor", "Second floor to Third floor", "Third floor to Seventh floor", "Up to seven floor and H (height) <28m"], 2),
                    CustomTextInput(title:"Number of basement", label:"Enter number of basement", qNo:3, controller: controllersList[3]),
                    customSelectInput("Height of last floor", "Enter Height of last floor", ["Select","Greater than 8m", "Between 28m and 50m", "Greater than 50m"], 4),
                    customSelectInput("Total Area", "Total area", ["Select","Greater than 120m", "Greater than 220m", "Between 300m - 500m"], 5),
                    customSelectInput("Number of people in building", "Number of people in the building", ["Select","More than 200", "More than 120", "More than 500", "Between 500-1000"], 6),
                    customSelectInput("Estimated budget","Estimated budget", ["Select","200000", "300000", "500000", "100000"], 7),
                                       

                  ],
                ),
              ),
      ),)
    );
  }
}
