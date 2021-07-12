import 'package:flutter/material.dart';
class TextFieldClass extends StatelessWidget {
  String name;
  Function function;


  TextFieldClass(this.name,this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 2)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueAccent,
      ),
      child: TextFormField(
        onSaved: function,
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },

        decoration: InputDecoration(
          labelText: name,


        ),
      ),
    );
  }
}

