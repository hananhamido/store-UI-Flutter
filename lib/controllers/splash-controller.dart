import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import"package:shared_preferences/shared_preferences.dart";
import 'package:store2024/constants.dart';
import 'package:store2024/layouts/auth/login.dart';
import 'package:store2024/layouts/home-page.dart';


class SplashController extends GetxController{
   late SharedPreferences pref;
   String token="";
   String result="";
  @override
  Future<void> onInit() async {
    super.onInit();
   await checkLogin();
  }



  checkLogin() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    token=pref.getString("token")??"-";
   await Future.delayed(Duration(seconds: 3));
    if(token=="-"){
      Get.to(login());
    }
    else{
      bool state= await checkToken(token);
      if(state){
        Get.to(HomePage());
      }
      else{
        Get.to(login());
      }
      }
      }

  Future<bool> checkToken(String token) async {
 final response=await http.get(Uri.parse(checkTokenUrl),
 headers: {
   "Content-Type": "application/json",
   "authrization": "bearer" + token

     }

 );
 if(response.statusCode==200){
   return true;
 }
 return false;
  }

}