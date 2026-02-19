import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store2024/controllers/splash-controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // الطبقة الخلفية (صورة)
        // Image.asset(
        //   'assets/images (2).png', // هنا ضع المسار إلى الصورة
        //   fit: BoxFit.cover, // يجعل الصورة تغطي كامل الشاشة
        //   width: double.infinity,
        //   height: double.infinity,
        // ),

        Column(
          children: [
            Center(
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images (6).png',
                      width: 1000,
                      height: 200,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

// body: Stack(
//
//         children: [
//           // الطبقة الخلفية (صورة)
//           Image.asset(
//             'assets/background_image.jpg', // هنا ضع المسار إلى الصورة
//             fit: BoxFit.cover, // يجعل الصورة تغطي كامل الشاشة
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           // الطبقة الشفافة
//           Container(
//             color: Colors.black.withOpacity(0.5), // طبقة شفافة بلون أسود
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           // المحتوى الذي سيتم عرضه فوق الطبقات
//           Center(
//             child: Text(
//               'Hello, Flutter!',
//               style: TextStyle(fontSize: 30, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     ),
//     );
//   }
// }

/////////////////////////////////////////
// body: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Image.asset('assets/icon.png',width: 1000,height: 200,),
//     CircularProgressIndicator()
//   ],
// ),
