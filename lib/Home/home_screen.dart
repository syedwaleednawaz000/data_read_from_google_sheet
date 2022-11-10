
import 'package:excle_data/Home/web_view.dart';
import 'package:excle_data/conroller/data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/app_constant.dart';

class HomeScreen extends StatefulWidget {
  String donorId;
  String postCode;

  HomeScreen({required this.postCode,required this.donorId, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController cntrl = Get.put(DataController());
  bool limit = false;
  @override
  void initState() {

    // TODO: implement initState
    cntrl.fetchExcelDataFetch();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("donor id "+widget.donorId.toString());
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GetBuilder<DataController>(builder: (controller){
                  return controller.getData.length != 0 ? ListView.builder(

                      itemCount:  controller.getData.length,
                      itemBuilder: (ctx, index) {
                        AppConstant.flutterToastError(message: "Data Successfully Loaded");
                         // controller.getData[index].donorNo.toString().contains('12')
                        return controller.getData[index].donorNo.toString().toUpperCase() == widget.donorId.toString().toUpperCase() && controller.getData[index].postCode.toString().toUpperCase() == widget.postCode.toString().toUpperCase()   ? Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.13),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: Get.width*0.7,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("image/logoexcel.jpeg",),
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: Get.height * 0.05),
                            const Text(
                              "GIFT AID SCHEME",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            const Text(
                              "DONOR ID",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              controller.getData[index].donorNo.toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.06),
                            const Text(
                              "amount achieved through sale",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "£ ${controller.getData[index].gross}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            const Text(
                              "Gidt Aid Claimed",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Text(
                              "£ ${controller.getData[index].giftAid}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.06),
                            const Text(
                              "Make Donation",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            GestureDetector(
                              onTap: () {
                                AppConstant.urlCreator(paymentUrl: Uri.parse('https://www.farplace.org.uk/how-to-help/donations/'));
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10)),
                                width: Get.width * 0.3,
                                child: const Center(
                                  child: Text(
                                    "Donate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              "Visit the website",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            GestureDetector(
                              onTap: () async {
                                Get.to(()=> WebViewExample());
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10)),
                                width: Get.width * 0.3,
                                child: const Center(
                                  child: Text(
                                    "Farplace",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ) :  index ==1  ? Center(
                          child: Container(
                              height: Get.height*0.3,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text("DonorID or PostCode have been not matched",))),
                        ) : Container();
                      }
                      //Todo:
                  ):  Center(child: Column(
                    children: const [
                      CircularProgressIndicator(
                        backgroundColor: Colors.yellow,
                        color: Colors.black,
                      ),
                      SizedBox(height: 5,),
                      Text("Data Not Found"),
                    ],
                  ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
