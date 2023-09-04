// ignore_for_file: file_names, missing_return, prefer_const_constructors


import 'package:airport_deluxe/App/Screens/details/detailview.dart';
import 'package:custom_info_window/custom_info_window.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../Helpers/common/my_colors.dart';
import '../../Helpers/common/viiticons_icons.dart';
import '../../Helpers/global.dart';
import '../DrawPolyline/Components/polyline_Shimmer.dart';
import '../Widge/flat_Button_Widget.dart';
import '../Widge/payment_option.dart';
import '../Widge/promo_box_widget.dart';
import '../payment_Method.dart';
import '../where_to/Components/shimmerLoading.dart';
import '../where_to/where_to_viewmodel.dart';
import 'PolyLineViewModel.dart';

// const double _maxHeight = 800;

class EditPolylineScreen extends StatefulWidget {
  double dropofflat;
  double dropofflng;
  String onclick;
  List<PolylineWayPoint> wayPointController = <PolylineWayPoint>[];
  String pickAddress;
  String dropAddress;
  int pickHour;
  double totalDistance;
  WhereToViewModel mainviewModel;

  EditPolylineScreen(
      {this.dropofflat,
      this.dropofflng,
      this.wayPointController,
      this.onclick,
      this.pickAddress,
      this.pickHour,
      this.totalDistance,
      this.mainviewModel,
      this.dropAddress});

  @override
  _EditPolylineScreenState createState() => _EditPolylineScreenState();
}

