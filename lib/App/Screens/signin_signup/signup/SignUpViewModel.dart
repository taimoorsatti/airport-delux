import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../Helpers/Shared_Pref_helper.dart';
import 'package:http/http.dart' as http;
import '../../../NetworkService/ApiHandle.dart';
import 'SignUpModel.dart';

class SignUpViewModel extends GetxController {
  GlobalKey<FormState> signUp1FormKey = GlobalKey<FormState>();
  signUPModel model = signUPModel();

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpaswwordcontroller = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  String countryCode = "+92";
  getUserId currentUserId = getUserId();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    phonenumbercontroller.dispose();
    dobcontroller..dispose();
    emailcontroller..dispose();
    passwordcontroller..dispose();
    confirmpaswwordcontroller.dispose();
    whatsAppController.dispose();
    //Loader.loader.value = false;
  }

  String validateDefaultTextField(String value) {
    if (GetUtils.isBlank(value)) {
      return "Field required";
    } else {
      return null;
    }
  }

  Future RegistrationUser() async {
    try {
      String Url =
          "https://connectcars.taxi/connect-car/apis/userSignup.php?emailAddress=${emailcontroller.text}&firstName=${firstnamecontroller.text}&SurName=${lastnamecontroller.text}&mobileNumber=${phonenumbercontroller.text}&guestWhatsapp=${whatsAppController.text}";
      var res = await http.post(Uri.parse(Url));
      if (res.statusCode == 200) {
        print(res.body);
        var data = json.decode(res.body);
        model = signUPModel.fromJson(data);
        SharedPrefrence().setUserId(model.id).toString();
        Fluttertoast.showToast(msg: "${model.message}");
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  Future GetCurrentUserId() async {
    dynamic response = await SharedPrefrence().getUserId();
    print(response);
  }

  String checkNumber(String v) {
    if (v[0] == '0') {
      v = v.substring(3, v.length);
      print(v);
    }
    print(v);
    v = '+92' + v;
    Pattern pattern = r"^(\+92)(3)([0-9]{9})$";
    RegExp regex = new RegExp(pattern.toString());
    if (v.trim().isEmpty) {
      return "Please enter number";
    }
    if (!regex.hasMatch(v)) {
      return "Please enter a valid number";
    }
    return 'null';
  }
}
