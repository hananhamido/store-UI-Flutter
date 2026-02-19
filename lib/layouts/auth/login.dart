import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store2024/controllers/auth-controller.dart';
import 'package:store2024/layouts/auth/register.dart';

class login extends StatefulWidget {

  const login({super.key});

  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  TextEditingController fUsername=TextEditingController();
  TextEditingController fPassword=TextEditingController();
  final AuthController authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('STORE',style: TextStyle(fontSize: 70,color: Colors.white),),
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


                SizedBox(height: 150),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your mobile',



                  ),
                  controller: fUsername,
                  keyboardType: TextInputType.phone,

                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password'
                  ),
                  controller: fPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 50),
                ElevatedButton(onPressed: (){
                  authController.login(username: fUsername.text, password: fPassword.text);
                }, child: Text('login'),),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){
                  Get.to(Register());
                }, child: Text('create new account')),
              ],
            ),

            ),

        ],
      ),
    );
  }
}

