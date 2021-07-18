import 'package:flutter/material.dart';
import 'package:untitled/FormUser.dart';
import 'package:untitled/main.dart';
import 'package:untitled/sharedPreferance.dart';

import 'Route.dart';

class Home extends StatefulWidget {
  FormUser formUser;

  Home(this.formUser);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.formUser.user==Type.Customer?
              Column(children: [
                Text(widget.formUser.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.formUser.password,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                Text(widget.formUser.confirm,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),],)
                  :
              Column(children: [
                Text(widget.formUser.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.formUser.password,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.formUser.confirm,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.formUser.company,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.formUser.shop,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text(widget.formUser.goods,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],)   ,
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 2)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueAccent,
                ),
                child: ElevatedButton(
                  onPressed: () async{

                   SpHelper.spHelper.sharedPreferences.remove("user");
                   Navigator.of(context).pop();


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
      ),
    );
  }
}

