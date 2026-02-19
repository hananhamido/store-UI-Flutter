import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store2024/constants.dart';
import 'package:store2024/layouts/auth/login.dart';
import 'package:store2024/layouts/billsList.dart';
import 'package:store2024/layouts/cartList.dart';
import 'package:store2024/layouts/home-page.dart';
import 'package:store2024/models/auth/product.dart';

import '../models/auth/ads.dart';
import '../models/auth/category.dart';
import '../models/auth/company.dart';

class HomeController extends GetxController {
  late SharedPreferences pref;
  List<Ads> adsList = [];
  List<Category> categoriesList = [];
  List<Company> companiesList = [];
  List<Product> productList = [];
  List<Widget> adsItem = [];

  int currentIndex=0;
  void setCurrentIndex(int x){
    currentIndex=x;
    if(x==1){
      Get.to(CartList());
    }
    if(x==0){
      Get.to(HomePage());
    }
    if(x==3){
      Get.to(BillsList());
    }
    update();
  }
  int indexOfProducts=0;
  String token = "";



int amount=1;

void incAmount(){
  amount++;
  update();
}
  void decAmount(){
    amount--;
    update();
  }


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    pref = await SharedPreferences.getInstance();
    token = pref.getString("token") ?? "";
    getAllAds();
    getAllCtegories();
    getAllCompanies();
    getAllProducts();

  }

  Future<void> getAllAds() async {
    token = pref.getString("token") ?? "";
    final response = await http.get(Uri.parse(adsUrl), headers: {
      "Content-Type": "application/json",
      "authrization": "tljyt" + token
    });
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      adsList = list.map((e) => Ads.fromJson(e)).toList();
      for (int i = 0; i < adsList.length; i++) {
        adsItem.add(
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage('${baseUrl}/${adsList[i].image!}'),
                  fit: BoxFit.cover),
            ),
          ),
        );
      }
      update();
    } else if (response.statusCode == 403) {
      Get.to(login());
    } else {
      print(response.body);
    }
  }

  Future<void> getAllCtegories() async {
    token = pref.getString("token") ?? "";
    final response = await http.get(Uri.parse(categoriesUrl), headers: {
      "Content-Type": "application/json",
      "authrization": "tljyt" + token
    });
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      categoriesList = list.map((e) => Category.fromJson(e)).toList();
      update();
    } else if (response.statusCode == 403) {
      Get.to(login());
    }
  }

  Future<void> getAllCompanies() async {
    token = pref.getString("token") ?? "";
    final response = await http.get(Uri.parse(companiesUrl), headers: {
      "Content-Type": "application/json",
      "authrization": "tljyt" + token
    });
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      companiesList = list.map((e) => Company.fromJson(e)).toList();
      update();
    } else if (response.statusCode == 403) {
      Get.to(login());
    }
  }

  Future<void> getAllProducts() async {
    token = pref.getString("token") ?? "";
    final response = await http.get(Uri.parse(productsUrl),
        headers: {
      "Content-Type": "application/json",
      "authrization": "tljyt" + token
    });
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      productList = list.map((e) => Product.fromJson(e)).toList();
      update();
    } else if (response.statusCode == 403) {
      Get.to(login());
    }
  }




  Product? getProductById( int id){
    late Product product;
    for(int i=0;i<productList.length;i++){
      if(productList[i].id==id){
        product=productList[i];
        return product;
      }
    }
    return null;
  }
}
