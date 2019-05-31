import 'package:construction_app/screens/statements.dart';
import 'package:flutter/material.dart';

class StatementList extends StatelessWidget {


  populateList(context){
    List<Widget> tmp = [];
    for(int x=0; x<10; x++){
      tmp.add(
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Statements()));
          },
                  child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Material(
              // borderRadius: BorderRadius.circular(5),
              // color: x %2 ==0 ? Colors.blue[50]: Colors.white,
              // elevation: 14,
              // shadowColor: Colors.grey[50],
              child: ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                    // image: DecorationImage(
                    //   image: AssetImage("assetName"),
                    // )
                    
                  ),
                  // child: Icon(Icons),
                ),
                title: Text(x % 2 != 0 ? "Hotel Project": "Office Project"),
                subtitle: Text("${DateTime.now().toIso8601String()}"),
              ),
            ),
          ),
        )
      );

    }

    return tmp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statements"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: populateList(context)
        ),
      ),
      
    );
  }
}