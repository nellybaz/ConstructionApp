import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final String _label;
  final String _hintText;
  final bool _obscureText;
  final Icon _icon;

  UserInput(this._label, this._hintText, this._obscureText, this._icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: _icon,
              ),
              Text(
                _label,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ],
          ),
          TextField(
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
}
