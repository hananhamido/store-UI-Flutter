import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import '../controllers/home-controller.dart';
class ButtomBarShared extends StatelessWidget {
  HomeController homeController;
  ButtomBarShared({required this.homeController ,super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_)=>BottomNavigationBar(
      backgroundColor: Colors.purple[200],
      selectedItemColor: Colors.purpleAccent,
      selectedLabelStyle: TextStyle(color: Colors.white),
      currentIndex: homeController.currentIndex,
      onTap: (index){
        homeController.setCurrentIndex(index);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'home',backgroundColor: Colors.purple),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.white,),label: 'cart',backgroundColor: Colors.purple),
        BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.white,),label: 'favorite',backgroundColor: Colors.purple),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,color: Colors.white,),label: 'order',backgroundColor: Colors.purple),
      ],

    ),);
  }
}
