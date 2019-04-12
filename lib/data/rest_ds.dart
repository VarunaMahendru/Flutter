import 'dart:async';
import 'package:enterprise_app/utility/network_util.dart';
import 'package:enterprise_app/modals/acessToken.dart';
import 'package:enterprise_app/utility/constants.dart';
import 'dart:convert';




class RestDataSource{


  NetworkUtil _networkUtil = NetworkUtil.internal();
  static final BASE_URL= ProjectConstants.BASIC_URL;
  static final loginUrl = "oauth/token";
  static final finalUrl = BASE_URL+loginUrl;
  static final basicToken = ProjectConstants.basicToken;

  Map<String, String> requestHeaders = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': '$basicToken',
};


  Future<AccessToken> login(String username, String password) async {

    Map<String, String> bodyData = {
      'grant_type': 'password',
      'username': '$username',
      'password': '$password'
    };

    return _networkUtil.post(finalUrl, headers: {"Content-Type":"application/x-www-form-urlencoded", "Authorization":"Basic c2RrX2FuZHJvaWRfZmxlZXQ6JDVhJDc4JGl1am9pdWpYaUlTVVp3ci9LaUlVOTBlMzNUaW9JS2lvaUlySW1yT3hUSFZHV3VTc3dHdVc5"}, body:
       // return _networkUtil.post(finalUrl, headers: {"Content-Type":"application/x-www-form-urlencoded", "Authorization":"Basic d2ViX2NsaWVudDokNGEkNTQkaXVqb2l1alhpSE9ORHdyL0tpSVU5MGUzM1Rpb0lLaW9pSXJJbXJPeFRIVkdXdVNzd0d1Vzk="}, body:

        {
          "grant_type": "password",
          "username": username,
          "password": ProjectConstants.mD5(password)

    }).then((dynamic res) async {

      print("LoginResponse: "+res.toString());
      var accesstoken = res['accessToken'];
      print("accessTOken"+accesstoken.toString());
      final   parsed = json.decode(res.toString()) as Map<String, dynamic>;
      final accessToken = AccessToken.fromJson(parsed);

     // if (res["error"]) throw new Exception(res["error_msg"]);
      return await accessToken;
    });
  }



}