import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store2024/controllers/bills-controller.dart';
class BillsList extends StatelessWidget {
  BillsList({super.key});
final BillsController billsController=Get.put(BillsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BillsController>(builder: (_)=>ListView.builder(
          itemCount: billsController.billsLis.length,
          itemBuilder:(context,i){
            return Container(
              child: Column(
                children: [
                  Text('${billsController.billsLis[i].id}'),
                  Text('${billsController.billsLis[i].total}')
                ],
              ),
            );
          } ),)
    );

  }
}
