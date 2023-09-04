
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:flutter/material.dart';


class LanguageScreen extends StatelessWidget {
  static const String routeName = "/language";

  @override
  Widget build(BuildContext context) {
    return Language();

  }
}

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {

  @override
  void initState() {
    super.initState();
    print("Language(): init");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Language(): didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("Language(): build");

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
      children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 145,
            ),
            Text(
              "Select Language",
              style: Theme.of(context).textTheme.headline2.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/cloud_shape_bg.png",
          width: MediaQuery.of(context).size.width,
        ),
      ),
      ],
    ),
      ),
    );
  }


}
