import 'dart:convert';

import 'package:airport_deluxe/App/Screens/select_location_stop/select_location_stop_model.dart';
import 'package:custom_info_window/custom_info_window.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;

import '../../Helpers/ImportFile.dart';
import '../../Helpers/common/viiticons_icons.dart';
import '../../Helpers/global.dart';
import 'components/stop_suggestion.dart';

class SelectLocationStopViewModel extends GetxController {
  var context;
  SelectLocationStopViewModel({this
      .context});

  TextEditingController stopController = TextEditingController();
  TextEditingController lastDesinationController = TextEditingController();

  LocationState currentstate = LocationState.SHOW_SAVE_PLACES_FORM_STATE;

  List<AutocompletePrediction> predictions = [];
  AutoCompleteModelStop model = AutoCompleteModelStop();
  String key = "AIzaSyBFK9GXEAwdCbCxjSp5gAh7Z_X51BYUukk";
  LatLng kmapcenter;
  GoogleMapController controller;
  Set<Marker> markerSet = Set<Marker>();
  List<Marker> listMarker=[];
  PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> PolylineSet = Set<Polyline>();
  var result;
  DetailsResult detailsResult;
  places savedPlacesModel=places();
  bool isLoding=true;
  String title;
  List<String>  listString;
   List<PolylineWayPoint> wayPointvalue=<PolylineWayPoint>[];
  List<TextEditingController> controllerValue=<TextEditingController>[];
  List<String> controllerList=<String>[];

  List<TextEditingController> controllers = <TextEditingController>[];
  CustomInfoWindowController customInfoWindowController =
  CustomInfoWindowController();

  @override
  void onInit() {
    // TODO: implement onInit
    getPlace();
    myLocationController.text = myaddress;
    getPolylin(
        controller,
        LatLng(clat, clng),
    LatLng(dlat,
    dlng,));
  }

  List<IconData> addIcons = [
    Viiticons.star,
    Viiticons.history,
    Viiticons.history,
    Viiticons.history,
    Viiticons.history,
    Viiticons.history,
  ];




  Future getSuggestion(input) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        "$baseURL?input=$input&components=country:pk&key=${key}";
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      model = AutoCompleteModelStop.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load predictions');
    }
    update();
  }

  Future savedPlace(String placeId,String mainText,String primaryText) async{
    try{
      Map<String,dynamic> parameter={
        "id":"${placeId}",
        "place_primary":"${mainText}",
        "place_secondary":"${primaryText}",
      };
      var placeUrl=Uri.parse("http://leeds.taxi/api/setSavedPlaces.php");
      var res= await http.post(placeUrl,body:parameter);
      if(res.statusCode==200){
        print("successfully");
      }
    }catch(e){
      print(e);
    }
    update();
  }

  Future getPlace() async {
    try {
      var getUrl = Uri.parse("http://leeds.taxi/api/getSavedPlaces.php");
      var response = await http.post(getUrl);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        savedPlacesModel= places.fromJson(data);
        print(savedPlacesModel);


      }
    } catch (e) {
      print(e);
    }
    update();
    isLoding = false;
  }

  void updatecamera() {
    kmapcenter = LatLng(clat, clng);
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(clat, clng),
      zoom: 12,
    )));
    update();
  }

  Future getDetils(String placeId) async {
    result = await GooglePlace(key).details.get(placeId);
    if (result != null && result.result != null) {
      detailsResult = result.result;
      if (result.result.geometry.location.lat != null &&
          result.result.geometry.location.lng != null) {}
    }
    update();
    return detailsResult;

  }


  // void addWindowinfo(LatLng latLng,String text) {
  //    customInfoWindowController.addInfoWindow(
  //     Column(
  //       children: [
  //         Expanded(
  //           child: Container(
  //             padding: EdgeInsets.all(8),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(4),
  //             ),
  //             child: Text(
  //               "${text}",
  //               style:
  //              TextStyle(
  //                fontSize: 14,
  //                color: Colors.grey
  //              )
  //             ),
  //             width: double.infinity,
  //             height: double.infinity,
  //           ),
  //         ),
  //         // Triangle.isosceles(
  //         //   edge: Edge.BOTTOM,
  //         //   child: Container(
  //         //     color: Colors.blue,
  //         //     width: 20.0,
  //         //     height: 10.0,
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //     latLng,
  //   );
  // }


  // addMarker(LatLng latLng,String title,id) {
  //   markerSet.add(Marker(
  //       markerId: MarkerId("${id}"),
  //       icon: BitmapDescriptor.defaultMarker,
  //       position: latLng,
  //       infoWindow: InfoWindow(
  //           title:"${title}"
  //       )
  //   )) ;
  //   markerSet.addAll(listMarker);
  //
  //   update();
  // }

  getPolylin(GoogleMapController controller, LatLng source,
      LatLng desination,) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      key,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(desination.latitude, desination.longitude),
      travelMode: TravelMode.driving,
      wayPoints: wayPointvalue
    );
    polylineCoordinates.clear();
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    print(result);
    print(polylineCoordinates);
    //AddCircle(source, desination);
    _addPolyLine(controller, source, desination);

    update();
  }

  _addPolyLine(GoogleMapController controller, LatLng source,
      LatLng desination) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.pink,
      points: polylineCoordinates,
      width: 4,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );
    //polylines[id] = polyline;
    PolylineSet.add(polyline);

    update();
  }

  Future<void> updateCameraLocation(LatLng source,
      LatLng destination,
      GoogleMapController mapController,) async {
    if (mapController == null) return;

    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }
    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 70));
  }


}
