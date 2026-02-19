import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth-controller.dart';

class Register extends StatelessWidget {
  TextEditingController fUsername = TextEditingController();
  TextEditingController fPassword = TextEditingController();
  TextEditingController fFullname = TextEditingController();
  TextEditingController fCity = TextEditingController();
  TextEditingController fAddress = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STORE',style: TextStyle(fontSize: 70,color: Colors.white),),
          toolbarHeight: 80,

          backgroundColor: Colors.deepPurple,
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
          )
      ),
      body: Stack(
        children: [
          // الطبقة الخلفية (صورة)
          // Image.asset(
          //   'assets/images (2).png', // هنا ضع المسار إلى الصورة
          //   fit: BoxFit.cover, // يجعل الصورة تغطي كامل الشاشة
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          // الطبقة الشفافة

          // المحتوى الذي سيتم عرضه فوق الطبقات
          Center(
            child: Column(
              children: [
                SizedBox(height: 120),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your mobile'),
                  controller: fUsername,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password'),
                  controller: fPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your fullname'),
                  controller: fFullname,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your city'),
                  controller: fCity,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your address'),
                  controller: fAddress,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      authController.register(
                          username: fUsername.text,
                          password: fPassword.text,
                          fullName: fFullname.text,
                          city: fCity.text,
                          address: fAddress.text);
                    },
                    child: Text('register')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
