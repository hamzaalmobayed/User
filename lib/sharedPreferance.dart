import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/FormUser.dart';
import 'dart:convert';

import 'package:untitled/Home.dart';
class SpHelper{
  SpHelper._();
  static final spHelper=SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPreferences()async{
    sharedPreferences=await SharedPreferences.getInstance() as SharedPreferences;
  }
  setUser(FormUser user){
    sharedPreferences.setString("user", json.encode(user.toMap()));

  }
  getUser(){
    String user=sharedPreferences.getString("user");
    if(user==null){
      return null;
    }
    Map userMap=json.decode(user);
    FormUser formUser=FormUser.map(userMap);
    return formUser;
  }
}
