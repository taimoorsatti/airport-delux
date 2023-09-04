import 'dart:convert';
import 'dart:math';

import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/NetworkService/apiKey.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_model.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_model.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_model.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_model.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_model.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;

import '../editpolyline/PolyLineModel.dart';

class WhereToViewModel extends GetxController {
  final String textAddress;

  WhereToViewModel({this.textAddress});

  List<AutocompletePrediction> predictions = [];
  List<Results> listNearLocation =<Results> [].obs;
  nearestLocationModel nearestlocationModel= nearestLocationModel();
  LocationState currentstate = LocationState.SHOW_SAVE_PLACES_FORM_STATE;
  var result;
  String ontapText;
  Rx<AutoSearchmodel> model = AutoSearchmodel().obs;
  PlaceDetails modelPlaceDetail=PlaceDetails();
  GooglePlace googlePlacekey =
      GooglePlace("AIzaSyCCqd8m_4HfOlYgTiIDDoMIpTV_Z_k-6qQ");
  String key = "AIzaSyCCqd8m_4HfOlYgTiIDDoMIpTV_Z_k-6qQ";
  DirectionDetail directionDetail = DirectionDetail();
  places placeModel = places();
  bool isLoding = false;
  String initaldate;
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropoffController = TextEditingController();
  String pickMainText = "My Location";
  String dropMainText;
  double disValue;
  double distance;

  List<TextEditingController> controllers = <TextEditingController>[];


  List<String> addTitles = [
    "Saved Places",
    "Red Bus Stop",
    "Rue La",
    "Beauchesne",
    "Rue des Lacs",
    "Rue des Lacs"
        "Saved Places",
    "Red Bus Stop",
    "Rue La",
    "Beauchesne",
    "Rue des Lacs",
    "Rue des Lacs"
  ];
  List<String> addAdd = [
    "",
    "38, rue des Nations Unies SAINT",
    "19, rue La Boétie 75016 PARIS",
    "52, rue Gouin de Beauchesne NAZAIRE",
    "50, rue des Lacs, 83400 HYÈRES",
    "50, rue des Lacs, 83400 HYÈRES"
        "38, rue des Nations Unies SAINT",
    "19, rue La Boétie 75016 PARIS",
    "52, rue Gouin de Beauchesne NAZAIRE",
    "50, rue des Lacs, 83400 HYÈRES",
    "50, rue des Lacs, 83400 HYÈRES"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    pickupController.text=CurrntAddress;
    getNearestLocation();
    setAddress();
    //pickupController.text = myaddress;
    getPlace();
    initaldate =
        "${myWeekDays[selectedDate.weekday - 1]}, ${selectedDate.day.toString().padLeft(2, '0')} ${myMonths[selectedDate.month - 1]}" +
            ","
                    "${selectedTime.hourOfPeriod} : ${selectedTime.minute} ${selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}"
                .toString();
  }

  void setAddress() {
    if (textAddress == "") {
      dropoffController.text = "";
    } else {
      dropoffController.text = textAddress;
    }
  }

  // void autoCompleteSearch(String value) async {
  //   var result = await ApiKey.googlePlacekey.autocomplete.get(
  //     value,
  //     components: [Component('country', 'PK')],
  //   );
  //   if (result != null && result.predictions != null) {
  //     predictions = result.predictions;
  //   }
  //   print(predictions);
  //   update();
  // }

  DateTime selectedDate = DateTime.now();
  DateTime selectedDateReturn = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
  );

  TimeOfDay selectedTimeReturn = TimeOfDay(
    hour: DateTime.now().hour,
    minute: DateTime.now().minute,
  );

  List<String> myWeekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  List<String> myMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Otc",
    "Nov",
    "Dec"
  ];
  String pickText = "";
  String returnText = "";


  String pickDate = "";
  String pickTime = "";
  String returnDate = "";
  String returnTime = "";


  set setDateReturn(String value) {
    returnText = value;
    update();
  }

  set setDatePick(String value) {
    pickText = value;
    update();
  }

