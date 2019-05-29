import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget{
  final label;
  final title;
  CustomTextInput({this.label, this.title});

  final _textController = TextEditingController();
   @override
   Widget build(BuildContext context) {
   return Column(
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
        controller: _textController,
        onEditingComplete: () => print(_textController.text),
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
          
        )
      ),

    ),
    )
      ],
    );
}
}