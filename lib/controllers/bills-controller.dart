import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store2024/constants.dart';

import '../models/auth/bills.dart';
class BillsController extends GetxController{
  late SharedPreferences pref;
  List<Bills>billsLis=[];
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    pref=await SharedPreferences.getInstance();
    getALlBills();
  }

  Future<void> getALlBills() async {
    String token=pref.getString('token')!;
    final response= await http.post(Uri.parse(getAllBillsUrl),
      headers: {"Content-Type": "application/json",
        "authrization": "tljyt" + token},
      body: jsonEncode({
        "username":pref.getString("username")??"0000"
      })

    );
    if(response.statusCode==200){
      List<dynamic>list=jsonDecode(response.body)['results'];
      billsLis=list.map((e) => Bills.fromJson(e)).toList();
      update();
    }
    else{

    }
  }
}


