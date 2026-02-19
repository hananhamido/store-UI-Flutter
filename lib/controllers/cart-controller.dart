import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../layouts/auth/login.dart';
import '../models/auth/product.dart';
import 'main-controller.dart';
import 'package:get/get.dart';
class CartController extends GetxController
{
  List<String>cartList=[];
  List<Product> productList = [];
  int indexOfProducts=0;
  int amount=1;
  String token = "";
  double total=0;
late SharedPreferences pref;
@override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    print("ready");
    pref = await SharedPreferences.getInstance();
    token = pref.getString("token") ?? "";
    getAllProducts();
  }
@override
  Future<void> onClose() async {
    // TODO: implement onClose
    super.onClose();
    print("close");
    pref = await SharedPreferences.getInstance();
    token = pref.getString("token") ?? "";
    getAllProducts();
  }
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("init");
    pref = await SharedPreferences.getInstance();
    token = pref.getString("token") ?? "";
    getAllProducts();
  }

  void getCart() {

    cartList=pref.getStringList('cart')??[];
    update();

  }

 void getTotal()
  {
  total=0;
  for(int i=0;i<cartList.length;i++)
  {
    int id=int.parse(cartList[i].split(",").first);
    Product product=getProductById(id)!;
    int amount=int.parse(cartList[i].split(",").last);
    total=total+double.parse(product.price!)*amount;
  }
  update();
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
      getCart();

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

  Future<void> deletItem(int i)
  async {
    cartList.removeAt(i);
   await pref.setStringList('cart', cartList);
    getTotal();
  }

  void addToCart(int? id) {
  bool found=false;
  for(int i=0;i<cartList.length;i++){
    if(int.parse(cartList[i].split(",").first)==id){
      found=true;
      break;
    }
  }
  if(!found){
    cartList.add('${id},$amount');
    pref.setStringList('cart', cartList);
    Get.snackbar('done', 'message');
    getTotal();
  }
  else{
    Get.snackbar('موجود مسبقا', 'message');
  }
  }

  void incAmount({int index=-1}) {
  if(index==-1)
    {
      amount++;
      update();
    }
  else{
    int amount_=int.parse(cartList[index].split(",").last);
    amount_++;
    String id=cartList[index].split(",").first;
    cartList[index]="$id,$amount_";
    pref.setStringList('cart', cartList);
    getTotal();

  }
  }

  void decAmount({int index=-1}) {
    if(index==-1)
    {
      amount--;
      update();
    }
    else{
      int amount_=int.parse(cartList[index].split(",").last);
      amount_--;
      String id=cartList[index].split(",").first;
      cartList[index]="$id,$amount_";
      pref.setStringList('cart', cartList);
      getTotal();

    }

  }
}