
// ignore_for_file: file_names

import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:get/get.dart';

import 'SplashViewModel.dart';

class SplashView extends StatelessWidget {
  //const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:SplashViewModel() ,
      builder:(SplashViewModel viewModel){
        return Scaffold(

        body:Center(

          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,


            ),
            child: Center(
                child: Image.asset("Assets/AppImages/companylogo.png",width: 200,)
            ),
          ),
        ),



      );

      } ,
    );

  }
}
