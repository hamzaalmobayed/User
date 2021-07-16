import 'package:untitled/main.dart';

class FormUser{
  String email;
  String password;
  String confirm;
  String company;
  String shop;
  String goods;
  Type user;

  FormUser.customer(this.email, this.password, this.confirm,{this.user=Type.Customer});
  FormUser.mershant(
      this.email, this.password, this.confirm, this.company, this.shop,this.goods,{this.user=Type.Mershant});

  factory FormUser.map(Map map){
    FormUser user;
  if(map["isMershant"]){
    user= FormUser.mershant(map["email"], map["password"], map["confirm"], map["company"], map["shop"], map["goods"]);
  }  else{
    user= FormUser.customer(map["email"], map["password"], map["confirm"]);

  }
  return user;
  }

  Map<String,dynamic> toMap(){
    return {...this.user==Type.Customer?
        {
          "isMershant":false,
          "email":this.email,
          "password":this.password,
          "confirm":this.confirm,
        }
        :
        {
          "isMershant":true,
          "email":this.email,
          "password":this.password,
          "confirm":this.confirm,
          "shop":this.shop,
          "company":this.company,
        }
  };
  }
}