import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/launch.dart';
import 'package:untitled/sharedPreferance.dart';
import 'package:untitled/textField.dart';

import 'FormUser.dart';
import 'Home.dart';
import 'Route.dart';
import 'file.dart';

class Mershant extends StatefulWidget {
  @override
  _MershantState createState() => _MershantState();
}

GlobalKey<FormState> mershantKey = GlobalKey<FormState>();

class _MershantState extends State<Mershant> {
  String email;
  String password;
  String confirm;
  String company;
  String shop;

  List<String> drop = ['fashion', 'shoes', 'food', 'games'];

  String init = 'fashion';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mershantKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldClass("Email", (v) {
              this.email = v;
            }),
            SizedBox(
              height: 20,
            ),
            TextFieldClass("password", (v) {
              this.password = v;
            }),
            SizedBox(
              height: 20,
            ),
            TextFieldClass("confirm password", (v) {
              this.confirm = v;
            }),
            SizedBox(
              height: 20,
            ),
            TextFieldClass("Company", (v) {
              this.company = v;
            }),
            SizedBox(
              height: 20,
            ),
            TextFieldClass("shop", (v) {
              this.shop = v;
            }),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(color: Colors.black, width: 2)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueAccent,
              ),
              child: DropdownButton<String>(
                items: drop.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 100),
                      child: new Text(value),
                    ),
                  );
                }).toList(),
                onChanged: (v) {
                  init = v;
                  setState(() {});
                },
                value: init,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(color: Colors.black, width: 2)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueAccent,
              ),
              child: ElevatedButton(
                onPressed: () async{
                  // Validate returns true if the form is valid, or false otherwise.
                  if (mershantKey.currentState.validate()) {
                    mershantKey.currentState.save();
                  }
                if (email != null && password != null && confirm != null&&shop!=null&&company!=null) {
                    FormUser mershantUser = FormUser.mershant(
                        email, password, confirm, company, shop, init);
                    SpHelper.spHelper.setUser(mershantUser);
                    FileHelper.fileHelper.write("mershant", jsonEncode(mershantUser.toMap()));
                    var result=RouteApp.route.pushFuction(Home(mershantUser));
                    print(await FileHelper.fileHelper.read("mershant"));
                  //var result=  await Navigator.of(context).pushNamedAndRemoveUntil('home',ModalRoute.withName('name'),arguments: mershantUser);
                  print(result);
                  UrlLauncher.urlLuncher.openTelegram();
                }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    child: Center(child: Text('Submit')),
                    width: double.infinity,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
