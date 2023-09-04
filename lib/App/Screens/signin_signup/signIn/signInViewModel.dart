import 'dart:async';
import 'dart:convert';
import 'dart:developer';

// import 'package:another_square/another_square.dart';
// import 'package:another_square/square_models.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart';
import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/NetworkService/ApiHandle.dart';
import 'package:airport_deluxe/App/Screens/SelectRide/selectRidevView.dart';
import 'package:airport_deluxe/App/Screens/signin_signup/signIn/signInModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';

import '../../../NetworkService/api.dart';

class SignInViewModel extends GetxController {
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode mobileNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  loginModel model = loginModel();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print(e);
      return;
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;
    update();
  }



  Future userLogin() async {
    try {
      // Map<dynamic, dynamic> _param = {
      //   "mobileNumber":"${mobilController.text}",
      //   "password":"${passwordController.text}",
      // };

      var url = Uri.parse(
          'https://etscars.co.uk/etscars/apis/userSignin.php?mobileNumber=123&password=123');
      var response = await http.post(
        url,
        // body:{
        //   "mobileNumber":"${mobilController.text}",
        //   "password":"${passwordController.text}",
        // }
      );

      if (response.statusCode == 200) {
        var message = jsonDecode(response.body);
        print(message);
        model = loginModel.fromJson(message);
        Fluttertoast.showToast(msg: "${model.message}");
        Get.to(SelectRideScreen());
        // if(!model.error) {
        //   Fluttertoast.showToast(msg: "${model.message}");
        //   Get.to(SelectRideScreen());
        // }
        //   else{
        //   Fluttertoast.showToast(msg: "${model.message}");
        // }
      } else {
        throw Exception("Failed to data");
      }
    } catch (e) {}
  }


}
