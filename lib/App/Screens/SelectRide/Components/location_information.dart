import 'dart:async';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Helpers/common/my_colors.dart';
import '../../Widge/ets_appbar.dart';
import '../../where_to/where_to_screen.dart';
import '../SelectRideViewModel.dart';
import 'RideMap.dart';
import 'bottom_sheets/good_to_see_you_bottomsheet.dart';




class LocationInformation extends StatefulWidget {
  SelectRideViewModel viewmodel;
  BoxConstraints constraints;
  LocationInformation({this.viewmodel,this.constraints});
  @override
  _LocationInformationState createState() => _LocationInformationState();
}

class _LocationInformationState extends State<LocationInformation> {
  var myCurrentNavIndex = 0;
  var tripEnd = false;
  CameraPosition kInitialPosition = CameraPosition(
      target: LatLng(33.6726, 73.5742), zoom: 15, tilt: 0, bearing: 0);


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationInformation() didChangeDependencies");
  }


  @override
  void dispose() {
    super.dispose();
    print("LocationInformation() dispose");
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = widget.constraints.maxHeight;
     return Stack(
       children: <Widget>[
         SizedBox(
           height: widget.constraints.maxHeight*0.5,
           child: Stack(
             children: [
               Container(
                 child: GoogleMap(
                   initialCameraPosition:
                   kInitialPosition,
                   myLocationEnabled: true,
                   myLocationButtonEnabled: false,
                   zoomControlsEnabled: false,
                   tiltGesturesEnabled: true,
                   compassEnabled: true,
                   scrollGesturesEnabled: true,
                   zoomGesturesEnabled: true,
                   mapType: MapType.normal,
                   onMapCreated:
                       (GoogleMapController controller) {
                     widget.viewmodel.controllerGoogleMap.complete(controller);
                     widget.viewmodel.newcontroller=controller;
                     widget.viewmodel.LocationUpdate();
                   },
                 ),
               ),
               Positioned(
                   bottom: 10,
                   right: 10,
                   child: FloatingActionButton(
                     onPressed: () {
                       widget.viewmodel.LocationUpdate();
                     },
                     backgroundColor: Colors.white,
                     child: const Icon(
                       Icons.gps_fixed,
                       color: Colors.black54,
                     ),
                   )),
             ],
           ),
         ),

         // Top left menu icon
         Align(
           alignment: Alignment.topLeft,
           child: Padding(
             padding: const EdgeInsets.only(left: 8, top: 8),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 GestureDetector(
                   onTap: () {
                     Scaffold.of(context).openDrawer();
                   },
                   child: ViitAppBarIconWidget(
                     viitAppBarIconType: ViitAppBarIconTypes.MENU,
                     bgColor: kPrimaryColor,
                     iconColor: Colors.white,
                   ),
                 ),
                 //Top location selection done card
               ],
             ),
           ),
         ),

         //Bottom location add suggestion
         // Align(
         //   alignment: Alignment.bottomCenter,
         //   child: Container(
         //     padding: const EdgeInsets.all(8),
         //     color: Colors.white,
         //     height: 121,
         //     child: Row(
         //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         //       children: <Widget>[
         //          AddLocationSuggestionWidget(
         //           iconData:widget.viewmodel.addressIcons[0],
         //           text: widget.viewmodel.addressLabels[0],
         //           myOnTap: () {
         //             // Navigator.of(context).pushNamed(
         //             // AddAddressToMylistScreen.routeName,
         //             // arguments: AddAddressToMylistScreenArguments(
         //             // toolbarTitle: "Add Home Address",
         //             // hintText: "Enter home address",
         //             // ),
         //             // );
         //           },
         //         ),
         //         // AddLocationSuggestionWidget(
         //         //   iconData:widget.viewmodel. addressIcons[1],
         //         //   text: widget.viewmodel.addressLabels[1],
         //         //   myOnTap: () {
         //         //     // Navigator.of(context).pushNamed(
         //         //     // AddAddressToMylistScreen.routeName,
         //         //     // arguments: AddAddressToMylistScreenArguments(
         //         //     // toolbarTitle: "Add Work Address",
         //         //     // hintText: "Enter work address",
         //         //     // ),
         //         //     // );
         //         //   },
         //         // ),
         //         // AddLocationSuggestionWidget(
         //         //   iconData: widget.viewmodel.addressIcons[2],
         //         //   text: widget.viewmodel.addressLabels[2],
         //         //   myOnTap: () {
         //         //     // Navigator.of(context).pushNamed(
         //         //     // AddAddressToMylistScreen.routeName,
         //         //     // arguments: AddAddressToMylistScreenArguments(
         //         //     // toolbarTitle: "Add Gym Address",
         //         //     // hintText: "Enter gym address",
         //         //     // ),
         //         //     // );
         //         //   },
         //         // ),
         //       ],
         //     ),
         //   ),
         // ),
         Align(
           alignment: Alignment.bottomCenter,
           child: Container(
             height: widget.constraints.maxHeight*0.45,
             padding: const EdgeInsets.only(
               left: 21,
               right: 21,
               top: 21,
               bottom: 0,
             ),
             color: Colors.white,
             child: GoodToSeeYouBottomSheet(
               viewModel: widget.viewmodel,
               myOnLocationSelection: (i) {
                 // Get.to(AddAddressToMylist(
                 //     AddAddressToMylistScreenArguments(
                 //       toolbarTitle: "Add Gym Address",
                 //       hintText: "Enter gym address",
                 //       ),
                 // ));

               },
               myOnScheduleTap: () {
                 // showBottomSheet(screenHeight);
               },
               myOnWhereToTap: () async {
                 Get.to(WhereToScreen()
                 );
               }

             ),
           ),
         ),


       ],
     );
  }

  // showBottomSheet(screenHeight) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: screenHeight * 0.45,
  //           padding: const EdgeInsets.only(
  //               left: 21, right: 21, top: 21),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               Text(
  //                 "Schedule a Ride",
  //                 textAlign: TextAlign.center,
  //                 style: Theme
  //                     .of(context)
  //                     .textTheme
  //                     .caption
  //                     .copyWith(
  //                   color:kLoginBlack,
  //                   fontSize:20,
  //                   letterSpacing:0.47,
  //                   fontWeight: FontWeight.w500,
  //                 ),),
  //               SizedBox(
  //                 height: 21,
  //               ),
  //               DateSelectionContainer(
  //                 myText:
  //                 "${myWeekDays[selectedDate.weekday -
  //                     1]}, ${selectedDate.day.toString()
  //                     .padLeft(
  //                     2, '0')} ${myMonths[selectedDate.month -
  //                     1]}",
  //                 myOnTap: () async {
  //                   final DateTime picked =
  //                   await showDatePicker(
  //                       context: context,
  //                       initialDate: DateTime.now(),
  //                       firstDate: DateTime(2015, 8),
  //                       lastDate: DateTime(2101));
  //                   if (picked != null &&
  //                       picked != selectedDate)
  //                     setState(
  //                           () {
  //                         selectedDate = picked;
  //                       },
  //                     );
  //                 },
  //               ),
  //               SizedBox(
  //                 height: 12,
  //               ),
  //               DateSelectionContainer(
  //                 myText:
  //                 "${selectedTime
  //                     .hourOfPeriod} : ${selectedTime
  //                     .minute} ${selectedTime.period ==
  //                     DayPeriod.am ? 'AM' : 'PM'}",
  //                 myOnTap: () async {
  //                   final TimeOfDay picked =
  //                   await showTimePicker(
  //                     context: context,
  //                     initialTime: TimeOfDay(
  //                       hour: DateTime
  //                           .now()
  //                           .hour,
  //                       minute: DateTime
  //                           .now()
  //                           .minute,
  //                     ),
  //                   );
  //                   if (picked != null &&
  //                       picked != selectedTime) {
  //                     setState(() {
  //                       selectedTime = picked;
  //                     });
  //                   }
  //                 },
  //               ),
  //               SizedBox(
  //                 height: 12,
  //               ),
  //               FlatButtonWidget(
  //                 btnTxt: "Set Pickup Time",
  //                 btnColor: kAccentColor,
  //                 btnOnTap: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 height: 56,
  //               ),
  //             ],
  //           ),
  //         );
  //
  //       }
  //   );
  // }
}
