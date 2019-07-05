//
import 'package:construction_app/api/app_api.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import 'homepage.dart';

// String title = "";
String topText =
    "View some sample photos of what your building could look like";

class Statements extends StatefulWidget {
  final selectedAnswers;
  final questions;
  final answers;
  Statements({this.selectedAnswers, this.questions, this.answers});
  @override
  State<StatefulWidget> createState() {
    return _StatementsState();
  }
}

class _StatementsState extends State<Statements> {
  List outputList = [];

  getOutputs() async {
    APIProvider apiProvider = new APIProvider();
    var res = await apiProvider.fetchOutput();

    //getting outputs for given answers
    List temp = [];
    for (int x = 0; x < widget.selectedAnswers.length; x++) {
      for (int y = 0; y < res.length; y++) {
        if (res[y]['answer_id'] == widget.selectedAnswers[x]) {
          for (int z = 0; z < widget.answers.length; z++) {
            if (widget.answers[z]['id'] == widget.selectedAnswers[x]) {
                Output output = Output();
                output.answer = widget.answers[z]['description'];
              for (int n = 0; n < widget.questions.length; n++) {
                if (widget.questions[n]['id'] ==
                    widget.answers[z]['question_id']) {
                
                  output.question = widget.questions[n]['title'];
                  output.output = res[y];
                  print(output.question);
                  temp.add(output);
                }
              }
            }
          }
          // temp.add(output);
        }
      }
    }
    print(temp);
    setState(() {
      outputList = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    getOutputs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.home),
        ),
        title: Text(
          "Statement",
          style: TextStyle(),
        ),
        backgroundColor: primaryColor,
      ),
      // floatingActionButton: Container(
      //   child: RaisedButton(
      //     color: Colors.red,
      //     onPressed: () {},
      //     child: Text(
      //       "Download Statement",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: widget.selectedAnswers.length > 0
            ? ListView(children: populateOutput())
            : Center(
                child: Text("Loading statements. Please wait"),
              ),
      ),
    );
  }

  populateOutput() {
    List<Widget> temp = [];
    // temp.add(
    //   outputHeadingSection(),
    // );

  

    for (int x = 0; x < outputList.length; x++) {
        temp.add(
      SizedBox(
        height: 20,
      ),
    );

      temp.add(
        Container(
          child: outputItem(context, x),
        ),
      );

      temp.add(
        Container(
          margin: EdgeInsets.only(top:20),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey)
          ),
        )
      );
    }

    

    return temp;
  }

  Material outputHeadingSection() {
    return Material(
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
              Text(
                "Statement for Hotel project \nState: New \nDate: ${DateTime.now().toIso8601String().substring(0, 10)}",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Number of Floors: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ground floor to first floor",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column outputItem(BuildContext context, x) {
    return Column(
      children: <Widget>[
        Material(
          //  color: Colors.blue[50],
          elevation: 14,
          shadowColor: Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Text("[Question] ${outputList[x].question}", style: TextStyle(
                    fontSize: 18 
                  ),),
                  Text(
                    "[Your Answer] ${outputList[x].answer}",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold, 
                        // color: Colors.red
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
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Material(
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
                      outputList[x].output['description'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                   Text(
                                    "Requirements",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    "${outputList[x].output['description']} ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.red
                                        ),
                                  ),
                                 
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['applicable_standard'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Applicable Standard",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                      "${outputList[x].output['applicable_standard']}")
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['deliverable'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Deliverables",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                      "${outputList[x].output['deliverable']}"),
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['person_in_charge'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "In charge of deliverables",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                      "${outputList[x].output['person_in_charge']}"),
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['estimated_cost'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Estimated Cost",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                      "${outputList[x].output['estimated_cost']}"),
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['deadline'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Deadline",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text("${outputList[x].output['deadline']}"),
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['valid_for'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Valid for",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text("${outputList[x].output['valid_for']}"),
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['companies'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Companies",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text("${outputList[x].output['companies']}"),
                                ],
                              ),
                            )
                          : Container(),
                      outputList[x].output['penalities'] != ""
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Penalties",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text("${outputList[x].output['penalities']}"),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Output {
  var question;
  var answer;
  var output;

  Output({this.question, this.answer, this.output});
}
