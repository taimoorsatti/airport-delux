import 'dart:collection';

import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Screens/Widge/date_time_dialog.dart';
import 'package:airport_deluxe/App/Screens/Widge/ets_appbar.dart';
import 'package:airport_deluxe/App/Screens/Widge/flat_Button_Widget.dart';
import 'package:airport_deluxe/App/Screens/Widge/recent_address_item_list.dart';
import 'package:airport_deluxe/App/Screens/practice.dart';
import 'package:airport_deluxe/App/Screens/where_to/Components/passengers_luggage%20screen.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import "dart:math" as math;

import '../../Helpers/global.dart';
import '../../Helpers/global.dart';
import '../../Helpers/global.dart';
import '../editpolyline/PolylineView.dart';
import 'Components/shimmerLoading.dart';

class WhereToScreen extends StatefulWidget {
  static const String routeName = "whereto";
  final WhereToScreenArguments arguments;
  final String address;

  WhereToScreen({
    this.arguments,
    this.address,
  });

  @override
  _WhereToScreenState createState() => _WhereToScreenState();
}

class _WhereToScreenState extends State<WhereToScreen> {
  @override
  void initState() {
    super.initState();
    ontap = "drop";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("WhereTo() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("WhereTo() dispose");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: WhereToViewModel(textAddress: widget.address),
        builder: (WhereToViewModel viewModel) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Scaffold(
                    body: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            //Top container
                            Container(
                              color: kPrimaryColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: ViitAppBarIconWidget(
                                      viitAppBarIconType:
                                          ViitAppBarIconTypes.BACK,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 0),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          //child:MyForm(),
                                          child: Column(
                                            children: [
                                              MyForm(viewModel: viewModel),
                                              // Container(
                                              //   width: MediaQuery.of(context)
                                              //       .size
                                              //       .width,
                                              //   decoration: const BoxDecoration(
                                              //     color: Colors.white,
                                              //     borderRadius: BorderRadius.only(
                                              //         bottomLeft:
                                              //             Radius.circular(10),
                                              //         bottomRight:
                                              //             Radius.circular(10)),
                                              //   ),
                                              //   child: Row(
                                              //     mainAxisAlignment:
                                              //         MainAxisAlignment
                                              //             .spaceAround,
                                              //     children: [
                                              //       PassengerReturnDateScreen(
                                              //         icon: Icons
                                              //             .watch_later_outlined,
                                              //         iconcolor: Colors.black,
                                              //         text: viewModel.pickText ==
                                              //                 ""
                                              //             ? "pick"
                                              //             : viewModel.pickText,
                                              //         bcolor: Colors.black,
                                              //         width:
                                              //             constraints.minWidth *
                                              //                 0.25,
                                              //         size: 24,
                                              //         textcolor:
                                              //             viewModel.pickText == ""
                                              //                 ? Colors.black45
                                              //                 : Colors.black,
                                              //         constraints: constraints,
                                              //         minwidth:
                                              //             MediaQuery.of(context)
                                              //                     .size
                                              //                     .width /
                                              //                 2.3,
                                              //         onPressed: () {
                                              //           SelectDate = "pick";
                                              //           showDialog(
                                              //               context: context,
                                              //               builder: (BuildContext
                                              //                   context) {
                                              //                 return DateTimeDialog(
                                              //                   viewmodel:
                                              //                       viewModel,
                                              //                   onClick:
                                              //                       SelectDate,
                                              //                 );
                                              //               });
                                              //         },
                                              //       ),
                                              //       PassengerReturnDateScreen(
                                              //         icon:
                                              //             viewModel.returnText !=
                                              //                     ""
                                              //                 ? Icons.close
                                              //                 : Icons.u_turn_left,
                                              //         iconcolor:
                                              //             viewModel.pickText == ""
                                              //                 ? Colors.black45
                                              //                 : Colors.black,
                                              //         text: viewModel
                                              //                     .returnText ==
                                              //                 ""
                                              //             ? "return"
                                              //             : viewModel.returnText,
                                              //         textcolor:
                                              //             viewModel.returnText ==
                                              //                     ""
                                              //                 ? Colors.black45
                                              //                 : Colors.black,
                                              //         width: viewModel
                                              //                     .returnText ==
                                              //                 ""
                                              //             ? 60
                                              //             : constraints.minWidth *
                                              //                 0.25,
                                              //         minwidth: viewModel
                                              //                     .returnText ==
                                              //                 ""
                                              //             ? 120
                                              //             : MediaQuery.of(context)
                                              //                     .size
                                              //                     .width /
                                              //                 2.3,
                                              //         bcolor: kAccentColor,
                                              //         onPressed: () {
                                              //           if (viewModel.pickText !=
                                              //               "") {
                                              //             SelectDate = "return";
                                              //             showDialog(
                                              //                 context: context,
                                              //                 builder:
                                              //                     (BuildContext
                                              //                         context) {
                                              //                   return DateTimeDialog(
                                              //                     viewmodel:
                                              //                         viewModel,
                                              //                     onClick:
                                              //                         "return",
                                              //                   );
                                              //                 });
                                              //           }
                                              //         },
                                              //         iconOnPressed: () {
                                              //           setState(() {
                                              //             viewModel.returnText =
                                              //                 "";
                                              //           });
                                              //         },
                                              //       )
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        // Container(
                                        //   width:
                                        //       MediaQuery.of(context).size.width,
                                        //   decoration: const BoxDecoration(
                                        //     color: Color(0XFFF2F2F4),
                                        //     borderRadius: BorderRadius.only(
                                        //         bottomLeft: Radius.circular(10),
                                        //         bottomRight: Radius.circular(10)),
                                        //   ),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       PassengerLuggageScreen(
                                        //         height: 60,
                                        //         icon: Icons.person,
                                        //         iconcolor: kPrimaryColor,
                                        //         text: "1 Passenger",
                                        //         bcolor: kAccentColor,
                                        //         size: 24,
                                        //         textcolor: Colors.black54,
                                        //         onPressed: () {},
                                        //       ),
                                        //       Container(
                                        //         width: 1,
                                        //         height: 40,
                                        //         color: Colors.black45,
                                        //       ),
                                        //       PassengerLuggageScreen(
                                        //         height: 60,
                                        //         icon: Icons.luggage,
                                        //         iconcolor: kPrimaryColor,
                                        //         text: "No Luggage",
                                        //         textcolor: Colors.black45,
                                        //         bcolor: kAccentColor,
                                        //         size: 24,
                                        //         onPressed: () {},
                                        //       )
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            viewModel.isLoding
                                ? LoadingListPage()
                                : viewModel.currentstate ==
                                        LocationState
                                            .SHOW_SAVE_PLACES_FORM_STATE
                                    ? saveplace(viewModel)
                                    : Search_location(viewModel),
                          ],
                        ),
                        viewModel.pickupController.text == "" ||
                                viewModel.dropoffController.text == ""
                            ? Container()
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    left: 26,
                                    right: 26,
                                    bottom: 16,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: FlatButtonWidget(
                                          btnColor: kAccentColor,
                                          btnTxt: "Next",
                                          btnOnTap: () async {
                                            // if (viewModel.pickDate == "" &&
                                            //     viewModel.pickTime == "") {
                                            //   Get.snackbar("Message",
                                            //       "Please Select Pickup Date and Time",colorText: Colors.black,backgroundColor: Colors.white);
                                            // }
                                            //else {
                                            viewModel.pickupController.text ==
                                                    pickval
                                                ? viewModel.pickupController.text =
                                                    myaddress
                                                : viewModel.dropoffController.text ==
                                                        dropval
                                                    ? Fluttertoast.showToast(
                                                        msg:
                                                            "please Enter correct destination address")
                                                    : viewModel.pickupController
                                                            .text.isEmpty
                                                        ? Fluttertoast.showToast(
                                                            msg:
                                                                "pickup address is Empty")
                                                        : viewModel
                                                                .dropoffController
                                                                .text
                                                                .isEmpty
                                                            ? Fluttertoast.showToast(
                                                                msg:
                                                                    "destination address is Empty")
                                                            : viewModel.pickupController
                                                                        .text ==
                                                                    viewModel
                                                                        .dropoffController
                                                                        .text
                                                                ? Fluttertoast
                                                                    .showToast(
                                                                    msg:
                                                                        "pickup and dropoff address are same",
                                                                  )
                                                                : viewModel
                                                                    .obtainPlaceDirectionDetail(
                                                                        LatLng(clat, clng),
                                                                        LatLng(dlat, dlng))
                                                                    .whenComplete(() {
                                                                    Get.to(
                                                                        EditPolylineScreen(
                                                                      dropofflat:
                                                                          dlat,
                                                                      totalDistance:
                                                                          viewModel
                                                                              .distance,
                                                                      dropofflng:
                                                                          dlng,
                                                                      onclick:
                                                                          "without",
                                                                      pickHour: viewModel
                                                                          .selectedTime
                                                                          .hourOfPeriod,
                                                                      pickAddress: viewModel
                                                                              .pickMainText
                                                                              .isNotEmpty
                                                                          ? viewModel
                                                                              .pickMainText
                                                                          : "My Location",
                                                                      dropAddress:
                                                                          viewModel
                                                                              .dropMainText,
                                                                      mainviewModel:
                                                                          viewModel,
                                                                    ));
                                                                  });
                                            viewModel.calculateDistance(
                                                clat, clng, dlat, dlng);
                                            viewModel
                                                .obtainPlaceDirectionDetail(
                                                    LatLng(clat, clng),
                                                    LatLng(dlat, dlng));

                                            //}
                                          },
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  Widget saveplace(WhereToViewModel viewModel) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: viewModel.listNearLocation.length == 0
            ? LoadingListPage()
            : Stack(
                children: [
                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 21, vertical: 8),
                      //   child: RecentAddressItemList(
                      //     addressTitle: "Recent Places",
                      //     myBackgrounColor: kGrey,
                      //     myIcon: Viiticons.star,
                      //     iconsize: 18,
                      //     myIconColor: kTextLoginfaceid,
                      //     address: "",
                      //     onTap: () {},
                      //   ),
                      // ),

                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.listNearLocation.length,
                          itemBuilder: (context, index) => Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 21, vertical: 8),
                                  child: RecentAddressItemList(
                                    addressTitle: index == 0
                                        ? "Nearest Places"
                                        : viewModel
                                            .listNearLocation[index].name,
                                    myBackgrounColor: kGrey,
                                    myIcon: index == 0
                                        ? Viiticons.star
                                        : Viiticons.history,
                                    iconsize: 18,
                                    myIconColor: kTextLoginfaceid,
                                    address: index == 0
                                        ? ""
                                        : viewModel
                                            .listNearLocation[index].vicinity,
                                    onTap: () {
                                      ontap == "pick"
                                          ? viewModel.pickupController.text =
                                              viewModel
                                                  .listNearLocation[index].name
                                          : ontap == "drop"
                                              ? viewModel
                                                      .dropoffController.text =
                                                  viewModel
                                                      .listNearLocation[index]
                                                      .name
                                              : "";
                                    },
                                  ),
                                ),
                              ),
                              index == 0
                                  ? Container(
                                      height: 5,
                                      margin: const EdgeInsets.only(
                                        top: 6,
                                        left: 0,
                                        right: 0,
                                        bottom: 6,
                                      ),
                                      color: kGrey,
                                    )
                                  : Container(
                                      height: 0.5,
                                      margin: const EdgeInsets.only(
                                        top: 6,
                                        left: 62,
                                        right: 16,
                                        bottom: 6,
                                      ),
                                      color: kGrey,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget Search_location(WhereToViewModel viewModel) {
    return viewModel.model.value.predictions.isEmpty
        ? Expanded(
            child: Center(
                child: Container(
                    child: Image.asset(
            "assets/transparent.gif",
            height: 50,
            width: 50,
          ))))
        : Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 4),
                child: viewModel.model.value.predictions.length == 0
                    ? Center(
                        child: Image.asset(
                        "assets/transparent.gif",
                        height: 50,
                        width: 50,
                      ))
                    : Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.model.value.predictions.length,
                          itemBuilder: (context, index) => Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 21, vertical: 8),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          ontap == "pick"
                                              ? viewModel
                                                      .pickupController.text =
                                                  viewModel
                                                      .model
                                                      .value
                                                      .predictions[index]
                                                      .description
                                              : ontap == "drop"
                                                  ? viewModel.dropoffController
                                                          .text =
                                                      viewModel
                                                          .model
                                                          .value
                                                          .predictions[index]
                                                          .description
                                                  : "";
                                          ontap == "pick"
                                              ? viewModel.pickMainText =
                                                  viewModel
                                                      .model
                                                      .value
                                                      .predictions[index]
                                                      .structuredFormatting
                                                      .mainText
                                              : ontap == "drop"
                                                  ? viewModel.dropMainText =
                                                      viewModel
                                                          .model
                                                          .value
                                                          .predictions[index]
                                                          .structuredFormatting
                                                          .mainText
                                                  : "";
                                          viewModel.getDetils(viewModel
                                              .model
                                              .value
                                              .predictions[index]
                                              .placeId);

                                          viewModel.savedPlace(
                                              viewModel.model.value
                                                  .predictions[index].placeId,
                                              viewModel
                                                  .model
                                                  .value
                                                  .predictions[index]
                                                  .structuredFormatting
                                                  .mainText,
                                              viewModel
                                                  .model
                                                  .value
                                                  .predictions[index]
                                                  .structuredFormatting
                                                  .secondaryText);
                                          viewModel.currentstate = LocationState
                                              .SHOW_SAVE_PLACES_FORM_STATE;

                                          // Get.to(polylineview(
                                          //   dropofflat: detailresult.geometry.location.lat,
                                          //   dropofflng: detailresult.geometry.location.lng,
                                          // ));
                                        });
                                      },
                                      child: RecentAddressItemList(
                                        addressTitle: viewModel
                                            .model
                                            .value
                                            .predictions[index]
                                            .structuredFormatting
                                            .mainText,
                                        myBackgrounColor: kGrey,
                                        myIcon: Icons.place_outlined,
                                        iconsize: 24,
                                        myIconColor: kTextLoginfaceid,
                                        address: viewModel.model.value
                                            .predictions[index].description,
                                      )),
                                ),
                              ),
                              Container(
                                height: 0.5,
                                margin: const EdgeInsets.only(
                                  top: 6,
                                  left: 62,
                                  right: 16,
                                  bottom: 6,
                                ),
                                color: kGrey,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          );
  }
}

enum LocationState {
  SHOW_SAVE_PLACES_FORM_STATE,
  SHOW_PREDUCTION_PLACES_FORM_STATE,
}

class WhereToScreenArguments {}