//   void CheckdateTime(String pick,String drop){
//     try {
//       DateTime pickdt = DateTime.parse(pick);
//       DateTime dropdt = DateTime.parse(drop);
//
//       Duration diff = dropdt.difference(pickdt);
//
//       if (diff.isNegative) {
//        Get.snackbar("Error:", "Invliad date");
//       }
//     }catch(e){
//       print(e);
//     }
// }



  Future getNearestLocation()async{
    String baseUrl='https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    String request =
        "$baseUrl?location=${clat}%2C${clng}&radius=1500&type=restaurant&key=$key";
    print(request);
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      nearestlocationModel= nearestLocationModel.fromJson(jsonDecode(response.body));
      listNearLocation=nearestlocationModel.results;
    } else {
      throw Exception('Failed to load predictions');
    }
    update();
  }



  Future getDetils(String placeId) async {
   String baseUrl = "https://maps.googleapis.com/maps/api/place/details/json";
   String request =
       "$baseUrl?place_id=${placeId}&key=${key}";
  var res = await http.get(Uri.parse(request));
    if(res.statusCode==200){
      var decode=jsonDecode(res.body);
      modelPlaceDetail=PlaceDetails.fromJson(decode);
      if(modelPlaceDetail.result!=null){
       if(ontapText=="pick"){
         clat=modelPlaceDetail.result.detailGeometry.location.lat;
         clng=modelPlaceDetail.result.detailGeometry.location.lng;
       }else{
         dlat=modelPlaceDetail.result.detailGeometry.location.lat;
         dlng=modelPlaceDetail.result.detailGeometry.location.lng;
       }

      }
    }

    update();
  }

  Future getSuggestion(input) async {
    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          "$baseURL?input=${input}&radius=500&components=country:pk&key=${key}";
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        model.value = AutoSearchmodel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load predictions');
      }


      update();
    }catch(e){
      print(e);
    }
    Future.delayed(const Duration(seconds:2), () {
      FocusScope.of(Get.context).unfocus();
    });
  }

  Future savedPlace(String placeId, String mainText, String primaryText) async {
    try {
      Map<String, dynamic> parameter = {
        "id": "${placeId}",
        "place_primary": "${mainText}",
        "place_secondary": "${primaryText}",
      };
      var placeUrl = Uri.parse("http://leeds.taxi/api/setSavedPlaces.php");
      var res = await http.post(placeUrl, body: parameter);
      if (res.statusCode == 200) {
        print("successfully");
      }
    } catch (e) {
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
        placeModel = places.fromJson(data);
        print(placeModel);
      }
    } catch (e) {
      print(e);
    }
    update();
    isLoding = false;
  }

  double calculateDistance(plat, plng, dlat, dlng) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((dlat - plat) * p) / 2 +
        c(plat * p) * c(dlat * p) * (1 - c((dlng - plng) * p)) / 2;
    double resul = 12742 * asin(sqrt(a));
    double distanceInMeters =
        Geolocator.distanceBetween(clat, clng, dlat, dlng);
    print(resul);
  }



  Future obtainPlaceDirectionDetail(
      LatLng initalPosition, LatLng finalPosition) async {
    String distanceUrl =
        "https://connectcars.taxi/connect-car/apis/getDistance.php?pickupLatLong=${initalPosition.latitude},${initalPosition.longitude}&dropoffLatLong=${finalPosition.latitude},${finalPosition.longitude}";
    var response = await http.get(Uri.parse(distanceUrl));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var decode = distanceModel.fromJson(jsonData);
      int val=decode.rows[0].elements[0].distance.value;
      distance=val/1000;
      print(distance);
      return decode;
    } else {
      return "Failed, No Response";
    }

  }

  Future<dynamic> getRequest(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var decodeData = jsonDecode(jsonData);
      return decodeData;
    } else {
      return "Failed, No Response";
    }
  }




  //  Future<Direction> getDirectionDetailsWithVais(
  //     LatLng intialPosition, LatLng finalPosition, ) async {
  //   print("Waypoints");
  //   String directionUrl =
  //       "https://maps.googleapis.com/maps/api/directions/json?origin=${intialPosition.latitude},${intialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&waypoints=Penistone, Sheffield, UK,S4 7UD, Savile St, Sheffield, UK&key=$key";
  //   print(directionUrl);
  //   var res = await getRequest(directionUrl);
  //   if (res == "Failed!") {
  //     return null;
  //   }
  //   Direction direction = Direction();
  //   var totalDistance = 0;
  //   var totalDuration = 0;
  //   var myroute = res["routes"][0];
  //   for (int i = 0; i < myroute["legs"].length; i++) {
  //     totalDistance += myroute["legs"][i]["distance"]["value"];
  //     totalDuration += myroute["legs"][i]["duration"]["value"];
  //   }
  //   direction.encodedPoints = res["routes"][0]["overview_polyline"]["points"];
  //   direction.distanceValue = totalDistance;
  //   var value = (direction.distanceValue / 1000);
  //   var newdic = (value / 1.609344).roundToDouble();
  //   print(newdic);
  //   direction.durationValue = totalDuration;
  //   return direction;
  // }
  //



}








class Direction {
  int distanceValue;
  int durationValue;
  String encodedPoints;

  Direction({this.distanceValue, this.durationValue, this.encodedPoints});
}
