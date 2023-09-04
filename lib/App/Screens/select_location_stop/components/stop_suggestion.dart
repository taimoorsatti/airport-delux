import 'package:custom_info_window/custom_info_window.dart';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Helpers/common/my_colors.dart';
import '../../../Helpers/common/viiticons_icons.dart';
import '../../../Helpers/global.dart';
import '../../Widge/recent_address_item_list.dart';
import '../../Widge/square_TextFeild_Widget.dart';
import '../../where_to/Components/shimmerLoading.dart';
import '../select_location_stop_viewmodel.dart';

class StopSuggestionScreen extends StatefulWidget {
  String ontap;
  List<TextEditingController> controllers;

  StopSuggestionScreen({this.ontap, this.controllers});

  @override
  State<StopSuggestionScreen> createState() => _StopSuggestionScreenState();
}

class _StopSuggestionScreenState extends State<StopSuggestionScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.text = myaddress;


  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SelectLocationStopViewModel(),
      builder: (SelectLocationStopViewModel viewmodel) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SquareTextFieldWidgetStop(
                      hintText: "Search...",
                      myHeight: 40,
                      myController: searchController,
                      onChanged: (value) {
                        viewmodel.getSuggestion(value);
                        viewmodel.currentstate =
                            LocationState.SHOW_PREDUCTION_PLACES_FORM_STATE;
                      },
                      suffixIcon: Icon(Icons.close),
                    ),
                  ),
                ),
                viewmodel.isLoding
                    ? LoadingListPage()
                    : viewmodel.currentstate ==
                            LocationState.SHOW_SAVE_PLACES_FORM_STATE
                        ? saveplaces(
                            viewmodel,
                          )
                        : Search_location(viewmodel, widget.ontap),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget saveplaces(
    SelectLocationStopViewModel viewModel,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: viewModel.savedPlacesModel.savedplace == null
            ? Center(
                child: Container(
                child: Text("No Suggestion"),
              ))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.savedPlacesModel.savedplace.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        viewModel.controllerValue=widget.controllers;
                        print(viewModel.controllerValue);
                        Navigator.of(context).pop(true);

                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 8),
                        child: RecentAddressItemList(
                          addressTitle: index == 0
                              ? "Saved Places"
                              : viewModel.savedPlacesModel.savedplace[index]
                                  .placePrimary,
                          myBackgrounColor: kGrey,
                          myIcon:
                              index == 0 ? Viiticons.star : Viiticons.history,
                          iconsize: 18,
                          myIconColor: kTextLoginfaceid,
                          address: index == 0
                              ? ""
                              : viewModel.savedPlacesModel.savedplace[index]
                                  .placeSecondary,
                          onTap: () {
                            ontap == "pick"
                                ? myLocationController.text = viewModel
                                    .savedPlacesModel
                                    .savedplace[index]
                                    .placeSecondary
                                : ontap == "drop"
                                    ? viewModel.lastDesinationController.text =
                                        viewModel.savedPlacesModel
                                            .savedplace[index].placeSecondary
                                    : ontap == "stop"
                                        ? stopcurrentController.text = viewModel
                                            .savedPlacesModel
                                            .savedplace[index]
                                            .placeSecondary
                                        : "";

                            if (widget.controllers.length != 4) {
                              setState(() {
                                fieldCount++;
                              });
                            }


                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    index == 0
                        ? Container(
                            height: 6,
                            margin: const EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                            ),
                            color: kSettingDivider,
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
    );
    ;
  }

  Widget Search_location(SelectLocationStopViewModel viewModel, ontap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.model.predictions.length,
          itemBuilder: (context, index) => Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  viewModel.controllerValue=widget.controllers;
                  print(viewModel.controllerValue);
                  Navigator.of(context).pop(true);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
                  child: InkWell(
                      onTap: () {
                        try {
                          var detailresult = viewModel.getDetils(
                              viewModel.model.predictions[index].placeId);
                          setState(() async {
                            // viewModel.addMarker(
                            //     LatLng(detailresult.geometry.location.lat,
                            //         detailresult.geometry.location.lng),
                            //     viewModel.model.predictions[index].description,
                            //     widget.controllers.length == 1
                            //         ? "marker1"
                            //         : widget.controllers.length == 2
                            //             ? "marker2"
                            //             : widget.controllers.length == 3
                            //                 ? "marker3"
                            //                 : widget.controllers.length == 4
                            //                     ? "marker4"
                            //                     : "");

                            // viewModel.wayPoint.add(PolylineWayPoint(
                            //   location: viewModel.model.predictions[index]
                            //       .description+",",
                            // ));
                            //print(viewModel.wayPoint);
                            viewModel.getPolylin(
                                viewModel.controller,
                                LatLng(clat, clng),
                                LatLng(
                                  dlat,
                                  dlng,
                                ));
                            viewModel.updateCameraLocation(
                                LatLng(clat, clng),
                                LatLng(dlat,
                                    dlng),
                                viewModel.controller);

                            // viewModel.updateCameraLocation(
                            //     LatLng(clat, clng),
                            //     LatLng(detailresult.geometry.location.lat,
                            //         detailresult.geometry.location.lng),
                            //     viewModel.controller);
                            if (widget.controllers.length != 3) {
                              fieldCount++;
                            }
                            ontap == "pick"
                                ? myLocationController.text =
                                viewModel.model.predictions[index].description
                                : ontap == "drop"
                                ? viewModel.lastDesinationController.text =
                                viewModel
                                    .model.predictions[index].description
                                : ontap == "stop"
                                ? stopcurrentController.text = viewModel
                                .model.predictions[index].description
                                : "";
                            viewModel.savedPlace(
                                viewModel.model.predictions[index].placeId,
                                viewModel.model.predictions[index]
                                    .structuredFormatting.mainText,
                                viewModel.model.predictions[index].description);
                            viewModel.currentstate =
                                LocationState.SHOW_SAVE_PLACES_FORM_STATE;
                            viewModel.controllerValue = widget.controllers;
                            print(viewModel.controllerValue);

                            Navigator.pop(context, true);
                          });
                          // Get.to(polylineview(
                          //   dropofflat: detailresult.geometry.location.lat,
                          //   dropofflng: detailresult.geometry.location.lng,
                          // ));
                        }catch(e){
                          print(e);
                        }

                      },
                      child: RecentAddressItemList(
                        addressTitle: viewModel.model.predictions[index]
                            .structuredFormatting.mainText,
                        myBackgrounColor: kGrey,
                        myIcon: Icons.place_outlined,
                        iconsize: 24,
                        myIconColor: kTextLoginfaceid,
                        address: viewModel.model.predictions[index].description,
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
    );
  }
}

enum LocationState {
  SHOW_SAVE_PLACES_FORM_STATE,
  SHOW_PREDUCTION_PLACES_FORM_STATE,
}
