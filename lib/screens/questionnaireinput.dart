import 'package:flutter/material.dart';

class QuestionnaireInput extends StatelessWidget {
  final String _label;
  final String _hintText;
  final bool _helperText;

  QuestionnaireInput(this._label, this._hintText, this._helperText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0), 
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  _label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          TextField(
            decoration: InputDecoration(
                hintText: _hintText,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(15.0))),
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
