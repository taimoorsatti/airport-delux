import 'package:airport_deluxe/App/Screens/Widge/square_TextFeild_Widget.dart';
import 'package:flutter/material.dart';

import '../../Helpers/common/my_colors.dart';
import '../DrawPolyline/PolyLineViewModel.dart';
import '../editpolyline/PolyLineViewModel.dart';
import 'flat_Button_Widget.dart';
import 'multiline_textfield_widget.dart';

class PromoBoxWidget extends StatelessWidget {
  final String titleText;
  final String primaryBtnTxt;
  final String secondaryBtnTxt;
  final VoidCallback onPrimaryTap;
  final VoidCallback onSecondaryTap;
  final PolyLineViewModel viewModel;
  final TextEditingController controller;



  PromoBoxWidget({
    Key key,
    @required this.titleText,
    @required this.primaryBtnTxt,
    @required this.secondaryBtnTxt,
    @required this.onPrimaryTap,
    @required this.onSecondaryTap,
    @required this.viewModel,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 0,
              ),
              child: Text(
                titleText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: kBlack,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 21,
              ),
              child: MultilineTextField(hintText: "Type here",mycontroler: controller,),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 12,
              ),
              child: FlatButtonWidget(
                btnColor: kAccentColor,
                btnTxt: primaryBtnTxt,
                btnOnTap: onPrimaryTap,
                height: 44,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18,
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: onSecondaryTap,
                child: Center(
                  child: Text(
                    secondaryBtnTxt,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: kAccentColor,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
