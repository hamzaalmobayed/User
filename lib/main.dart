import 'package:flutter/material.dart';
import 'package:untitled/customer.dart';
import 'package:untitled/textField.dart';

import 'Mershant.dart';

void main() {
  runApp(MyApp());
}

enum Type { Customer, Mershant }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Type group=Type.Customer;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        value: Type.Customer,
                        title: Text("Customer"),
                        groupValue: group,
                        onChanged: (v) {
                          group = v;
                          setState(() {

                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        value: Type.Mershant,
                        title: Text("Mershant"),
                        groupValue: group,
                        onChanged: (v) {
                          group = v;
                          setState(() {

                          });
                        }),
                  )
                ],
              ),

              group==Type.Customer?Customer():Mershant(),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}