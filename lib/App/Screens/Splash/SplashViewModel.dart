import 'dart:async';

import 'package:get/get.dart';


class SplashViewModel extends GetxController{
  SplashViewModel(){
    splashtimer();

  }
   splashtimer() async{

    //Timer(Duration(seconds: 3),()=>Get.to());

    update();
  }
}