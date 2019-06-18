import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'UserInput.dart';
import './my_flutter_app_icons.dart';
import '../globals.dart';
import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  Animation slideAnime;
  AnimationController animationController;
  Tween<double> tween;

 

  double height = 600;
  double iconSize = 24;
  bool isBtnPressed = false;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  listener() {
    print(animation.value);

    setState(() {
      iconSize = animation.value * 30;
    });

    if (animationController.isCompleted) {
      print("animation completed");

      // animationController.reverse();
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    // animation.addListener(listener);

    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    slideAnime = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(animationController);

    animationController.forward();
    animation.addListener(listener);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SlideTransition(
        position: slideAnime,
        child:  ListView(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  bottom: 0.0, left: 50.0, right: 50.0, top: 120.0),
              child: Column(
                children: <Widget>[
                  userInput(
                      "EMAIL",
                      "jomamady@example.com",
                      false,
                      Icon(Icons.email, color: Colors.black87),
                      _emailController),
                  userInput(
                      "PASSWORD",
                      ".......",
                      true,
                      Icon(
                        Icons.security,
                        color: Colors.black87,
                      ),
                      _passwordController),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10.0, left: 70.0, right: 70.0, top: 30),
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () => validate(context),
                        textColor: Colors.white,
                        color: primaryColor,
                        splashColor: Colors.orangeAccent,
                        child: isBtnPressed
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Text(
                                "LOG IN",
                                style: TextStyle(color: Colors.white),
                              ),
//                    padding: EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Text("or log in with")),
                  Container(
                    margin:
                        EdgeInsets.only(left: 60.0, right: 20.0, bottom: 10),
                    child: FadeTransition(
                      opacity: animation,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              MyFlutterApp.twitter_circled_1,
                              color: Colors.blueAccent,
                              // size: iconSize,
                            ),
                          ),
                          new IconButton(
                            onPressed: () {},
                            icon: new Icon(
                              FontAwesomeIcons.google,
                              color: primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blueAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
         
        ),
    );
  }

  Widget userInput(_label, _hintText, _obscureText, _icon, _controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: _icon,
              ),
              Text(
                _label,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: _hintText,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent))),
            obscureText: _obscureText,
          )
        ],
      ),
    );
  }

  void validate(context) async {
    // print(_emailController.text);
    try {
      setState(() {
        isBtnPressed = true;
      });
      FirebaseUser fireUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print(fireUser);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      setState(() {
        isBtnPressed = false;
      });
      print(e);

      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Wrong login details"),
            );
          });
    }
  }

  loginWithGoogle() {
    // FirebaseUser firebaseUser = FirebaseAuth.instance.sg
  }
}
