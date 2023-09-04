import 'dart:io';


import 'package:flutter/services.dart';

import '../../Helpers/ImportFile.dart';
import '../Widge/onboard_widget.dart';




class OnBoardScreen extends StatelessWidget {
  static const String routeName = "/onbord";
  //final getIt = GetIt.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return OnBoard();
  }
}


class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentPageValue;
  var images = ["assets/google.png", "assets/india.png", "assets/facebook.png"];

  @override
  void initState() {
    super.initState();
    print("OnBoard(): init");
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, //Android
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("OnBoard(): didChangeDependencies");
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: SafeArea(
        child: OnboardWidget(
          onTapImageIndex: 0,
          images: const [
            "assets/onboarding_0.png",
            "assets/onboarding_1.png",
            "assets/onboarding_2.png",
          ],
          titles: const [
            "Request ride",
            "Confirm your driver",
            "Track your ride"
          ],
          subtitles: const [
            "Request a ride get picked up by a nearby community driver.",
            "Huge drivers network helps you find comfortable, safe and cheap ride.",
            "Know your driver in advance and be able to view current location in real time on the map."
          ],

        ),
      ),
    );
  }



  Widget buildInitialState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorState(errorMsg) {
    return Container();
  }
}
