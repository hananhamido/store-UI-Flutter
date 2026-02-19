import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store2024/constants.dart';
import 'package:store2024/controllers/product-view-controller.dart';
import 'package:store2024/controllers/home-controller.dart';
import '../models/auth/product.dart';
class ProductView extends StatelessWidget {
    ProductView({super.key});
ProductViewController productViewController=Get.put(ProductViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(productViewController.text)),
        body: Stack(
    children: [
    // الطبقة الخلفية (صورة)
    // Image.asset(
    // 'assets/images (2).png', // هنا ضع المسار إلى الصورة
    // fit: BoxFit.cover, // يجعل الصورة تغطي كامل الشاشة
    // width: double.infinity,
    // height: double.infinity,
    // ),

        ListView.builder(
            itemCount: productViewController.showListProduct.length,
                itemBuilder: (context ,i) {
                  Product product = productViewController.showListProduct[i];
                  return Container(
                      child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.network(
                                    '${baseUrl}/${product.image}')),
                            Expanded(
                              flex: 2,
                              child: Column(
                                  children: [
                                    Text(product.name!),
                                    Text(product.price!),
                                    Text('${product.description!.substring(
                                        0, 10)}............'),
                                  ]),
                            ),
                          ]
                      ));
                }),
    ],));
  }
}
