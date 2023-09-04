
import 'package:flutter/material.dart';

import '../../Helpers/common/my_colors.dart';
import '../Widge/ets_appbar.dart';
import '../Widge/flat_Button_Widget.dart';
import '../Widge/password_TextField_Widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = "changepassword";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget("Change Password"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: <Widget>[
              PasswordFormField(
                hintText: "Enter Old Password",
              ),
              PasswordFormField(
                hintText: "Enter New Password",
              ),
              PasswordFormField(
                hintText: "Enter Confirm Password",
              ),
              FlatButtonWidget(
                btnTxt: "Submit",
                btnColor: kAccentColor,
                btnOnTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
