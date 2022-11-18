import 'package:excle_data/Home/home_screen.dart';
import 'package:excle_data/conroller/data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchDonortId = TextEditingController();

  TextEditingController postCode = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? donorId;

  String? postCodeString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Search DonorId",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: searchDonortId,
                  onChanged: (value) {
                    donorId = value.toString();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter DonorId";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Enter DonorID",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: postCode,
                  onChanged: (value) {
                    postCodeString = value.toString();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter PostCode";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Enter PostCode",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(
                      () => HomeScreen(
                          postCode: postCodeString.toString(),
                          donorId: donorId.toString()),
                    );
                    print(searchDonortId.text.trim());
                    print(donorId.toString());
                  }
                  ;
                },
                child: Container(
                  height: Get.height * 0.07,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
