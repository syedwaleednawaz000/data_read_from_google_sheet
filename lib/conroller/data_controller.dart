import 'dart:convert';

import 'package:excle_data/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/Excel_Data_Fetch.dart';

class DataController extends GetxController {
  // static var limit = false.obs;
  // static var listLenght = true.obs;
  List<DataModel> getData = [];

  Future<List<DataModel>> fetchExcelDataFetch() async {
    AppConstant.flutterToastError(message: "Data Loading..");
    final response = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbzbkQyTn4MkhyIHCV3SE26LEQqMNQq4597wcc9rhuYTDnOi7vRaEB5h7hvRe0Dmp8zcZw/exec"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      getData.clear();
      print("API Hit");
      for (Map i in data) {
        getData.add(DataModel.fromJson(i));
      }
      // if(getData.length != 0){
      //   listLenght = true.obs;
      //   update();
      //   print('value if the limit true ${getData.length.toString()}');
      // }else{
      //   listLenght = false.obs;
      //   update();
      //   print('value if the limit false ${getData.length.toString()}');
      // }
      AppConstant.flutterToastError(message: "Data Loaded");
      update();
      return getData;
    } else {
      AppConstant.flutterToastError(message: "Data Not Loaded some issue");
      return getData;
      // update();
    }
    // update();
  }
}
