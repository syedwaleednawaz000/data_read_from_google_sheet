import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AppConstant{

  static Future<void> urlCreator({required var paymentUrl}) async {
    if (await launchUrl(paymentUrl)) {
      AppConstant.flutterToastSuccess(responseMessage: 'Url Successfully Loaded Wait');
      await launchUrl(paymentUrl);
    } else {
      AppConstant.flutterToastError(message: 'Url Not Loaded');
      throw 'Could not launch $paymentUrl';
    }
  }
  static void flutterToastSuccess({required String responseMessage}){
    Fluttertoast.showToast(
        msg: responseMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.yellow,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  static void flutterToastError({required String message}){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}