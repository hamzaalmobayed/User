import 'package:flutter/material.dart';
import 'package:untitled/FormUser.dart';
import 'package:untitled/Home.dart';
import 'package:untitled/Route.dart';
import 'package:untitled/textField.dart';
class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}
GlobalKey<FormState> customerKey=GlobalKey<FormState>();
class _CustomerState extends State<Customer> {
  String email;
  String password;
  String confirm;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: customerKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldClass("Email",(v){this.email=v;}),
            SizedBox(height: 20,),
            TextFieldClass("password",(v){this.password=v;}),
            SizedBox(height: 20,),
            TextFieldClass("confirm password",(v){this.confirm=v;}),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 2)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueAccent,
              ),
              child: ElevatedButton(
                onPressed: () async{
                  // Validate returns true if the form is valid, or false otherwise.
                  if (customerKey.currentState.validate()) {
                    customerKey.currentState.save();
                  }

                  if(email!=null&&password!=null&&confirm!=null){
                    FormUser customerUser=FormUser.customer(email,password,confirm);
                    var result=await RouteApp.route.pushNamedFuction('home',customerUser);
                   //var result= await Navigator.of(context).pushNamedAndRemoveUntil('home',ModalRoute.withName('name'),arguments: customerUser);
                   print(result);
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
