import 'package:flutter/material.dart';
import '../globals.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welcome.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Let's Get You \n Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 150,
                child: OutlineButton(
                  onPressed: () {},
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: OutlineButton(
                  onPressed: () {},
                  borderSide: BorderSide(
                    color: primaryColor,
                    // width: 100
                  ),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
