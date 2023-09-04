import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FlatButtonWidget extends StatelessWidget {
  final Color btnColor;
  final String btnTxt;
  final Function btnOnTap;
  double height;

  FlatButtonWidget({
    Key key,
    this.btnColor,
    @required this.btnTxt,
    this.btnOnTap,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
        color: btnColor,
        onPressed: btnOnTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 12,
          ),
          child: Text(
            btnTxt,
            style: Theme.of(context).textTheme.caption.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
