import 'dart:convert';

import 'package:ghcmobile/models/commom_model.dart';
import 'package:ghcmobile/models/responce.dart';
import 'package:http/http.dart' as http;
import 'package:ghcmobile/models/globals.dart' as globals;

class AdminService {
  Future<List<UserMesseageList>> fetchUserMessageList(
      {int count = 1, String query = ""}) async {
    var url = globals.SERVICE_URL +
        "Account/UserMessageList?UserId=" +
        globals.userId.toString();
    //    "&&start=" +
    // count.toString();
    if (query != null && query != "") {
      url += "&&q=" + query;
    }
    print(url);
    var serviceUrl = Uri.parse(url);
    var response = await http.get(serviceUrl, headers: {
      "Content-Type": "application/json",
      "API_KEY": globals.apiKey
    });
    print("${response.body}");

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponce = json.decode(response.body);
      if (mapResponce["status"] == true) {
        final users = mapResponce["data"].cast<Map<String, dynamic>>();
        print("users list===");
        print(users);
        List<UserMesseageList> listOfItem = users.map<UserMesseageList>((json) {
          return UserMesseageList.fromJson(json);
        }).toList();
        return listOfItem;
      } else {
        print(mapResponce["Message"]);
        return [];
      }
    } else {
      return [];
      // throw Exception('Failed to load internet');
    }
  }

  Future<ResponceModel> createUserMessage(int userId, String message) async {
    // print("call maintenance Api:$maintenance");
    var url = Uri.parse(globals.SERVICE_URL + "Account/UserMessage");
    var data = {
      'SenderId': globals.userId,
      'Message': message,
    };
    print("API_Key: ${globals.apiKey}");
    var body = json.encode(data);
    print("$body");
    print("$url");
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

  Future<ResponceModel> messageDelete(int userId) async {
    var url = globals.SERVICE_URL +
        "Admin/UserMessageListDelete?UserId=" +
        userId.toString();
    // var data = {
    //   'email':email,
    //   'Password':password,
    // };
    // //encode Map to JSON
    // var body = json.encode(data);
    print("$url");
    print("${globals.apiKey}");
    var response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "API_Key": globals.apiKey,
    });
    print("${response.statusCode}");
    print("${response.body}");
    return postFromJson(response.body);
  }
}
