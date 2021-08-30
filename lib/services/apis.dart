import 'dart:convert';
import 'package:beetleware_task/const.dart';
import 'package:beetleware_task/model/login_model.dart';
import 'package:beetleware_task/model/itemCount_model.dart';
import 'package:beetleware_task/model/profile_model.dart';
import 'package:beetleware_task/widgets/custom_alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Apis {
  Future<LoginModel> loginApi(BuildContext context, username, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    var body = {
      'username': username,
      'password': password,
    };
    http.Response respose =
        await http.post(Uri.http(url, '/api/auth'), body: body);
    if (respose.statusCode == 200) {
      EasyLoading.dismiss();
      var fetchData = LoginModel.fromJson(json.decode(respose.body));
      prefs.setString('sharedData', fetchData.data.authorization);
      Navigator.pushNamed(context, "pageHome");
      return fetchData;
    } else {
      EasyLoading.dismiss();
      showMyDialog(context);
    }
    return LoginModel();
  }

  Future<ItemModel> solidItemApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(Uri.http(url, '/api/sold-items'),
        headers: {'Authorization': 'Bearer ${prefs.get('sharedData')}'});

    if (response.statusCode == 200) {
      var fetchData = ItemModel.fromJson(json.decode(response.body));
      return fetchData;
    }
    return ItemModel();
  }

  Future<ItemModel> productItemApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(Uri.http(url, '/api/products'),
        headers: {'Authorization': 'Bearer ${prefs.get('sharedData')}'});

    if (response.statusCode == 200) {
      var fetchData = ItemModel.fromJson(json.decode(response.body));
      return fetchData;
    }
    return ItemModel();
  }

  Future<ProfileModel> profileApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.get(Uri.http(url, '/api/profile-show'),
        headers: {'Authorization': 'Bearer ${prefs.get('sharedData')}'});

    if (response.statusCode == 200) {
      var fetchData = ProfileModel.fromJson(json.decode(response.body));
      return fetchData;
    }
    return ProfileModel();
  }
}
