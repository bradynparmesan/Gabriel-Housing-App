import 'dart:convert';

import 'package:ghcmobile/models/commom_model.dart';
import 'package:ghcmobile/models/responce.dart';

import 'package:http/http.dart' as http;
import 'package:ghcmobile/models/globals.dart' as globals;
import 'package:async/async.dart';

import 'dart:io';

class AccountService {
  Future<ResponceModel> userRegister(UserRegisterModel registerModel) async {
    // var url = "http://lf.appbeatsol.com:2182/api/Account/Register";
    var url = Uri.parse(globals.SERVICE_URL + "Account/Register");
    var data = {
      'FirstName': registerModel.firstName,
      'LastName': registerModel.lastName,
      'Email': registerModel.email,
      'Password': registerModel.password,
      'GhcMember': registerModel.ghcMember,
      'GhcTenant': registerModel.ghcTenant
    };
    //encode Map to JSON
    var body = json.encode(data);
    print("$body");
    print('$url');
    var responce = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${responce.statusCode}");
    print("${responce.body}");
    return postFromJson(responce.body);
  }

  Future<ResponceModel> userLogin(String email, String password) async {
    var url = Uri.parse(globals.SERVICE_URL + "Account/Login");
    var data = {'UserName': email, 'Password': password};

    var body = json.encode(data);
    print("$body");
    // AlertMessage().showMessages(data.toString());
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: body);
    print("${response.statusCode}");
    print("${response.body}");

    return postFromJson(response.body);
  }

  Future<ResponceModel> userApplyData(UserApply userApply) async {
    // print("call readySetting Api:$UserApplyData ");
    var url = Uri.parse(globals.SERVICE_URL + "Account/UserApply");
    var data = {
      'UserId': userApply.userId,
      'ApplyFor': userApply.applyFor,
      'FullLegalName': userApply.fullLegalName,
      'Email': userApply.email,
      'Address': userApply.city,
      'City': userApply.address,
      'PhoneNumber': userApply.phoneNumber,
      'HousingNeed': userApply.housingNeed,
      'PostalCode': userApply.postalCode,
      'NumberOfDependents': userApply.dependents,
      'Indigenonus': userApply.indigenonus,
    };
    print("API_Key: ${globals.apiKey}");

    //encode Map to JSON
    var body = json.encode(data);
    print("$body");
    print("$url");
    //  print("UserApplyData.userId=========${UserApplyData.userId}");

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "API_Key": globals.apiKey,
        },
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return postFromJson(response.body);
  }

  Future<ResponceModel> userMaintenance(
      File files, Maintenance maintenance) async {
    print("=======================================");
    print("call userMaintenance Api:$maintenance ");
    var url = Uri.parse(globals.SERVICE_URL + "Account/UserMaintenance");
    var request = new http.MultipartRequest("POST", url);
    if (files != null) {
      String filePath = files.path;
      File file = files;
      var paths = filePath.split('/');
      String fileName = paths[paths.length - 1];
      print('name:$fileName');
      print(file);
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      var multipartFile =
          new http.MultipartFile('file', stream, length, filename: fileName);
      request.files.add(multipartFile);
    }
    request.headers["Content-Type"] = "application/json";
    request.headers["API_KEY"] = globals.apiKey;
    request.fields['UserId'] = maintenance.userId.toString();
    request.fields['Address'] = maintenance.address.toString();
    request.fields['ProblemOfDescription'] = maintenance.description.toString();
    request.fields['ProblemPhoto'] = maintenance.problemofphoto.toString();
    request.fields['ContactInfo'] = maintenance.contact.toString();
    request.fields['SocialType'] = maintenance.socialtype.toString();
    var streamedResponse = await request.send();
    final response = await streamedResponse.stream.bytesToString();
    print(response);
    print(streamedResponse.statusCode);
    print(streamedResponse.reasonPhrase);
    print(streamedResponse.request);
    if (streamedResponse.statusCode == 200) {
      print("Uploaded");
      print('response.body' + response);
    }
    return postFromJson(response.toString());
  }
  // Future<ResponceModel> userMaintenance(Maintenance maintenance) async {
  //   print("call maintenance Api:$maintenance");
  //   var url = Uri.parse(globals.SERVICE_URL + "Account/UserMaintenance");
  //   var data = {
  //     'UserId': globals.userId,
  //     'Address': maintenance.address,
  //     'ProblemOfDescription': maintenance.description,
  //     'ProblemPhoto': maintenance.problemofphoto,
  //     'SocialType':maintenance.socialtype,
  //     'ContactInfo': maintenance.contact,
  //   };
  //   print("API_Key: ${globals.apiKey}");
  //   var body = json.encode(data);
  //   print("$body");
  //   print("$url");
  //   var response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "API_Key": globals.apiKey,
  //       },
  //       body: body);
  //   print("${response.statusCode}");
  //   print("${response.body}");

  //   return postFromJson(response.body);
  // }

}

class UserRegisterModel {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;

  final String password;
  final bool ghcMember;
  final bool ghcTenant;

  UserRegisterModel(
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.ghcMember,
    this.ghcTenant,
  );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Password": password,
        "GhcMember": ghcMember,
        "GhcTenant": ghcTenant
      };
}
