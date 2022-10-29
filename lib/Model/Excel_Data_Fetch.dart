// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.donorNo,
    required this.name,
    required this.address,
    required this.postCode,
    this.gross,
    this.commission,
    this.vat,
    this.net,
    this.giftAid,
  });

  dynamic donorNo;
  dynamic name;
  dynamic address;
  dynamic postCode;
  dynamic gross;
  dynamic commission;
  dynamic vat;
  dynamic net;
  dynamic giftAid;

  factory DataModel.fromJson(Map<dynamic, dynamic> json) => DataModel(
    donorNo: json["DonorNo"],
    name: json["Name"],
    address: json["Address"],
    postCode: json["Postcode"],
    gross: json["Gross"],
    commission: json["Commission"],
    vat: json["Vat"],
    net: json["Net"],
    giftAid: json["Gift_Aid"],
  );

  Map<String, dynamic> toJson() => {
    "DonorNo": donorNo,
    "Name": name,
    "Address": address,
    "Postcode": postCode,
    "Gross": gross,
    "Commission": commission,
    "Vat": vat,
    "Net": net,
    "Gift_Aid": giftAid,
  };
}
