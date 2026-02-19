import 'package:get/get.dart';
import 'package:store2024/layouts/products-view.dart';

import '../models/auth/product.dart';
class ProductViewController extends GetxController
{

  List<Product>showListProduct=[];
  String text='';
  void setText(String text){
    this.text=text;
  }
  void byCompany(List<Product>list,int companyId)
  {
    showListProduct=[];
    for(int i=0;i<list.length;i++){
      if(list[i].companyId==companyId){
        showListProduct.add(list[i]);

      }
    }
    Get.to(ProductView());
  }
  void byCategory(List<Product>list,int categoryId)
  {
    showListProduct=[];
    for(int i=0;i<list.length;i++){
      if(list[i].categoryId==categoryId){
        showListProduct.add(list[i]);

      }
    }
   Get.to(ProductView());
  }

}