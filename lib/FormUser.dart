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
}