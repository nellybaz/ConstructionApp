import 'package:flutter/material.dart';

String title = "My Statement";
String about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntut labore et dolore magna aliqua. Ut enim adminim veniam, quis nostrud exercitation ullamcolaboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptatevelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

void main() => runApp(new About());


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
           title: new Center(child: Text(title),),
          backgroundColor: Colors.redAccent,

        ),
        
        body: 
        new Padding(padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0), child:
        new Card( 
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all( 25.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Column(children: <Widget>[
                      Text("About Us", style: TextStyle(fontSize: 25.0),), 
                      Text("V.2019", style: new TextStyle(fontSize: 17.5),)],),
                    // new Image Logo;
                    
                    
                  ],
                ),
              ),Center(child:new Text(about, style: new TextStyle(fontSize: 16),),),

              Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0 , 20.0), 
              child:Text("You can contact us via these means", style: TextStyle(fontSize: 20.0),)),

              Row(children: <Widget>[
                // Icon for mail;
                Text("hello@company.com"),
              ],),
              Row(children: <Widget>[
                // Icon for phone
                Text("+250 889 8953")
              ],)
             
            ],
          ),
          color: Colors.white,
          
        ),
        

//        body: new Padding(  padding: EdgeInsets.all(25.0),  child: const Card(
//          child: Center(child:
//          Text( "View some sample photos of what your building could look like", style: TextStyle( fontSize: 15.0, ),),
//          ),
//)
//        ),
      
      ),
      backgroundColor: Colors.white,
      ),
      
    );
  }
}