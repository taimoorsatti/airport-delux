
import 'package:flutter/material.dart';

import '../../../Helpers/common/my_colors.dart';
import '../../Widge/ets_appbar.dart';
import '../../Widge/flat_Button_Widget.dart';
import '../../Widge/square_TextFeild_Widget.dart';

class EditFavAddressScreen extends StatelessWidget {
  static const String routeName = "editfavaddress";

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
          titleWidget: ViitTitleWidget("Favourite Address"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Address Name",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              SquareTextFieldWidget(
                hintText: "Rue des Lacs",
                inputType: TextInputType.text,
                inputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Address",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 15,
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              SquareTextFieldWidget(
                hintText: "50, rue des Lacs, 83400 HYÈRES",
                inputType: TextInputType.text,
                inputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FlatButtonWidget(
                        height: 52,
                        btnTxt: "Save",
                        btnColor: kAccentColor,
                        btnOnTap: () {
                          print("");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
