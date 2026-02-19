import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:store2024/constants.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:store2024/layouts/home-page.dart';

class AuthController extends GetxController {
  late SharedPreferences pref;

  @override
  Future<void> onInit() async {
    super.onInit();
    pref = await SharedPreferences.getInstance();
  }

  void login({required String username, required String password}) async {
    final response = await http.post(Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": username, "password": password}));

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      String token = res["accessToken"];
      pref.setString("username", username);
      pref.setString("token", token);
      Get.to(HomePage());
    } else {
      print("error");
    }
  }
  Future<void> register(
      {required String username,
        required String password,
        required String fullName,
        required String city,
        required String address}) async {
    final response = await http.post(Uri.parse(registerUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
          "fullName": fullName,
          "city": city,
          "address": address
        }));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      if (res['message'] == "welcom") {
        print("welcome");
        login(username: username, password: password);
      } else {
        print("error");
      }
    } else {
      print(response.body);
    }
  }

}