class _EditPolylineScreenState extends State<EditPolylineScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  LatLng startingLocation = LatLng(-2.142869, -79.923845);
  final currentLocation = TextEditingController();
  GoogleMapController _mapController;
  AnimationController _animationController;
  double currentHeight;
  double size;
  bool isScroll = false;


  @override
  void initState() {
    // getUserLocation();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onCreated(GoogleMapController mapController) {
    _mapController = mapController;
  }

  CameraPosition kInitialPosition =
      CameraPosition(target: LatLng(clat, clng), zoom: 18, tilt: 0, bearing: 0);
  bottomSheetState currentstate = bottomSheetState.expanded;

  Widget build(BuildContext context) {
    return GetBuilder(
      init: PolyLineViewModel(
          droplat: widget.dropofflat,
          droplng: widget.dropofflng,
          context: context,
          wayPointValue: widget.wayPointController,
          onclick: widget.onclick,
          hour: widget.pickHour,
          distanceTotal: widget.totalDistance,
          ViewModel: widget.mainviewModel),
      builder: (PolyLineViewModel viewmodel) {
        double minHeight = MediaQuery.of(context).size.height * 0.6;
        double maxHeight = MediaQuery.of(context).size.height * 0.9;
        currentHeight = minHeight;
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
          child: SafeArea(child: Scaffold(body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return viewmodel.isLoading
                  ? PolyLineShimerScreen(
                      constraints: constraints,
                    )
                  : Scaffold(
                      backgroundColor: Colors.white,
                      body: Stack(
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.4,
                            color: Color(0xffF6F6F6),
                            child: Stack(
                              children: [
                                GoogleMap(
                                  initialCameraPosition: kInitialPosition,
                                  myLocationEnabled: false,
                                  myLocationButtonEnabled: false,
                                  zoomControlsEnabled: false,
                                  tiltGesturesEnabled: true,
                                  compassEnabled: true,
                                  scrollGesturesEnabled: true,
                                  zoomGesturesEnabled: true,
                                  mapType: MapType.normal,
                                  markers: viewmodel.markerSet,
                                  circles: viewmodel.CircleSet,
                                  polylines: viewmodel.PolylineSet,
                                  onCameraMove: (position) {
                                    viewmodel.customInfoWindowControllerpick
                                        .onCameraMove();
                                    viewmodel.customInfoWindowControllerdrop
                                        .onCameraMove();
                                  },
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    viewmodel.controllerGoogleMap
                                        .complete(controller);
                                    viewmodel.onMapCreated(controller);
                                    viewmodel.customInfoWindowControllerpick
                                        .googleMapController = controller;
                                    viewmodel.customInfoWindowControllerdrop
                                        .googleMapController = controller;
                                    addWindowInf(
                                        LatLng(clat, clng),
                                        widget.pickAddress,
                                        viewmodel
                                            .customInfoWindowControllerpick,
                                        viewmodel);
                                    addWindowInf(
                                        LatLng(dlat, dlng),
                                        widget.dropAddress,
                                        viewmodel
                                            .customInfoWindowControllerdrop,
                                        viewmodel);
                                  },
                                ),
                                CustomInfoWindow(
                                  controller:
                                      viewmodel.customInfoWindowControllerpick,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: 200,
                                  offset:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                                CustomInfoWindow(
                                  controller:
                                      viewmodel.customInfoWindowControllerdrop,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width: 160,
                                  offset:
                                      MediaQuery.of(context).size.height * 0.04,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              child: PreviewChild(viewmodel, constraints,
                                  currentHeight, minHeight, maxHeight))
                        ],
                      ),
                    );
            },
          ))),
        );
      },
    );
  }

  Widget PreviewChild(PolyLineViewModel viewmodel, BoxConstraints constraints,
      double currentHeight, double minHeight, double maxHeight) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          final newHeight = currentHeight - details.delta.dy;
          _animationController.value = currentHeight / maxHeight;
          currentHeight = newHeight.clamp(0.0, maxHeight);
          isScroll = false;
        });
      },
      onVerticalDragEnd: (details) {
        if (currentHeight < maxHeight / 1.4) {
          setState(() {
            _animationController.reset();
            currentHeight = minHeight;
            isScroll = false;
          });
        } else {
          setState(() {
            _animationController.forward(from: currentHeight / maxHeight);
            currentHeight = maxHeight;
            isScroll = true;
          });
        }
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            final value = _animationController.value;
            return Stack(
              children: [
                Positioned(
                  height: lerpDouble(minHeight, maxHeight, value),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            //color of shadow
                            spreadRadius: 5,
                            //spread radius
                            blurRadius: 7,
                            // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8.sp),
                          width: 100,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              //Get.to(BottomSheetScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.all(12),
                              child: Text(
                                "Ride details",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      color: kLoginBlack,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06,

                                    ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: viewmodel.model.data.length == 0 &&
                                    viewmodel.model.data.length == null
                                ? LoadingListPage()
                                : ListView.builder(
                                    physics: isScroll
                                        ? PageScrollPhysics()
                                        : NeverScrollableScrollPhysics(),

                                    itemCount: viewmodel.listCarModel.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          //Get.to(AddCard());
                                          setState(() {
                                            viewmodel.listCarModel.insert(0,viewmodel
                                                .model
                                                .data[index]);
                                            viewmodel.listCarModel.removeAt(index+1);
                                            if (viewmodel.selectedIndex ==
                                                index) {
                                              viewmodel.selectedIndex = 0;
                                            } else {
                                              viewmodel.selectedIndex = index;
                                            }
                                            _animationController.reverse();
                                            currentHeight = 0.0;
                                            isScroll = false;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 12, right: 12, top: 0),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Card(
                                            //color: index==_selectedIndex?Colors.black12:Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side:index==0? BorderSide(
                                                  // border color
                                                    color:kAccentColor,
                                                    // border thickness
                                                    width: 2):BorderSide(
                                                  // border color
                                                    color:Colors.white,
                                                    // border thickness
                                                    width: 0),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            shadowColor: Colors.black,
                                            elevation: 6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: viewmodel
                                                                    .model
                                                                    .data[index]
                                                                    .vehicleImage ==
                                                                ""
                                                            ? Center(
                                                                child:
                                                                    Container(
                                                                        child: Image
                                                                            .asset(
                                                                "assets/transparent.gif",
                                                                height: 50,
                                                                width: 50,
                                                              )))
                                                            : Image.network(
                                                                viewmodel
                                                                    .model
                                                                    .data[index]
                                                                    .vehicleImage,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.2,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.2),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: constraints
                                                                    .maxWidth *
                                                                0.3,
                                                            child: Text(
                                                              viewmodel
                                                                  .model
                                                                  .data[index]
                                                                  .name,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                color: index ==
                                                                        0
                                                                    ? kPrimaryColor
                                                                    : Colors
                                                                        .black,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.05,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                                color: Colors
                                                                    .black54,
                                                                size: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.06,
                                                              ),
                                                              SizedBox(
                                                                width: 1,
                                                              ),
                                                              Text(
                                                                viewmodel
                                                                    .model
                                                                    .data[index]
                                                                    .passengers,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black38,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right: 0),
                                                              child: Icon(Icons
                                                                  .currency_pound)),
                                                          Text(
                                                            viewmodel
                                                                .model
                                                                .data[index]
                                                                .onewayrate,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.06,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                                            color:
                                                                Colors.black54,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.06,
                                                          ),
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Text(
                                                              viewmodel
                                                                  .model
                                                                  .data[index]
                                                                  .luggage,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black38,
                                                                fontSize: MediaQuery.of(
                                                                            context)
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
                                      );
                                    },
                                  )),
                      ],
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, snapshot) => Positioned(
                    left: 0,
                    right: 0,
                    bottom: 1 * (1 - _animationController.value * 700),
                    child: ButtonWidget(viewmodel, context),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget ButtonWidget(PolyLineViewModel viewmodel, context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 5,
          //           blurRadius: 7,
          //           offset: Offset(0, 3), // changes position of shadow
          //         ),
          //       ],
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(40),
          //           topRight: Radius.circular(40))),
          //   height: MediaQuery.of(context).size.height * 0.09,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       Expanded(
          //         flex: 1,
          //         child: InkWell(
          //           onTap: ()async{
          //           await viewmodel.makePayment();
          //           },
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               ListTileWithLessPadding(
          //                 // myOnTap: () {
          //                 //   //Get.to(PaymentOptionScreen());
          //                 //   showModalBottomSheet(
          //                 //       context: context,
          //                 //       builder: (context) =>
          //                 //           PersionalPaymentMethodScreen());
          //                 // },
          //                 myIcon: Icon(
          //                   Viiticons.payment,
          //                   size: MediaQuery.of(context).size.width * 0.07,
          //                   color: kPrimaryColor,
          //                 ),
          //                 myText: "Cash",
          //                 color: Colors.black,
          //                 opacity: 1,
          //                 width: MediaQuery.of(context).size.width / 7,
          //               ),
          //               Icon(
          //                 Icons.keyboard_arrow_down,
          //                 color: kPrimaryColor,
          //                 size: 24,
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       VerticalDivider(
          //         color: Color(0XFFD8D8D8),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: ListTileWithLessPadding(
          //           myOnTap: () {
          //             showDialog(
          //               context: context,
          //               builder: (context) {
          //                 return PromoBoxWidget(
          //                   titleText: "Any additional info?",
          //                   secondaryBtnTxt: "Cancel",
          //                   primaryBtnTxt: "add",
          //                   controller: viewmodel.additionalInfoController,
          //                   onPrimaryTap: () {
          //                     viewmodel.setAdditionalInfo(
          //                         viewmodel.additionalInfoController.text);
          //                     Navigator.of(context).pop();
          //                   },
          //                   onSecondaryTap: () {
          //                     Navigator.of(context).pop();
          //                   },
          //                 );
          //               },
          //             );
          //           },
          //           myIcon: Icon(
          //             Viiticons.plus,
          //             size: MediaQuery.of(context).size.width * 0.06,
          //             color: kPrimaryColor,
          //           ),
          //           myText: "${viewmodel.additionalInfo}",
          //           opacity: viewmodel.isSelected ? 1 : 0.3,
          //           width: MediaQuery.of(context).size.width / 5,
          //           color: Colors.black,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
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
                    btnTxt: "Next",
                    height: MediaQuery.of(context).size.height * 0.06,
                    btnOnTap: () async {
                      Get.to(DetailsScreenView(
                        carModel: viewmodel.listCarModel[0],
                        pickText: widget.pickAddress,
                        dropText: widget.dropAddress,
                        Whereviewmodel: widget.mainviewModel,
                      ));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget expandedChild(
  //     PolyLineViewModel viewmodel, BoxConstraints constraints,double currentHeight) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             //color of shadow
  //             spreadRadius: 5,
  //             //spread radius
  //             blurRadius: 7,
  //             // blur radius
  //             offset: Offset(0, 2), // changes position of shadow
  //           ),
  //         ],
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           margin: EdgeInsets.all(8),
  //           width: 100,
  //           height: 6,
  //           decoration: BoxDecoration(
  //               color: Colors.black12, borderRadius: BorderRadius.circular(10)),
  //         ),
  //         Align(
  //           alignment: Alignment.topLeft,
  //           child: Container(
  //             margin: EdgeInsets.all(10),
  //             child: Text(
  //               "Ride details",
  //               style: Theme.of(context).textTheme.caption.copyWith(
  //                     color: kLoginBlack,
  //                     fontSize: 24,
  //                   ),
  //             ),
  //           ),
  //         ),
  //
  //         Expanded(
  //             child: ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: viewmodel.model.data.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return InkWell(
  //               onTap: () {
  //                 // Get.to(ConfirmRideView(lat:ViewModel.pickuplat,lng: ViewModel.pickuplng,viewmodel:viewmodel,));
  //                 setState(() {
  //                   // if (_selectedIndex == index) {
  //                   //   _selectedIndex = -1;
  //                   // } else {
  //                   //   _selectedIndex = index;
  //                   // }
  //                   _animationController.reverse();
  //                   currentHeight = 0.0;
  //
  //                 });
  //               },
  //               child: Container(
  //                 margin: EdgeInsets.only(left: 12, right: 12, top: 0),
  //                 height: MediaQuery.of(context).size.width / 3,
  //                 child: Card(
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(15.0),
  //                   ),
  //                   shadowColor: Colors.black,
  //                   elevation: 6,
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Container(
  //                               child: Image.network(
  //                                 viewmodel.model.data[index].vehicleImage,
  //                                 height: constraints.maxWidth * 0.25,
  //                                 width: constraints.maxWidth * 0.25,
  //                               ),
  //                             ),
  //                             Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Container(
  //                                   width: constraints.maxWidth * 0.3,
  //                                   child: Text(
  //                                     viewmodel.model.data[index].name,
  //                                     overflow: TextOverflow.ellipsis,
  //                                     style: TextStyle(
  //                                       color: index == 0
  //                                           ? kPrimaryColor
  //                                           : Colors.black,
  //                                       fontSize: 20,
  //                                       fontWeight: FontWeight.w600,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 8,
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     Icon(
  //                                       Icons.person,
  //                                       color: Colors.black54,
  //                                     ),
  //                                     SizedBox(
  //                                       width: 1,
  //                                     ),
  //                                     Text(
  //                                       viewmodel.model.data[index].passengers,
  //                                       style: TextStyle(
  //                                           color: Colors.black38,
  //                                           fontSize: 14,
  //                                           fontWeight: FontWeight.w500),
  //                                     ),
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                         Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.end,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 Container(
  //                                   margin: EdgeInsets.only(right: 3),
  //                                   child: Text(
  //                                     "PKR",
  //                                     style: TextStyle(
  //                                         color: Colors.black87,
  //                                         fontSize: 16,
  //                                         fontWeight: FontWeight.w600),
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   viewmodel.model.data.
  //                                   style: TextStyle(
  //                                       color: Colors.black,
  //                                       fontSize: 16,
  //                                       fontWeight: FontWeight.w600),
  //                                 ),
  //                               ],
  //                             ),
  //                             SizedBox(
  //                               height: 5,
  //                             ),
  //                             Row(
  //                               children: [
  //                                 Icon(
  //                                   Icons.luggage,
  //                                   color: Colors.black54,
  //                                 ),
  //                                 SizedBox(
  //                                   width: 2,
  //                                 ),
  //                                 Text(viewmodel.model.data[index].luggage,
  //                                     style: TextStyle(
  //                                       color: Colors.black38,
  //                                       fontSize: 16,
  //                                     )),
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         )),
  //         // Align(
  //         //   alignment: Alignment.bottomCenter,
  //         //   child: Padding(
  //         //     padding: const EdgeInsets.only(
  //         //       top: 4,
  //         //       left: 26,
  //         //       right: 26,
  //         //       bottom: 10,
  //         //     ),
  //         //     child: Row(
  //         //       children: <Widget>[
  //         //         Expanded(
  //         //           child: FlatButtonWidget(
  //         //             btnColor: kAccentColor,
  //         //             btnTxt: "Next",
  //         //             btnOnTap: () async {
  //         //               viewmodel.fetchCarModel();
  //         //             },
  //         //           ),
  //         //         ),
  //         //       ],
  //         //     ),
  //         //   ),
  //         // ),
  //         // Align(
  //         //   alignment: Alignment.bottomCenter,
  //         //   child: Column(
  //         //     mainAxisAlignment: MainAxisAlignment.end,
  //         //     children: <Widget>[
  //         //       Container(
  //         //         color: Color(0XFFD8D8D8),
  //         //         height: 1,
  //         //       ),
  //         //
  //         //       GestureDetector(
  //         //         onTap: () {
  //         //           Get.to(RattingScreen());
  //         //         },
  //         //         child: Container(
  //         //           height: 36,
  //         //           width: double.infinity,
  //         //           color: Colors.white,
  //         //           child: Row(
  //         //             mainAxisAlignment: MainAxisAlignment.center,
  //         //             children: <Widget>[
  //         //               Text(
  //         //                 "For me",
  //         //                 textAlign: TextAlign.center,
  //         //                 style: Theme.of(context).textTheme.caption.copyWith(
  //         //                   color: kPrimary,
  //         //                   fontSize: 15,
  //         //                 ),
  //         //               ),
  //         //               Icon(
  //         //                 Icons.keyboard_arrow_down,
  //         //                 color: kPrimary,
  //         //                 size: 20,
  //         //               )
  //         //             ],
  //         //           ),
  //         //         ),
  //         //       ),
  //         //       Container(
  //         //         color: Color(0XFFD8D8D8),
  //         //         height: 1,
  //         //       ),
  //         //       Container(
  //         //         color: Color(0XFFFFF1F3F7),
  //         //         height: 62,
  //         //         child: Row(
  //         //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         //           children: <Widget>[
  //         //             Expanded(
  //         //               flex: 1,
  //         //               child: ListTileWithLessPadding(
  //         //                 myOnTap: () {
  //         //                   Get.to(PaymentOptionScreen());
  //         //                 },
  //         //                 myIcon: Icon(
  //         //                   Viiticons.payment,
  //         //                   size: 34,
  //         //                   color:  kPrimary,
  //         //                 ),
  //         //                 myText: "Payment",
  //         //               ),
  //         //             ),
  //         //             VerticalDivider(
  //         //               color: Color(0XFFD8D8D8),
  //         //             ),
  //         //             Expanded(
  //         //               flex: 1,
  //         //               child: ListTileWithLessPadding(
  //         //                 myOnTap: () {
  //         //                   showDialog(
  //         //                     context: context,
  //         //                     builder: (context){
  //         //                       return PromoBoxWidget(
  //         //                         titleText: "Any additional info?",
  //         //                         secondaryBtnTxt: "Cancel",
  //         //                         primaryBtnTxt: "add",
  //         //                         onPrimaryTap: () {
  //         //                           Navigator.of(context).pop();
  //         //                         },
  //         //                         onSecondaryTap: () {
  //         //                           Navigator.of(context).pop();
  //         //                         },
  //         //                       );
  //         //
  //         //                     },
  //         //
  //         //                   );
  //         //                 },
  //         //                 myIcon: Icon(
  //         //                   Viiticons.plus,
  //         //                   size: 30,
  //         //                   color: kPrimary,
  //         //                 ),
  //         //                 myText: "Addtional info",
  //         //               ),
  //         //             )
  //         //           ],
  //         //         ),
  //         //       )
  //         //     ],
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }

  Widget addWindowInf(
      LatLng latLng,
      String text,
      CustomInfoWindowController customInfoWindowController,
      PolyLineViewModel viewmodel) {
    return customInfoWindowController.addInfoWindow(
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: customInfoWindowController ==
                  viewmodel.customInfoWindowControllerdrop
              ? Row(
            children: [
              Container(
                height: 50.sp,
                width: 60.sp,
                color: kAccentColor,
                child: Center(
                  child: Text(
                    "drop",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.sp,
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Text("${text}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Icon(Icons.navigate_next,
                              size: 30.sp, color: Colors.black54),
                        ],
                      ),
                    ),
                  ))
            ],
          )
              : Row(
                  children: [
                    Container(
                      height: 50.sp,
                      width: 60.sp,
                      color: kAccentColor,
                      child: Center(
                        child: Text(
                          "Pick",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 110.sp,
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text("${text}",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            Icon(Icons.navigate_next,
                                size: 30.sp, color: Colors.black54),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
          // height: 50,
          // width: 200,
        ),
      ),
      latLng,
    );
  }
}

class VehicleInformationScreenArguments {
  final String fromLoc;
  final String toLoc;

  VehicleInformationScreenArguments({
    this.fromLoc,
    this.toLoc,
  });
}

class ListTileWithLessPadding extends StatelessWidget {
  final Icon myIcon;
  final String myText;
  final VoidCallback myOnTap;
  final Color color;
  final double opacity;
  final double width;

  ListTileWithLessPadding(
      {this.myIcon,
      this.myText,
      this.myOnTap,
      this.color,
      this.opacity,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myOnTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          myIcon,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              width: width,
              child: Opacity(
                opacity: opacity,
                child: Text(
                  myText,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: color,
                        fontSize: 15,
                        letterSpacing: 0.21,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum bottomSheetState { preview, expanded }
