import 'package:construction_app/api/app_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestionanaireScreenState();
  }
}

class _QuestionanaireScreenState extends State<QuestionnaireScreen>
    with TickerProviderStateMixin {
  AnimationController slideAnimationController;
  AnimationController slideAnimationControllerIn;
  Animation slideAnimation;
  Animation slideAnimationIn;
  Animation rotateAnimation;
  AnimationController rotateAnimationController;
  TextEditingController _inputController = TextEditingController();

  String dropDownAnswerValue = "select";
  int currentIndex = 0;
  
  int currentQuestionID = 0;

  bool isEntering = false;
  bool isInput = false;
  List selectedAnswers = [];
  List<dynamic> questions = [];
  List<dynamic> answers = [];
  List activeAnswers = [];
  bool showError = false;

  fetchData() async {
    // ..fetch all questions
    APIProvider apiProvider = new APIProvider();
    var res = await apiProvider.fetchQuestions();

    setState(() {
      questions = res.reversed.toList();
      currentQuestionID = questions[currentIndex]['id'];
    });

    //fetch all answers
    var ans = await apiProvider.fetchAnswers();
    setState(() {
      answers = ans;
    });

    // populate active anwsers
    populateActiveAnswers();
  }

  populateActiveAnswers() {
    if(questions[currentIndex]['is_input'] ){
      // print("is Boolean");
      setState(() {
        isInput = true;
      });
    }

    List temp = [];
    for (int x = 0; x < answers.length; x++) {
      if (answers[x]['question_id'] == currentQuestionID) {
        temp.add(answers[x]);
      }
    }

    setState(() {
      activeAnswers = temp;
    });

  }

  List<DropdownMenuItem> populateDropDownAnswers() {
    List<DropdownMenuItem> dropDownAnswersList = [];
    dropDownAnswersList.add(
      DropdownMenuItem(
        child: Text("Select"),
        value: "select",
      ),
    );

    for (int x = 0; x < activeAnswers.length; x++) {
      dropDownAnswersList.add(
        DropdownMenuItem(
          child: Text("${activeAnswers[x]['description']}"),
          value: "${activeAnswers[x]['description']}",
        ),
      );
    }

    return dropDownAnswersList;
  }

  @override
  void initState() {
    super.initState();

    //fetch data

    fetchData();
    slideAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    slideAnimationControllerIn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-1.5, 0))
        .animate(slideAnimationController);
    slideAnimationIn = Tween<Offset>(begin: Offset(1.5, 0), end: Offset(0, 0))
        .animate(slideAnimationControllerIn);

    rotateAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    rotateAnimation = Tween<double>(begin: 0, end: 1).animate(rotateAnimationController);
    rotateAnimation.addListener(listener);
  }


  listener(){
    // print(rotateAnimation.value);
    if(rotateAnimation.value > 0.1){
        rotateAnimationController.reverse().then((f) => rotateAnimationController.reset());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questionnaire"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.red)
            ),
        child: Center(
          child: answers.length > 0
              ? ListView(                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[

                         SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SlideTransition(
                      position: isEntering ? slideAnimationIn : slideAnimation,
                      child: Material(
                        elevation: 14,
                        borderRadius: BorderRadius.circular(10),
                        shadowColor: Colors.deepOrangeAccent[100],
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "${questions[currentIndex]['title']}",
                                    style: questionTitle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(30),
                                    elevation: 14,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 15),
                                      child: isInput ? TextFormField(
                                        controller: _inputController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Enter value",
                                          border: InputBorder.none
                                        ),
                                      ) : DropdownButton(
                                        underline: Container(),
                                        isExpanded: true,
                                        onChanged: (v) {
                                          setState(() {
                                            dropDownAnswerValue = v;
                                          });
                                        },
                                        value: dropDownAnswerValue,
                                        items: populateDropDownAnswers(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    showError
                        ? Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: RotationTransition(
                              turns: rotateAnimation,
                              child: Text(
                                "Answer is required",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          )
                        : Container(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.1,
                            top: 20),
                        height: 48,
                        width: 150,
                        child: RaisedButton(
                          color: Colors.deepOrangeAccent,
                          onPressed: () {
                            processNextQuestion();
                          },
                          child: Text(
                            "Next >",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )

                      ],
                    ),
                   
                  ],
                )
              : Container(
                  child: Center(
                    child: Text("Loading Questions. Please wait"),
                  ),
                ),
        ),
      ),
    );
  }

  processNextQuestion() {
   
    if (dropDownAnswerValue == "select" && _inputController.text.length < 1) { 
      rotateAnimationController.forward();
      setState(() {
        showError = true;
      });
    } else {
      slideAnimationController.forward().then((f) => updateAnimations());
    }
  }

  updateIsEntering(int x) {
    // print(isEntering);
    setState(() {
      isEntering = x == 1 ? true : false;
    });
    // print(isEntering);
  }

  updateAnimations() {
    setState(() {
      showError = false;
      isInput = false;
      dropDownAnswerValue = "select";
      _inputController.text = "";
      currentIndex = currentIndex < questions.length-1 ? currentIndex + 1 :currentIndex;
      currentQuestionID = questions[currentIndex]['id'];
    });

    populateActiveAnswers();
    slideAnimationControllerIn.reset();
    updateIsEntering(1);
    slideAnimationController.reset();

    slideAnimationControllerIn.forward().then((f) => updateIsEntering(0));
  }
}

TextStyle questionTitle = TextStyle(fontSize: 22, color: Colors.black);
