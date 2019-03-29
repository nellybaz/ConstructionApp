import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'intro1.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new Intro1(),
        title: new Text('Making your dream house a reality',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white
        ),),
        image: Image.asset("assets/images/logo.png"),
        backgroundColor: Color(0xffEB6B5E),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 50.0,
        onClick: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> Intro1())),
        loaderColor: Colors.white,
      ),
    );
  }
}