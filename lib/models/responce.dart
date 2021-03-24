import 'dart:convert';

class ResponceModel {
  final String message;
  final bool status;
  final dynamic data;
  ResponceModel({this.message, this.status, this.data});
  factory ResponceModel.fromJson(Map<String, dynamic> json) =>
      new ResponceModel(
        data: json["data"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "Data": data,
      };
}

ResponceModel postFromJson(String str) {
  final jsonData = json.decode(str);
  return ResponceModel.fromJson(jsonData);
}
