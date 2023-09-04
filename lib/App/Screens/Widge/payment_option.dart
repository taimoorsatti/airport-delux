import 'dart:io';

import 'package:airport_deluxe/App/Helpers/global.dart';

import 'package:airport_deluxe/App/Screens/Widge/payment_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';

import '../../Helpers/common/my_colors.dart';
import '../../Helpers/common/viiticons_icons.dart';
import '../editpolyline/PolyLineViewModel.dart';
import '../payment/add_card_screen.dart';
import 'ets_appbar.dart';
import 'flat_Button_Widget.dart';
import 'new_card_screen.dart';



class PaymentOptionScreen extends StatefulWidget {
  static const String routeName = "paymentoption";

  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return PaymentOption();
  }
}

class PaymentOption extends StatefulWidget {
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  var personalSelect = true;
  var businessSelect = false;

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
          titleWidget: ViitTitleWidget("Payment Method"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 21),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 45,
                  width: MediaQuery.of(context)
                      .size
                      .width, // this will give you fle
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.5),
                      border: Border.all(
                        width: 1,
                        color: Color(0xffF3AA05),
                      )), // xible width not fixed width
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  personalSelect = true;
                                  businessSelect = false;
                                });
                              });
                              print(personalSelect);
                              print(businessSelect);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(4.5),
                                      bottomLeft: const Radius.circular(4.5),
                                    ),
                                    color: personalSelect
                                        ? Color(0xffF3AA05)
                                        : Colors.white),
                                alignment: Alignment.topCenter,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        size: 24,
                                        color: personalSelect
                                            ? Colors.white
                                            : kLoginBlack,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Personal',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: personalSelect
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      //varaible above
                                    ],
                                  ),
                                )),
                          )),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                personalSelect = false;
                                businessSelect = true;
                              });
                            },
                            child: Container(
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: const Radius.circular(4.5),
                                      bottomRight: const Radius.circular(4.5),
                                    ),
                                    color: businessSelect
                                        ? Color(0xffF3AA05)
                                        : Colors.white),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Viiticons.work,
                                        size: 20,
                                        color: businessSelect
                                            ? Colors.white
                                            : kLoginBlack,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text('Business',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: businessSelect
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500)),
                                      //varaible above
                                    ],
                                  ),
                                )),
                          )),
                    ],
                  ),
                ),
                     PersionalPaymentMethodScreen()

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersionalPaymentMethodScreen extends StatefulWidget {
  @override
  _PersionalPaymentMethodScreenState createState() =>
      _PersionalPaymentMethodScreenState();
}

class _PersionalPaymentMethodScreenState
    extends State<PersionalPaymentMethodScreen> {
  final PolyLineViewModel controller = Get.put(PolyLineViewModel());
  var isSelected=1;
  var selectIndex=0;
  String os = Platform.operatingSystem;

  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    paymentItems: const [
      PaymentItem(
        label: 'Item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Item B',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Total',
        amount: '0.02',
        status: PaymentItemStatus.final_price,
      )
    ],
    style: ApplePayButtonStyle.black,
    width: double.infinity,
    height: 50,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    paymentItems: const [
      PaymentItem(
        label: 'Total',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      )
    ],
    type: GooglePayButtonType.pay,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );







  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            PaymentMethodsWidget(
              isImage: false,
              icon: Viiticons.cash,
              radioTxt: "Cash",
              myOnTap: (val) {
                setState(() {
                 // print(index);//isSelected = index + 1;
                });
                // Navigator.pop(context);
              },
              radiovalue: 1,
              isSelected: isSelected,
              onTapMasterCard: () {
                setState(() {
                  //selectIndex = 2;
                });
              },
              oTapVisa: () {
                setState(() {
                  //selectIndex = 1;
                });

              },
              selectIndex: selectIndex,
              opacity:1,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Platform.isIOS ? applePayButton : googlePayButton,
            ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 21),
          child: InkWell(
            onTap: (){},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Add Payment Method",
                  style: Theme.of(context).textTheme.caption.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}






class PaymentMethodsWidget extends StatelessWidget {
  final int radiovalue;
  final bool isImage;
  IconData icon;
  String assetImage;
  final String radioTxt;
  final int isSelected;
  final Function myOnTap;
  final Function oTapVisa;
  final Function onTapMasterCard;
  final int selectIndex;
  final double opacity;

