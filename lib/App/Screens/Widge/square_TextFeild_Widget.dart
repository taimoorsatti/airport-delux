import 'package:date_format/date_format.dart';
import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_screen.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SquareTextFieldWidget extends StatefulWidget {
  final double myHeight;
  TextEditingController myController;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;
  final Function(String) onChanged;
  final Function(String) onSubmited;
  final AutovalidateMode autoValidateMode;
  final Function ontap;
  final Function(String) validator;
 final WhereToViewModel viewmodel;
  final int index;
  final bool anable;
  final Icon suffixIcon;

  SquareTextFieldWidget(
      {Key key,
      this.myHeight,
      this.myController,
      this.myMargin = const EdgeInsets.all(0),
      this.hintText,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.done,
      this.onChanged,
      this.onSubmited,
      this.ontap,
      this.viewmodel,
      this.anable,
        this.autoValidateMode,
      this.suffixIcon,
        this.validator,
      this.index})
      : super(key: key);

  @override
  State<SquareTextFieldWidget> createState() => _SquareTextFieldWidgetState();
}

class _SquareTextFieldWidgetState extends State<SquareTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 0,
        ),
        margin: widget.myMargin,
        width: Get.width-30,
        height: widget.myHeight,
        decoration: BoxDecoration(
          color: Color(0XFFF2F2F4),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Opacity(
          opacity: 0.64,
          child: TextFormField(
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: kLoginBlack,
                ),

            controller: widget.myController,
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            enabled: widget.anable,
            decoration: InputDecoration(
              focusColor: Colors.green,
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black45,
                  ),
              fillColor: Colors.red,
            ),
            autovalidateMode: widget.autoValidateMode,
            onChanged: widget.onChanged,
            validator:widget.validator,
          ),
        ),
      ),
    );
  }
}

class SquareTextFieldWidgetStop extends StatefulWidget {
  final double myHeight;
  TextEditingController myController;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;
  final Function(String) onChanged;
  final Function(String) onSubmited;
  final Function ontap;
  WhereToViewModel viewmodel;
  final int index;
  final bool anable;
  final Icon suffixIcon;

  SquareTextFieldWidgetStop(
      {Key key,
      this.myHeight = 48,
      this.myController,
      this.myMargin = const EdgeInsets.all(0),
      this.hintText,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.done,
      this.onChanged,
      this.onSubmited,
      this.ontap,
      this.viewmodel,
      this.anable,
      this.suffixIcon,
      this.index})
      : super(key: key);

  @override
  State<SquareTextFieldWidgetStop> createState() =>
      _SquareTextFieldWidgetStopState();
}

class _SquareTextFieldWidgetStopState extends State<SquareTextFieldWidgetStop> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 0,
        ),
        margin: widget.myMargin,
        height: widget.myHeight,
        decoration: BoxDecoration(
          color: Color(0XFFF2F2F4),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Opacity(
          opacity: 0.64,
          child: TextField(
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: kLoginBlack,
                ),
            controller: widget.myController,
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            enabled: widget.anable,
            decoration: InputDecoration(
              focusColor: Colors.green,
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black45,
                  ),
              fillColor: Colors.red,
              suffixIcon: InkWell(
                child: widget.suffixIcon != null
                    ? widget.suffixIcon
                    : SizedBox(
                        width: 0,
                      ),
                onTap: () {
                  setState(() {
                    widget.myController.text = " ";
                  });
                },
              ),
            ),
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
