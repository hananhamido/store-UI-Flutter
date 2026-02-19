import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store2024/constants.dart';
import 'package:store2024/controllers/cart-controller.dart';
import 'package:store2024/controllers/home-controller.dart';
import 'package:store2024/controllers/product-view-controller.dart';
import 'package:store2024/layouts/cartList.dart';
import 'package:store2024/layouts/product-details.dart';
import 'package:store2024/models/auth/category.dart';
import 'package:store2024/models/auth/company.dart';
import 'package:store2024/models/auth/product.dart';

import 'buttomBarShared.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());
final ProductViewController productViewController=Get.put(ProductViewController());
final CartController cartController=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
      //
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
                GetBuilder<HomeController>(
                  builder: (_) => CarouselSlider(
                    items: homeController.adsItem,
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
                Text('catgory'),
                GetBuilder<HomeController>(
                    builder: (_) => Container(
                          height: 120,
                          child: Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.categoriesList.length,
                                itemBuilder: (context, i) {
                                  List<Category> list =
                                      homeController.categoriesList;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            productViewController.byCategory(homeController.productList, list[i].id!);
                                            productViewController.setText(list[i].name!);
                                        },
                                          child: CircleAvatar(
                                            child: Image.network(
                                              '${baseUrl}/${list[i].icon}',
                                              width: 40,
                                              height: 40,
                                            ),
                                            radius: 40,
                                          ),
                                        ),
                                        Text(list[i].name ?? 'none')
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )),
                Text('company'),
                GetBuilder<HomeController>(
                    builder: (_) => Container(
                          height: 120,
                          child: Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.companiesList.length,
                                itemBuilder: (context, i) {
                                  List<Company> list =
                                      homeController.companiesList;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                      onTap: (){
                                        productViewController.setText(list[i].name!);
                                        productViewController.byCompany(homeController.productList, list[i].id!);
                                      },
                                      child:  Image.network('${baseUrl}/${list[i].logo}',
                                          width: 60,
                                          height: 60,
                                        ),),
                                        Text(list[i].name ?? 'none')
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )),
                Text('product'),
                GetBuilder<HomeController>(
                    builder: (_) => Container(
                          height: 120,
                          child: Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.productList.length,
                                itemBuilder: (context, i) {
                                  List<Product> list = homeController.productList;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            cartController.indexOfProducts=i;
                                            cartController.amount=1;
                                            Get.to(ProductDetails());
                                          },
                                          child: Image.network(
                                            '${baseUrl}/${list[i].image}',
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        Text('${list[i].price!}'),
                                        Text('${list[i].price!}'),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        )),
              ],
            ),
          ],
        ),
    bottomNavigationBar: ButtomBarShared(homeController:homeController,)
    );



  }
}
