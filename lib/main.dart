import 'package:flutter/material.dart';
import 'about.dart';

String title = "My Statement";
String topText =
    "View some sample photos of what your building could look like";

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                  icon: new Icon(Icons.apps),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
          title: Center(
              child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          backgroundColor: Color(0xffEB6B5E),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 25.0),
          child: ListView(children: [
            new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    topText,
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 15.0,
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  padding: EdgeInsets.fromLTRB(62.5, 0, 62.5, 0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 175.0,
                  ),
                ),

                // Padding()
                new Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      height: 250,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red)),
                      child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(border: InputBorder.none
                              // border: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.red)),
                              ),
                          style: TextStyle(
                              // height: 10,
                              fontSize: 14,
                              color: Colors.black)),
                    ),
                  ),
                ),

                Align(
                  alignment: FractionalOffset(1, 0.6),
                  child: Container(
                    child: new RaisedButton(
                      onPressed: () {},
                      child: Text("DOWNLOAD"),
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
