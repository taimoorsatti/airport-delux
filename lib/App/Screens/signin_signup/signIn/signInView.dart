// ignore: file_names
// ignore_for_file: file_names

import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Screens/SelectRide/selectRidevView.dart';
import 'package:airport_deluxe/App/Screens/signin_signup/signIn/signInViewModel.dart';
import 'package:airport_deluxe/App/Screens/signin_signup/signup/SignUpView.dart';
import 'package:airport_deluxe/App/Screens/Widge/WavyHeader_Widget.dart';
import 'package:airport_deluxe/App/Screens/Widge/country_Selection_TextField.dart';
import 'package:airport_deluxe/App/Screens/Widge/fab_button_widget.dart';
import 'package:airport_deluxe/App/Screens/Widge/password_TextField_Widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Helpers/AppThem.dart';
import '../../Widge/country_selection_textfield_widget.dart';
import '../../Widge/square_TextFeild_Widget.dart';
import '../../bottomSheetPractive.dart';

class SignInView extends StatefulWidget {
  @override
  static const String routeName="login";
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  AppThems appthems= AppThems();
  final _formKey = GlobalKey<FormState>();





  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignInViewModel(),
      builder: (SignInViewModel ViewModel){
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
          child: Form(
            key:_formKey,
            child: SafeArea(
              child: Scaffold(

                body:ViewModel.connectionStatus.name=="none"?Center(child: Text("Inernet Connection Failed")) :ListView(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         // SignInLogo(),
                           WavyHeaderScreen(),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 30.sp, right: 30.sp),
                            child: Text(
                              "Sign In",
                              style: Theme.of(context).textTheme.headline1.copyWith(
                                color:  kLoginBlack,
                                fontSize:20.sp,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 46, right: 46),
                      //   child: SquareTextFieldWidget(
                      //     myController: ViewModel.emailController,
                      //    // myFocusNode: viewmodel.mobileNode,
                      //     hintText: "Enter Email",
                      //     inputAction: TextInputAction.next,
                      //     inputType: TextInputType.text,
                      //     autoValidateMode:AutovalidateMode.onUserInteraction,
                      //     onSubmited: (str) {
                      //      // _fieldFocusChange(context, viewmodel.mobileNode, viewmodel.passwordNode);
                      //     },
                      //     // validator: (v){
                      //     //   return ViewModel.validateEmail(v);
                      //     //
                      //     // },
                      //   ),
                      // ),
                          Padding(
                            padding:  EdgeInsets.only(left: 30.sp, right: 30.sp),
                            child: SquareTextFieldWidget(
                              myController: ViewModel.emailController,
                              hintText: "Email Address",
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            // CountrySelectionTextField(
                            //   myController: ViewModel.mobilController,
                            //   myFocusNode: ViewModel.mobileNode,
                            //   hintText: "Enter mobile number",
                            //   inputAction: TextInputAction.next,
                            //   inputType: TextInputType.number,
                            //   onSubmited: (str) {
                            //     _fieldFocusChange(context, ViewModel.mobileNode, ViewModel.passwordNode);
                            //   },
                            // ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                            child: PasswordFormField(
                              // myFocusNode: viewmodel.passwordNode,
                               myController: ViewModel.passwordController,
                              hintText: "Password",
                              inputAction: TextInputAction.done,
                              onSubmited: (str) {
                                // if (viewmodel.passwordNode.hasFocus) {
                                //   viewmodel.passwordNode.unfocus();
                                // }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 30.sp, right: 30.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:  EdgeInsets.only(
                                    top: 4.sp,
                                    left: 8.sp,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigator.of(context).pushNamed(
                                      //   ForgotPasswordScreen.routeName,
                                      // );
                                      /*loginBloc.add(
                          ForgotPassEvent(),
                        );*/
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: Theme.of(context).textTheme.caption.copyWith(
                                        color: kLoginBlack,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                                FABButton(
                                  bgColor: kAccentColor,
                                  onTap: () {
                                   // ViewModel.payment();
                                   Get.to(SelectRideScreen());
                                  // if (_formKey.currentState.validate()) {
                                  //   _formKey.currentState.save();
                                  //   ViewModel.userLogin();
                                  //
                                  //
                                  // }
                                  //   Get.to(CheckBottomSheet());

                                  },
                                  icon: Icon(
                                    Viiticons.next_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 21,
                          ),

                          SizedBox(
                            height: 21,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                 // Navigator.of(context).pushNamed(SignupScreen.routeName);
                                  Get.to(SignupScreen());
                                  },
                                child: RichText(
                                  text: TextSpan(children: [
                                    /*Theme.of(context).textTheme.subhead.copyWith(
                        color: kLoginBlack,*/
                                    TextSpan(
                                      text: "Don't have an account? ",
                                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                                        color: kLoginBlack,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.18,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Sign Up",
                                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                                        color: kAccentColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),





                        ],),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
