// // ignore: file_names
// // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:connectcars/App/Helpers/ImportFile.dart';
// import 'package:connectcars/App/Helpers/global.dart';
// import 'package:connectcars/App/Screens/SelectRide/SelectRideViewModel.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
//
// // ignore: must_be_immutable
// class RideMap extends StatefulWidget {
//   SelectRideViewModel viewmodel;
//
//   RideMap({this.viewmodel});
//
//   @override
//   _RideMapState createState() => _RideMapState();
// }
//
// class _RideMapState extends State<RideMap> {
//   CameraPosition kInitialPosition = CameraPosition(
//       target: LatLng(33.6726, 73.5742), zoom: 15, tilt: 0, bearing: 0);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Stack(
//         children: [
//           Container(
//             child: GoogleMap(
//               initialCameraPosition:
//              kInitialPosition,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: false,
//               zoomControlsEnabled: false,
//               tiltGesturesEnabled: true,
//               compassEnabled: true,
//               scrollGesturesEnabled: true,
//               zoomGesturesEnabled: true,
//               mapType: MapType.satellite,
//               onMapCreated:
//                   (GoogleMapController controller) {
//                 widget.viewmodel.controllerGoogleMap.complete(controller);
//                 widget.viewmodel.newcontroller=controller;
//                 widget.viewmodel.LocationUpdate();
//               },
//             ),
//           ),
//           Positioned(
//               bottom: 10,
//               right: 10,
//               child: FloatingActionButton(
//                 onPressed: () {
//                   widget.viewmodel.LocationUpdate();
//                 },
//                 backgroundColor: Colors.white,
//                 child: Icon(
//                   Icons.gps_fixed,
//                   color: Colors.black54,
//                 ),
//               )),
//         ],
//       );
//   }
// // Set<Marker> _createMarker() {
// //   return {
// //     Marker(
// //         markerId: MarkerId("your Location"),
// //         position: LatLng(widget.picklat,widget.picklan),
// //         infoWindow: InfoWindow(title: 'Your Location'),
// //         rotation: 0,
// //     ),
// //   };
// // }
//
//
// }
//
