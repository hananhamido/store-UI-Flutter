import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store2024/controllers/home-controller.dart';
import 'package:store2024/models/auth/product.dart';

import '../constants.dart';
import '../controllers/cart-controller.dart';
class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
final HomeController homeController=Get.put(HomeController());
final CartController cartController=Get.put(CartController());


  @override
  Widget build(BuildContext context) {

    Product product=homeController.productList[cartController.indexOfProducts];
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

            // المحتوى الذي سيتم عرضه فوق الطبقات
            Column(
              children: [
                Image.network('${baseUrl}/${product.image}',width: 1000,height: 180,),
                Text(product.price!),
                Text(product.description!),
                Text('${product.numberOfSeen}'),
                Row(
                  children: [
                    ElevatedButton(onPressed:(){


                      //add to cart
                      cartController.addToCart(product.id);


                    }, child: Text('add to cart')),
                    ElevatedButton(onPressed:(){
                      cartController.incAmount();
                    }, child: Text('+')),
                    GetBuilder<CartController>(builder: (_)=>Text('${cartController.amount}'),),
                    ElevatedButton(onPressed:(){
                      cartController.decAmount();
                    }, child: Text('-')),

                  ],
                )
              ],
            ),
          ],
        ));
  }
}
