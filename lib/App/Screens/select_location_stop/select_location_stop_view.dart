import 'package:airport_deluxe/App/Screens/select_location_stop/select_location_stop_viewmodel.dart';
import 'package:custom_info_window/custom_info_window.dart';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Helpers/common/my_colors.dart';
import '../../Helpers/global.dart';
import '../DrawPolyline/PolylineView.dart';
import '../Widge/ets_appbar.dart';
import '../Widge/flat_Button_Widget.dart';
import '../Widge/square_TextFeild_Widget.dart';
import 'components/stop_suggestion.dart';

class AddStopScreen extends StatefulWidget {
  static String routeName = "/wallet";
  int initialCount;
  TextEditingController dropController;
  String pickMainText;
  String dropMainText;
  AddStopScreen({this.initialCount = 1, this.dropController,this.pickMainText,this.dropMainText});

  @override
  _AddStopScreenState createState() => _AddStopScreenState();
}

class _AddStopScreenState extends State<AddStopScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static var friendsList;
  int nextIndex = 0;
  SelectLocationStopViewModel selectLocationStopViewModel =
      SelectLocationStopViewModel();
  List<String> data = ["dkddk" + ","];

  int itemcount = 1;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    fieldCount = widget.initialCount;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  CameraPosition kInitialPosition = CameraPosition(
      target: LatLng(33.6726, 73.5742), zoom: 15, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _buildList(selectLocationStopViewModel);
    return GetBuilder(
      init: SelectLocationStopViewModel(context: context),
      builder: (SelectLocationStopViewModel viewmodel) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffF2F2F4),
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Top container
                    Container(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(false);
                              },
                              child: ViitAppBarIconWidget(
                                viitAppBarIconType: ViitAppBarIconTypes.BACK,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 0),
                              child: Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    //child:MyForm(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 20,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    8 / 2),
                                                        color: Colors.black),
                                                  ),
                                                  ..._getline(context),
                                                ],
                                              )),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 40.0,
                                                          bottom: 8),
                                                  child: SquareTextFieldWidget(
                                                    hintText: "Enter Pickup",
                                                    myHeight: 40,
                                                    anable: false,
                                                    // viewmodel: widget.viewModel,
                                                    myController:
                                                        myLocationController,
                                                    ontap: () {
                                                      Get.to(
                                                          StopSuggestionScreen(
                                                        ontap: "pick",
                                                      ));
                                                    },
                                                    // onChanged: (value) {
                                                    //   setState(() {
                                                    //     if (value.isNotEmpty) {
                                                    //       widget.viewModel.getSuggestion(value);
                                                    //       widget.viewModel.currentstate = LocationState
                                                    //           .SHOW_PREDUCTION_PLACES_FORM_STATE;
                                                    //       ontap = "pick";
                                                    //       print(widget.viewModel.currentstate);
                                                    //     }
                                                    //   });
                                                    // },
                                                  ),
                                                ),
                                                // ..._getFriends(),

                                                ListView(
                                                  padding: EdgeInsets.all(0),
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  children: children,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 40.0),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 15),
                                                    child:
                                                        SquareTextFieldWidget(
                                                      hintText:
                                                          "Enter Desination",
                                                      myHeight: 40,
                                                      anable: false,
                                                      // viewmodel: widget.viewModel,
                                                      myController:
                                                          widget.dropController,
                                                      ontap: () {
                                                        Get.to(
                                                            StopSuggestionScreen(
                                                          ontap: "pick",
                                                        ));
                                                      },
                                                      // onChanged: (value) {
                                                      //   setState(() {
                                                      //     if (value.isNotEmpty) {
                                                      //       widget.viewModel.getSuggestion(value);
                                                      //       widget.viewModel.currentstate = LocationState
                                                      //           .SHOW_PREDUCTION_PLACES_FORM_STATE;
                                                      //       ontap = "pick";
                                                      //       print(widget.viewModel.currentstate);
                                                      //     }
                                                      //   });
                                                      // },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFF2F2F4),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     child: Stack(
                    //       children: [
                    //         GoogleMap(
                    //           initialCameraPosition: kInitialPosition,
                    //           myLocationEnabled: true,
                    //           myLocationButtonEnabled: false,
                    //           zoomControlsEnabled: false,
                    //           tiltGesturesEnabled: true,
                    //           compassEnabled: true,
                    //           scrollGesturesEnabled: true,
                    //           zoomGesturesEnabled: true,
                    //           mapType: MapType.normal,
                    //           onCameraMove: (position) {
                    //             viewmodel.customInfoWindowController.onCameraMove();
                    //           },
                    //           onMapCreated: (GoogleMapController controller) {
                    //             viewmodel.controller = controller;
                    //             viewmodel.updatecamera();
                    //             viewmodel.customInfoWindowController
                    //                 .googleMapController = controller;
                    //            AddInfoScreen(
                    //                latLng: LatLng(clat, clng),
                    //                text: "My Location",
                    //                 customInfoWindowController:viewmodel.customInfoWindowController,
                    //
                    //            );
                    //           },
                    //           markers: viewmodel.markerSet,
                    //           polylines: viewmodel.PolylineSet,
                    //
                    //         ),
                    //         CustomInfoWindow(
                    //           controller: viewmodel.customInfoWindowController,
                    //           height: 30,
                    //           // width: 150,
                    //           offset: 15,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                    Expanded(
                      child: Container(
                        color: Color(0xffF2F2F4),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015),
                                  Container(
                                    child: Image.asset(
                                      "assets/watch_1.png",
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.06),
                                  Container(
                                      child: Text(
                                    "Please keep stops to 3 minutes or less",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontWeight: FontWeight.w100,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07,
                                          color: kLoginBlack,
                                        ),
                                  )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Container(
                                      child: Text(
                                    "As a courtesy for your driver's time please limit each stop to 3 minutes or less, otherwise your fare may change",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black38,
                                        ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      flex: 4,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Color(0XFFF2F2F4),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        left: 26,
                        right: 26,
                        bottom: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButtonWidget(
                              btnColor: kAccentColor,
                              btnTxt: "Done",
                              btnOnTap: () {
                                setState(() {
                                  if (viewmodel.controllerValue.isNotEmpty) {
                                    for (int i = 0;
                                        i < viewmodel.controllerValue.length;
                                        i++) {
                                      if (viewmodel
                                          .controllerValue[i].text.isNotEmpty) {
                                        viewmodel.wayPointvalue.add(
                                            (PolylineWayPoint(
                                              location: viewmodel.controllerValue[i].text +
                                                  ", ",
                                              stopOver: true,
                                            )));

                                        print(viewmodel.wayPointvalue);
                                      }
                                    }
                                  }

                                });
                                print(viewmodel.controllerList);
                                // Get.to(polylineview(
                                //   dropofflat: dlat,
                                //   dropofflng: dlng,
                                //  wayPointController: viewmodel.wayPointvalue,
                                //   onclick: "with stop",
                                //   pickAddress:widget.pickMainText,
                                //   dropAddress: widget.dropMainText,
                                // ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildList(SelectLocationStopViewModel viewmodel) {
    int i;
    if (viewmodel.controllers.length < fieldCount) {
      for (i = viewmodel.controllers.length; i < fieldCount; i++) {
        viewmodel.controllers.add(TextEditingController());
      }
    }
    i = 0;
    return viewmodel.controllers
        .map<Widget>((TextEditingController controller) {
      int displayNumber = i + 1;
      i++;
      currentController = controller;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: SquareTextFieldWidget(
                hintText: "Add stop",
                myHeight: 40,
                anable: false,
                ontap: () {
                  setState(() {
                    stopcurrentController = controller;
                    Get.to(StopSuggestionScreen(
                      ontap: "stop",
                      controllers: viewmodel.controllers,
                    ));
                  });
                },
                // onChanged: (value) {
                //   setState(() {
                //     if (value.isNotEmpty) {
                //       widget.viewmodel.getSuggestion(value);
                //       widget.viewmodel.currentstate =
                //           LocationState.SHOW_PREDUCTION_PLACES_FORM_STATE;
                //       ontap = "stop";
                //       print(widget.viewmodel.currentstate);
                //     }
                //   });
                // },

                myController: controller,
              ),
            )),
            InkWell(
              onTap: () {
                setState(() {
                  if (viewmodel.controllers.length > 3) {
                    fieldCount--;
                  }
                  viewmodel.controllers.remove(controller);
                  //viewmodel.wayPoint.removeAt(controller.text==viewmodel.wayPoint)
                  viewmodel.getPolylin(viewmodel.controller, LatLng(clat, clng),
                      LatLng(dlat, dlng));
                  print(viewmodel.controllers);
                  print(viewmodel.wayPointvalue);
                });
              },
              child: Container(
                  height: 20,
                  width: 20,
                  child: controller.text == ""
                      ? SizedBox()
                      : Icon(
                          Icons.close,
                          size: 25,
                          color: Colors.red,
                        )),
            )
          ],
        ),
      );
    }).toList(); // convert to a list
  }

  List<Widget> _getline(BuildContext context) {
    List<Widget> linelist = [];
    for (int i = 0; i < fieldCount + 1; i++) {
      linelist.add(Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeRight: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          height: 2,
                          width: 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2 / 2),
                              color: Colors.black),
                        )
                      ],
                    );
                  })),
          SizedBox(
            height: 1,
          ),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 / 2), color: Colors.red),
          ),
        ],
      ));
    }
    return linelist;
  }

  Widget addWindowInf(
      LatLng latLng, String text, SelectLocationStopViewModel viewmodel) {
    return viewmodel.customInfoWindowController.addInfoWindow(
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text("${text}",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Triangle.isosceles(
          //   edge: Edge.BOTTOM,
          //   child: Container(
          //     color: Colors.blue,
          //     width: 20.0,
          //     height: 10.0,
          //   ),
          // ),
        ],
      ),
      latLng,
    );
  }
}
