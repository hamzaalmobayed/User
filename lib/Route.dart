import'package:flutter/material.dart';
class RouteApp{
  RouteApp._();
  static final route = RouteApp._();
  GlobalKey<NavigatorState> key=GlobalKey<NavigatorState>();
  pushFuction(Widget widget){
    key.currentState.push(MaterialPageRoute(builder: (con)=>widget));
  }
  pushNamedFuction(String route,arguments){
    key.currentState.pushNamed(route,arguments: arguments);
  }
}