  PaymentMethodsWidget({
    Key key,
    this.isSelected,
    this.isImage = false,
    this.icon,
    this.assetImage,
    this.radioTxt,
    this.radiovalue,
    this.myOnTap,
    this.oTapVisa,
    this.onTapMasterCard,
    this.opacity,
    this.selectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Opacity(
            opacity:opacity,
            child: Card(
              color: Color(0XFFEDEBEB),
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, right: 10, bottom: 15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              isImage
                                  ? Image.asset(
                                assetImage,
                                height: 32,
                                width: 32,
                              )
                                  : Icon(
                                icon,
                                color: Colors.black,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                radioTxt,
                                style:
                                Theme.of(context).textTheme.caption.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: kLoginBlack,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),

                          Transform.scale(
                            scale: 1.3,
                            child: Radio(
                              activeColor: kPrimaryColor,
                              value: radiovalue,
                              groupValue: isSelected,
                              onChanged: myOnTap,
                            ),
                          )
                        ],
                      ),
                      // isSelected == 2 && radiovalue == 2
                      //     ? Padding(
                      //   padding: const EdgeInsets.only(left: 8),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: <Widget>[
                      //       SizedBox(
                      //         height: 30,
                      //       ),
                      //       GestureDetector(
                      //         onTap: oTapVisa,
                      //         child: Container(
                      //           child: Column(
                      //             crossAxisAlignment:
                      //             CrossAxisAlignment.start,
                      //             children: <Widget>[
                      //               Icon(
                      //                 Viiticons.visa_card,
                      //                 color: kTextLoginfaceid,
                      //               ),
                      //               SizedBox(
                      //                 height: 4,
                      //               ),
                      //               Row(
                      //                 crossAxisAlignment:
                      //                 CrossAxisAlignment.start,
                      //                 children: <Widget>[
                      //                   Text(
                      //                     "**** **** **** 5967",
                      //                     style: Theme.of(context)
                      //                         .textTheme
                      //                         .caption
                      //                         .copyWith(
                      //                         color: kTextLoginfaceid,
                      //                         fontWeight:
                      //                         FontWeight.w600,
                      //                         fontSize: 14),
                      //                   )
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 15,
                      //               ),
                      //               selectIndex == 1
                      //                   ? Container(
                      //                 width: MediaQuery.of(context)
                      //                     .size
                      //                     .width,
                      //                 child: Row(
                      //                   crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //                   children: <Widget>[
                      //                     Expanded(
                      //                       flex: 5,
                      //                       child: Container(
                      //                         padding:
                      //                         const EdgeInsets
                      //                             .only(left: 15),
                      //                         margin: const EdgeInsets
                      //                             .only(right: 10),
                      //                         height: 48,
                      //                         width: 120,
                      //                         decoration:
                      //                         BoxDecoration(
                      //                           color: Colors.white,
                      //                           borderRadius:
                      //                           BorderRadius
                      //                               .circular(10),
                      //                         ),
                      //                         child: TextField(
                      //                           decoration:
                      //                           InputDecoration(
                      //                             focusColor:
                      //                             Colors.green,
                      //                             border: InputBorder
                      //                                 .none,
                      //                             hintText:
                      //                             "Enter CVV",
                      //                             hintStyle: Theme.of(
                      //                                 context)
                      //                                 .textTheme
                      //                                 .caption
                      //                                 .copyWith(
                      //                                 fontWeight:
                      //                                 FontWeight
                      //                                     .w600,
                      //                                 fontSize:
                      //                                 15,
                      //                                 color: Colors
                      //                                     .black45),
                      //                             fillColor:
                      //                             Colors.red,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Expanded(
                      //                       flex: 4,
                      //                       child: Container(
                      //                         height: 48,
                      //                         child: FlatButtonWidget(
                      //                           btnOnTap: () {},
                      //                           btnTxt: "Done",
                      //                           btnColor:
                      //                           kPrimaryColor,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               )
                      //                   : SizedBox()
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Container(
                      //         height: 0.5,
                      //         width: MediaQuery.of(context).size.width - 90,
                      //         color: Colors.grey,
                      //         child: Row(),
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       GestureDetector(
                      //         onTap: onTapMasterCard,
                      //         child: Container(
                      //           child: Column(
                      //             crossAxisAlignment:
                      //             CrossAxisAlignment.start,
                      //             children: <Widget>[
                      //               Icon(
                      //                 Viiticons.master_card,
                      //                 color: kTextLoginfaceid,
                      //               ),
                      //               SizedBox(
                      //                 height: 4,
                      //               ),
                      //               Row(
                      //                 crossAxisAlignment:
                      //                 CrossAxisAlignment.start,
                      //                 children: <Widget>[
                      //                   Text(
                      //                     "**** **** **** 5967",
                      //                     style: Theme.of(context)
                      //                         .textTheme
                      //                         .caption
                      //                         .copyWith(
                      //                       color: kTextLoginfaceid,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 14,
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 height: 15,
                      //               ),
                      //               selectIndex == 2
                      //                   ? Container(
                      //                 width: MediaQuery.of(context)
                      //                     .size
                      //                     .width,
                      //                 child: Row(
                      //                   crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //                   children: <Widget>[
                      //                     Expanded(
                      //                       flex: 5,
                      //                       child: Container(
                      //                         padding:
                      //                         const EdgeInsets
                      //                             .only(left: 15),
                      //                         margin: const EdgeInsets
                      //                             .only(right: 10),
                      //                         height: 48,
                      //                         width: 120,
                      //                         decoration:
                      //                         BoxDecoration(
                      //                           color: Colors.white,
                      //                           borderRadius:
                      //                           BorderRadius
                      //                               .circular(10),
                      //                         ),
                      //                         child: TextField(
                      //                           decoration:
                      //                           InputDecoration(
                      //                             focusColor:
                      //                             Colors.green,
                      //                             border: InputBorder
                      //                                 .none,
                      //                             hintText:
                      //                             "Enter CVV",
                      //                             hintStyle: Theme.of(
                      //                                 context)
                      //                                 .textTheme
                      //                                 .caption
                      //                                 .copyWith(
                      //                                 fontWeight:
                      //                                 FontWeight
                      //                                     .w600,
                      //                                 fontSize:
                      //                                 15,
                      //                                 color: Colors
                      //                                     .black45),
                      //                             fillColor:
                      //                             Colors.red,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Expanded(
                      //                       flex: 4,
                      //                       child: Container(
                      //                         height: 48,
                      //                         child: FlatButtonWidget(
                      //                           btnOnTap: () {},
                      //                           btnTxt: "Done",
                      //                           btnColor:
                      //                           kPrimaryColor,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               )
                      //                   : SizedBox()
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                      //     : SizedBox(),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
