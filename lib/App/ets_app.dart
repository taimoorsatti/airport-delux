


import 'package:airport_deluxe/App/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Helpers/common/my_const.dart';
import 'Helpers/common/my_theme.dart';
import 'Screens/onborading/onborading_screen.dart';





class EtsApp extends StatelessWidget {
 // const EtsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 800),
        builder: (context, child) {

     return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: kAppThemeData,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
        routes: {
          '/': (context) => OnBoardScreen(),
        },


      );
  });
  }

}
