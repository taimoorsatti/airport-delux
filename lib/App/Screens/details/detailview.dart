import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Screens/details/detailsViewModel.dart';
import 'package:airport_deluxe/App/Screens/editpolyline/PolyLineModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Helpers/common/viiticons_icons.dart';
import '../Widge/date_time_dialog.dart';
import '../Widge/ets_appbar.dart';
import '../Widge/fab_button_widget.dart';
import '../Widge/flat_Button_Widget.dart';
import '../Widge/payment_option.dart';
import '../Widge/promo_box_widget.dart';
import '../where_to/where_to_viewmodel.dart';

class DetailsScreenView extends StatelessWidget {
  String pickText;
  String dropText;
  Data carModel;
  WhereToViewModel Whereviewmodel;

  DetailsScreenView(
      {this.carModel, this.dropText, this.pickText, this.Whereviewmodel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DetailsViewModel(),
        builder: (DetailsViewModel viewModel) {
          return SafeArea(
            child: Scaffold(
                body: ListView(
                  children: [
                    Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: ViitAppBarIconWidget(
                        viitAppBarIconType: ViitAppBarIconTypes.BACK,
                        bgColor: kPrimaryColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      child: Text(
                        "Ride details",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: kLoginBlack,
                              fontSize: MediaQuery.of(context).size.width * 0.06,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //Get.to(AddCard());
                      },
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        margin: EdgeInsets.only(left: 0.sp, right: 0.sp, top: 0.sp),
                        child: Padding(
                          padding:  EdgeInsets.only(top: 4.0.sp),
                          child: Card(
                            //color: index==_selectedIndex?Colors.black12:Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  // border color
                                  color: Colors.white,
                                  // border thickness
                                  width: 0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            shadowColor: Colors.black,
                            elevation: 0,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left: 20.0.sp, right: 20.sp, top: 5.sp, bottom: 5.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width: Get.width / 2.5,
                                      child: Center(
                                          child: Text(
                                        pickText,
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                                  Icon(
                                    Viiticons.next_arrow,
                                    color: kPrimaryColor,
                                    size: 10.h,
                                  ),
                                  Container(
                                      width: Get.width / 2.5,
                                      child: Center(
                                          child: Text(
                                        dropText,
                                        overflow: TextOverflow.ellipsis,
                                      ))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //Get.to(AddCard());
                      },
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        margin: EdgeInsets.only(left: 0.sp, right: 0.sp, top: 0.sp),
                        child: Card(
                          //color: index==_selectedIndex?Colors.black12:Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                // border color
                                color: Colors.white,
                                // border thickness
                                width: 0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.black,
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0.sp, right: 8.0, top: 8.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: carModel.vehicleImage == ""
                                          ? Center(
                                              child: Container(
                                                  child: Image.asset(
                                              "assets/transparent.gif",
                                              height: 50,
                                              width: 50,
                                            )))
                                          : Image.network(carModel.vehicleImage,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: Get.width * 0.3,
                                          child: Text(
                                            carModel.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.black54,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                            ),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Text(
                                              carModel.passengers,
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(right: 0),
                                            child: Icon(Icons.currency_pound)),
                                        Text(
                                          carModel.onewayrate,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.luggage,
                                          color: Colors.black54,
                                          size: MediaQuery.of(context).size.width *
                                              0.06,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(carModel.luggage,
                                            style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DateTimeDialog(
                                viewmodel: Whereviewmodel,
                                onClick: "pick",
                              );
                            });
                      },
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        margin: EdgeInsets.only(left: 0.sp, right: 0.sp, top: 0.sp),
                        child: Card(
                          //color: index==_selectedIndex?Colors.black12:Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                // border color
                                color: Colors.white,
                                // border thickness
                                width: 0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.black,
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.all(20.0.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Pickup Time",
                                    ),
                                    Text(
                                      "23 sep 2023",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                FABButton(
                                    myHeight: 40.h,
                                    myWidth: 40.w,
                                    icon: Icon(
                                      Viiticons.next_arrow,
                                      color: kPrimaryColor,
                                      size: 15.h,
                                    ),
                                    onTap: () {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => PersionalPaymentMethodScreen());
                      },
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        margin: EdgeInsets.only(left: 0.sp, right: 0.sp, top: 0.sp),
                        child: Card(
                          //color: index==_selectedIndex?Colors.black12:Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                // border color
                                color: Colors.white,
                                // border thickness
                                width: 0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          shadowColor: Colors.black,
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.all(20.0.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Payment method"),
                                    Text(
                                      "cash",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Viiticons.payment,
                                  color: kPrimaryColor,
                                  size: 30.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PromoBoxWidget(
                                titleText: "Any additional info?",
                                secondaryBtnTxt: "Cancel",
                                primaryBtnTxt: "add",
                                //controller: viewmodel.additionalInfoController,
                                onPrimaryTap: () {
                                  // viewmodel.setAdditionalInfo(
                                  //     viewmodel.additionalInfoController.text);
                                  Navigator.of(context).pop();
                                },
                                onSecondaryTap: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                      },
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        margin: EdgeInsets.only(left: 0.sp, right: 0.sp, top: 0.sp),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Card(
                            //color: index==_selectedIndex?Colors.black12:Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  // border color
                                  color: Colors.white,
                                  // border thickness
                                  width: 0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            shadowColor: Colors.black,
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(20.0.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Notes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  FABButton(
                                      myHeight: 40.h,
                                      myWidth: 40.w,
                                      icon: Icon(
                                        Viiticons.next_arrow,
                                        color: kPrimaryColor,
                                        size: 15.h,
                                      ),
                                      onTap: () {}),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 26,
                        right: 26,
                        bottom: 10,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButtonWidget(
                              btnColor: kAccentColor,
                              btnTxt: "Confirm",
                              height: MediaQuery.of(context).size.height * 0.06,
                              btnOnTap: () async {
                                //  viewmodel.sendMail();
                                // viewmodel.fetchCarModel();
                                //Get.to(MyHomePage());
                                //viewmodel.booking();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
              ],
            ),
                  ],
                )),
          );
        });
  }
}
