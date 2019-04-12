import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method




class ProjectConstants{
  static const String BASIC_URL = "https://fleet.carot.com/api/rest/";
  static const String basicToken = "Basic c2RrX2FuZHJvaWRfZmxlZXQ6JDVhJDc4JGl1am9pdWpYaUlTVVp3ci9LaUlVOTBlMzNUaW9JS2lvaUlySW1yT3hUSFZHV3VTc3dHdVc5";



  static String mD5(String password){
    var bytes = utf8.encode(password); // data being hashed

    var digest = md5.convert(bytes);

      return "$digest";
  }


}