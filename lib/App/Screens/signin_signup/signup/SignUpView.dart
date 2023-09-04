

import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Screens/Widge/ets_appbar.dart';
import 'package:airport_deluxe/App/Screens/Widge/flat_Button_Widget.dart';
import 'package:airport_deluxe/App/Screens/Widge/password_TextField_Widget.dart';
import 'package:airport_deluxe/App/Screens/Widge/square_TextFeild_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widge/country_selection_textfield_widget.dart';
import 'SignUpViewModel.dart';


class SignupScreen extends StatelessWidget {
  static const String routeName = "signup";

  @override
  Widget build(BuildContext context) {
    return Signup();
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _isCheckedTerms = false;
  var selectGender;
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    print("Signup() initState");
  }

  @override
  Widget build(BuildContext context) {
    print("Signup() build");
    return GetBuilder(
      init:  SignUpViewModel(),
      builder: (SignUpViewModel viewmodel) {
        return SafeArea(
          child: Scaffold(
            appBar: ViitAppBar(
              leadingWidget: ViitAppBarIconWidget(
                viitAppBarIconType: ViitAppBarIconTypes.BACK,
              ),
              onLeadingPressed: () {
                Navigator.of(context).pop();
              },
              titleWidget: ViitTitleWidget("Sign Up"),
            ),
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                      ),
                      // Stack(
                      //   children: <Widget>[
                      //     Container(
                      //       height: 128,
                      //       width: 135,
                      //     ),
                      //     DottedBorder(
                      //       color: kDottedBorder,
                      //       borderType: BorderType.RRect,
                      //       radius: Radius.circular(120 / 2),
                      //       padding: EdgeInsets.all(6),
                      //       dashPattern: [8, 8],
                      //       strokeWidth: 1,
                      //       child: Container(
                      //         height: 100,
                      //         width: 100,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(100 / 2),
                      //         ),
                      //         child: const Center(
                      //           child: Icon(
                      //             Viiticons.profile_pic,
                      //             color: kDottedBorderFab,
                      //             size: 48,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       right: 10,
                      //       top: 15,
                      //       child: Container(
                      //         height: 40,
                      //         width: 40,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(40 / 2),
                      //           color: kDottedBorderFab,
                      //         ),
                      //         child: const Center(
                      //           child: Icon(
                      //             Viiticons.plus,
                      //             color: Colors.white,
                      //             size: 22,
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Opacity(
                      //   opacity: 0.64,
                      //   child: Text(
                      //     "Upload your photo",
                      //     style: Theme.of(context).textTheme.caption.copyWith(
                      //       color: kLoginBlack,
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      SquareTextFieldWidget(
                        myController: viewmodel.firstnamecontroller,
                        hintText: "Full name",
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // SquareTextFieldWidget(
                      //   myController: viewmodel.lastnamecontroller,
                      //   hintText: "Last Name",
                      //   inputAction: TextInputAction.next,
                      //   inputType: TextInputType.text,
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      CountrySelectionTextField(
                        myController: viewmodel.phonenumbercontroller,
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        hintText: "Enter mobile number",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // CountrySelectionTextField(
                      //   myController: viewmodel.whatsAppController,
                      //   inputType: TextInputType.number,
                      //   inputAction: TextInputAction.next,
                      //   hintText: "Enter WhatsApp number",
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      SquareTextFieldWidget(
                        myController: viewmodel.emailcontroller,
                        hintText: "Email Address",
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // DatePickerContainer(
                      //     selectDate: () => _selectDate(context),
                      //     date: selectedDate == null
                      //         ? "Date of Brith"
                      //         : "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}",
                      //     icon: Viiticons.calendar,
                      //     color: selectedDate == null
                      //         ? Colors.black45
                      //         : Colors.black),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      PasswordFormField(
                        myController: viewmodel.passwordcontroller,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // PasswordFormField(
                      //   myController: viewmodel.confirmpaswwordcontroller,
                      //   hintText: "Confirm password",
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: _isCheckedTerms,
                            activeColor: Colors.grey,
                            onChanged: (bool value) {
                              print(value);
                              setState(() {
                                _isCheckedTerms = value;
                              });
                            },
                            checkColor: Color(0xFFFFFFFF),
                            tristate: false,
                          ),
                          Container(
                            width: 230,
                            child: RichText(
                              //  overflow: TextOverflow.clip,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'I agree with ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Terms of Condition ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                      text: 'as well as ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                        fontSize: 16,
                                      )),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left:0,
                                right: 0,
                              ),
                              child: FlatButtonWidget (
                                height: 45,
                                btnOnTap: () {
                                  viewmodel.RegistrationUser();

                                },
                                btnTxt: "Sign Up",
                                btnColor: kAccentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 21,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }



  buildLoadingState() {
    return Container();
  }

  buildErrorState(errorMsg) {
    return Center(
      child: Icon(Icons.sync_problem),
    );
  }
}
