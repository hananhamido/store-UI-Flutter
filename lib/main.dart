import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:store2024/controllers/home-controller.dart';
import 'package:store2024/controllers/main-controller.dart';
import 'package:store2024/layouts/auth/login.dart';
import 'package:store2024/layouts/home-page.dart';

import 'package:store2024/layouts/auth/register.dart';

import 'layouts/splash-screen.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeController());
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home:SplashScreen(),
    );
  }
}
