import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget{
  final String label;
  final String title;
  final int qNo;
  final TextEditingController controller;
  CustomTextInput({this.label, this.title, this.qNo, this.controller});
   @override
   Widget build(BuildContext context) {
   return 
   Container(
     margin: EdgeInsets.only(bottom: 10),
     child: Material(
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
          child:
     Column(
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
          controller: controller,
          onEditingComplete: () => print(controller.text),
          keyboardType: TextInputType.number,
          validator: (val)=> val.isEmpty ? "Cannot be empty" : null,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.black
          ),
        border: InputBorder.none,
          labelText: " $label",
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey
            
          )
        ),

      ),
      )
        ],
      ))),
   );
}
}