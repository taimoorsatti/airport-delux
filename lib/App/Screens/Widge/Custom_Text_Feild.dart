import 'package:airport_deluxe/App/Helpers/AppThem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//<--------------------------------------------------->
//<-----------------REVIEWED---------------------->
//<--------------------------------------------------->
AppThems AppThem=AppThems();
class CustomButton8 extends StatelessWidget {
  final String text;
  final Color buttonTextColor;
  final Color buttonColor;
  final VoidCallback onPressed;

  CustomButton8(
      {
        this.text,
        this.buttonColor,
        this.buttonTextColor,
        this.onPressed}
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.0,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        onPressed: onPressed,
        color: buttonColor,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14,
              color: buttonTextColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class CustomTextField3 extends StatelessWidget {
  //v=0.4
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autoValidateMode;
  final bool obscureText;
  final GestureTapCallback onTap;
  final bool showCursor;
  final bool readOnly;
  final String errorText;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final int maxLength;
  final String hintText;
  final String title;
  final Color fillColor;
  final IconData suffixIcon;
  final IconData prefixIcon;
  final double prefixIconSize;
  final double suffixIconSize;

  //These cant be applied as it will disturb the textfield
  //final int maxLines;
  //final int minLines;

  CustomTextField3(
      {this.maxLength,
        this.hintText,
        this.focusNode,
        this.prefixIcon,
        this.validator,
        this.obscureText = false,
        this.autoValidateMode,
        this.title,
        this.controller,
        this.keyboardType,
        this.onTap,
        this.showCursor,
        this.readOnly = false,
        this.errorText,
        this.onChanged,
        this.suffixIcon,
        this.prefixIconSize = 18,
        this.suffixIconSize = 18,
        this.fillColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            color: Color(0xff3E515B),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: TextFormField(
            onChanged: onChanged,
            showCursor: showCursor,
            maxLength: maxLength,
            readOnly: readOnly,
            onTap: onTap,
            autovalidateMode: autoValidateMode,
            obscureText: obscureText,
            validator: validator,
            style: TextStyle(
                fontFamily: 'Roboto-Regular',
                color: Color(0xff3E515B),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              contentPadding: (suffixIcon == null)
                  ? EdgeInsets.only(top: 15, left: 7)
                  : EdgeInsets.only(top: 15),
              suffixIcon: (suffixIcon == null)
                  ? null
                  : Icon(
                suffixIcon,
                color: Colors.black,
                size: suffixIconSize,
              ),
              errorText: errorText,
              //isDense: true,
              fillColor: fillColor,
              filled: true,
              prefixIcon: (prefixIcon == null)
                  ? null
                  : Container(
                margin: EdgeInsets.fromLTRB(1, 1, 5, 1),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Color(0xffD1D4D7), width: 1),
                  ),
                ),
                child: Container(
                  width: 55,
                  decoration: BoxDecoration(
                    color: Color(0xffF8F9FB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  child: Icon(
                    prefixIcon,
                    color: Color(0xff3E515B),
                    size: prefixIconSize,
                  ),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(width: 0.8, color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Color(0xffD1D4D7),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  width: 0.8,
                  color:AppThem.primarycolor ,
                ),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}

class CustomTextField13 extends StatelessWidget {
  //v=0.1
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autoValidateMode;
  final bool obscureText;
  final GestureTapCallback onTap;
  final bool showCursor;
  final bool readOnly;
  final String errorText;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final int maxLength;
  final String hintText;
  final String title;
  final Color fillColor;
  final IconData suffixIcon;
  final IconData prefixIcon;
  final double prefixIconSize;
  final double suffixIconSize;
  final int maxLines;
  final int minLines;

  CustomTextField13(
      {this.maxLength,
        this.maxLines = 1,
        this.minLines,
        this.hintText,
        this.focusNode,
        this.prefixIcon,
        this.validator,
        this.obscureText = false,
        this.autoValidateMode,
        this.title,
        this.controller,
        this.keyboardType,
        this.onTap,
        this.showCursor,
        this.readOnly = false,
        this.errorText,
        this.onChanged,
        this.suffixIcon,
        this.prefixIconSize = 18,
        this.suffixIconSize = 18,
        this.fillColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            color: Color(0xff3E515B),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: TextFormField(
            onChanged: onChanged,
            maxLines: maxLines,
            minLines: minLines,
            showCursor: showCursor,
            maxLength: maxLength,
            readOnly: readOnly,
            onTap: onTap,
            autovalidateMode: autoValidateMode,
            obscureText: obscureText,
            validator: validator,
            style: TextStyle(
                fontFamily: 'Roboto-Regular',
                color: Color(0xff3E515B),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              contentPadding: (suffixIcon == null)
                  ? EdgeInsets.only(top: 15, left: 7)
                  : EdgeInsets.only(top: 15),
              suffixIcon: (suffixIcon == null)
                  ? null
                  : Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  suffixIcon,
                  color: Colors.black,
                  size: suffixIconSize,
                ),
              ),
              errorText: errorText,
              //isDense: true,
              fillColor: fillColor,
              filled: true,
              prefixIcon: (prefixIcon == null)
                  ? null
                  : Icon(
                prefixIcon,
                color: Color(0xff3E515B),
                size: prefixIconSize,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(width: 0.8, color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Color(0xffD1D4D7),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Color(0xff8B288E),
                ),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}

//<--------------------------------------------------->
//<-----------------NOT REVIEWED---------------------->
//<--------------------------------------------------->

class CustomTextField19 extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final AutovalidateMode autovalidateMode;
  final bool obscureText;
  final GestureTapCallback onTap;
  final bool showCursor;
  final bool readOnly;
  final String errorText;
  final ValueChanged<String> onChanged;
  final int maxLines;
  final int minLines;
  final FocusNode focusNode;
  final int maxLength;

  final Color fillColor;
  final String title;

  CustomTextField19(
      {this.validator,
        this.onTap,
        this.obscureText = false,
        this.autovalidateMode,
        this.title,
        this.controller,
        this.keyboardType,
        this.maxLines,
        this.minLines,
        this.showCursor,
        this.readOnly = false,
        this.errorText,
        this.focusNode,
        this.maxLength,
        this.onChanged,
        this.fillColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.bold,
            color: Color(0xff3E515B),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: TextFormField(
            onChanged: onChanged,
            maxLength: maxLength,
            focusNode: focusNode,
            onTap: onTap,
            showCursor: showCursor,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            autovalidateMode: autovalidateMode,
            obscureText: obscureText,
            validator: validator,
            style: TextStyle(
                fontFamily: 'Roboto-Regular',
                color: Color(0xff272727),
                fontSize: 14,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintMaxLines: 10,
              errorText: errorText,
              isDense: true,
              fillColor: (readOnly) ? Color(0xffD1D4D7) : fillColor,
              contentPadding: EdgeInsets.fromLTRB(15, 15, 6.5, 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: Color(0xffC4C4C4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Color(0xff8B288E),
                ),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}

class PhoneTextField extends StatelessWidget {

  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final bool showCursor;
  final bool readOnly;
  final ValueChanged<String> onChanged;
  final String title;

  PhoneTextField({
    this.validator,
    this.obscureText = false,
    this.autovalidateMode,
    this.controller,
    this.keyboardType,
    this.showCursor,
    this.readOnly = false,
    this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto-Regular',
            fontWeight: FontWeight.w600,
            color: Color(0xff3E515B),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: TextFormField(
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(13),
              PhoneNumberFormatter(),
            ],
            onChanged: onChanged,
            showCursor: showCursor,
            readOnly: readOnly,
            autovalidateMode: autovalidateMode,
            obscureText: obscureText,
            validator: validator,
            style: TextStyle(
                fontFamily: 'Roboto-Regular',
                color: Color(0xff3E515B),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              isDense: true,
              fillColor: (readOnly) ? Color(0xffD1D4D7) : Colors.white,
              filled: true,
              prefixIcon: Container(
                margin: EdgeInsets.fromLTRB(1, 1, 10, 1),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Color(0xffD1D4D7), width: 1),
                  ),
                ),
                child: Container(
                  width: 70,
                  decoration: BoxDecoration(
                    color: Color(0xffF8F9FB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image(
                          height: 25,
                          width: 25,
                          image:
                          AssetImage('Assets/AppImages/pakistan.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            '+92',
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xff272727),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(width: 0.8, color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: Color(0xffC4C4C4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  width: 0.8,
                  color:AppThem.primarycolor ,
                ),
              ),
            ),
            controller: controller,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (
        oldValue.text.length >= 13 &&
        newValue.text.length != oldValue.text.length) {
      return TextEditingValue(
        text: " ",
         selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (oldValue.text.length > newValue.text.length) {
      return TextEditingValue(
        text: newValue.text.toString(),
        selection: TextSelection.collapsed(offset: newValue.text.length),
      );
    }

    var newText = newValue.text;
    if (newText.length == 3) newText = newText + " - ";

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CustomTextField16 extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final int maxLines;
  final int minLines;
  final bool showCursor;
  final bool readOnly;
  final IconData suffixIcon;
  final ValueChanged<String> onChanged;

  CustomTextField16(
      {this.validator,
        this.obscureText = false,
        this.autovalidateMode,
        this.onChanged,
        this.controller,
        this.keyboardType,
        this.maxLines,
        this.minLines,
        this.showCursor,
        this.suffixIcon,
        this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: showCursor,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(
          fontFamily: 'Roboto-Regular',
          color: Color(0xff272727),
          fontSize: 16,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 20,
          color: Color(0xff3E3E3E),
        ),
        suffixIcon: (suffixIcon == null) ? null :IconButton(
          onPressed: (){
            print('asdsd');
          },
          icon: Icon(
            suffixIcon,
            size: 20,
            color: Color(0xff3E3E3E),
          ),
        ),
        hintText: 'Search messages',
        hintStyle: TextStyle(
            fontFamily: 'Roboto-Regular',
            color: Color(0xff656565),
            fontSize: 15,
            fontWeight: FontWeight.w400),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 0.8, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(
            width: 0.8,
            color:AppThem.primarycolor ,
          ),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType,
    );
  }
}

class CustomTextField15 extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final int maxLines;
  final int minLines;
  final bool showCursor;
  final bool readOnly;
  final String hintText;
  final GestureTapCallback onTap;

  CustomTextField15(
      {this.validator,
        this.hintText,
        this.onTap,
        this.obscureText = false,
        this.autovalidateMode,
        this.controller,
        this.keyboardType,
        this.maxLines,
        this.minLines,
        this.showCursor,
        this.readOnly = false});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        onTap: onTap,
        showCursor: showCursor,
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines,
        autovalidateMode: autovalidateMode,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(
            fontFamily: 'Roboto-Regular',
            color: Color(0xff272727),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: 'Roboto-Regular',
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(15, 12, 6.5, 12),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 0.8, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xffC4C4C4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              width: 0.8,
              color:AppThem.primarycolor ,
            ),
          ),
        ),
        controller: controller,
        keyboardType: keyboardType,
      ),
    );
  }
}
class MyTextFeild extends StatelessWidget {
  const MyTextFeild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: 40,
          color: Colors.black,
        ),
        TextFormField(
          //controller: viewmodel.dropController,
          style: TextStyle(
            //color: list[ind].color,
              color: Color(0xff2E353B),
              fontSize: 13,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(

            //border: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black38,),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black12,),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "PickUp location",
              hintStyle:TextStyle(fontSize: 13,color: Colors.black54),
              contentPadding: const EdgeInsets.only(left: 10,bottom: 10)
          ),
          validator: (v){
            if(v.trim().isEmpty) return 'Please enter something';
            return null;
          },


        ),
      ],
    );
  }
}


