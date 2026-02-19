import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store2024/controllers/cart-controller.dart';
import 'package:store2024/controllers/home-controller.dart';

import '../constants.dart';
import '../models/auth/product.dart';
import 'buttomBarShared.dart';
class CartList extends StatelessWidget {
   CartList({super.key});
   final HomeController homeController = Get.put(HomeController());
final CartController cartController=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title:GetBuilder<CartController>(builder: (_)=> Text('total=${cartController.total}'),),),
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
           GetBuilder<CartController>(builder: (_)=>ListView.builder(
               itemCount: cartController.cartList.length,
               itemBuilder: (context,i){
                 Product product=cartController.getProductById(int.parse(cartController.cartList[i].split(",").first))!;


                 int amount=int.parse(cartController.cartList[i].split(",").last);
                 double subTotall=double.parse(product.price!)*amount;

                 return Container(
                   child: Row(
                     children: [
                       Expanded(
                           flex: 1,
                           child: Image.network('${baseUrl}/${product.image}')),
                       Expanded(
                         flex: 2,
                         child: Column(
                           children: [
                             Text(product.name!),
                             Text('$subTotall'),
                             Text('$amount'),
                             Text('${product.description!.substring(0,10)}............'),
                           IconButton(onPressed: (){
                             cartController.deletItem(i);
                           }, icon: Icon(Icons.delete)),
                             Row(
                               children: [
                                 ElevatedButton(onPressed:(){
                                   cartController.incAmount(index:i);
                                 }, child: Text('+')),
                                 // GetBuilder<CartController>(builder: (_)=>Text('${cartController.amount}'),),
                                 ElevatedButton(onPressed:(){
                                   cartController.decAmount(index:i);
                                 }, child: Text('-')),
                               ],
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                 );
               }),),
              ],
            ),
        bottomNavigationBar: ButtomBarShared(homeController:homeController,)
         );
  }
}
