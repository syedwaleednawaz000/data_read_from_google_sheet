import 'dart:convert';

import 'package:excle_data/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/Excel_Data_Fetch.dart';

class DataController extends GetxController {
  // @override
  // void onInit() async {
  //   print("call onInit");  // this line not printing
  //   // checkIsLogin();
  //   // print("ww");
  //   super.onInit();
  // }
  List<DataModel> getData = [];

  Future<List<DataModel>> fetchExcelDataFetch() async {
    AppConstant.flutterToast(message: "Data Loading..");
    final response = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyIgcRX_yCdhLAVAuG8g4ImLvG0thUaFKl-kxMw74SgBFWhjhrrngD0QiHfpmjbNCQ6/exec"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      getData.clear();
      print("API Hit");
      for (Map i in data) {
        getData.add(DataModel.fromJson(i));
      }
      AppConstant.flutterToast(message: "Data Loaded");
      update();
      return getData;
    } else {
      AppConstant.flutterToast(message: "Data Not Loaded some issue");
      return getData;
      // update();
    }
    // update();
  }
}
