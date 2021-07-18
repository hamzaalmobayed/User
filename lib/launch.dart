import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
class UrlLauncher{
  UrlLauncher._();
  static final urlLuncher=  UrlLauncher._();
  String _url;

  lunch(_url)async{
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
  sendSms(){
    try{
      _url="sms:0599197739";
      lunch(_url);
    }catch(e){
      print(e);
    }
  }
  sendPhone(){
    try{
      _url="tel:+1 555 010 999";
      lunch(_url);
    }catch(e){
      print(e);
    }
  }
  sendEmail(){
    try{
      _url="mailto:smith@example.org?subject=News&body=New%20plugin";
      lunch(_url);
    }catch(e){
      print(e);
    }
  }
  openFlutter(){
    try{
      _url='http://flutter.dev';
      lunch(_url);
    }catch(e){
      print(e);
    }
  }
  openTelegram(){
    try{
      _url='tg://msg?text=Mi_mensaje&to=+1555999';
      lunch(_url);
    }catch(e){
      print(e);
    }
  }
  openGooglePlay(){
    try{
      _url='https://play.google.com/store/apps/details?id=';
      lunch(_url);
    }catch(e){
      print(e);
    }
  }

  share(){
    Share.share('check out my website https://example.com');
  }


}
