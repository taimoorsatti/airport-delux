// ignore_for_file: file_names, must_call_super

import 'dart:async';
import 'dart:convert';
import 'dart:math';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../Helpers/ImportFile.dart';
import '../../Helpers/Shared_Pref_helper.dart';
import '../../Helpers/common/viiticons_icons.dart';
import '../../Helpers/global.dart';
import 'SelectRideModel.dart';


class SelectRideViewModel extends GetxController {
  BuildContext context;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String ontap;

  SelectRideViewModel({this.ontap, this.context});

  String request = "";

  TextEditingController _PickController = TextEditingController();


  TextEditingController get PickController => _PickController;
  TextEditingController _dropController = TextEditingController();

  TextEditingController get dropController => _dropController;
  SharedPrefrence _sharedPrefrence= SharedPrefrence();
  bool listLoading=false;

  DetailsResult detailsResult;
  List<AutocompletePrediction> predictions = [];
  List<Favourite> listfavourite = [];
  double _pickuplat;
  StreamSubscription<Position> homeTapePageStreamSubcription;
  Rx<AutoSearchmodelForFavourite> model = AutoSearchmodelForFavourite().obs;
  placesForFavourite placemodel = placesForFavourite();
  bool isLoding = true;

  LatLng kMapCenter;
  var result;
  Position currentposition;

  Set<Marker> markerset = {};

  bool avaliableDriverkeyLoded = false;

  BitmapDescriptor nearByIcon;

  GoogleMapController newcontroller;
  Completer<GoogleMapController> controllerGoogleMap = Completer();
  SetAddress setAddress=SetAddress();
  bookingRecord bookingModel=bookingRecord();
  List<dynamic> upcomingbookingModel=[];
  List<dynamic> completebookingModel=[];
  List<String> image = [

  ];
  String homefavAdress="";
  String workfavAddress="";
  String gymfavAddress="";

  var myCurrentNavIndex = 0;
  var tripEnd = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(
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
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> addressLabels = [
    "Add Home",
    "Add Work",
    "Add Gym",
  ];

  List<IconData> addressIcons = [
    Viiticons.home,
    Viiticons.work,
    Viiticons.face,
    Icons.favorite,
  ];

  List<IconData> favAddIcons = [Viiticons.home, Viiticons.work, Viiticons.home];
  List<String> favAddTitle = ["Home", "Work", "Gym"];
  List<String> favAddAddresses = ["", "", ""];
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  static List<String> friendsList = [null];

  @override
  void onInit() {
    // TODO: implement onInit
    favAddress();
    Getlocationpermission();
    getPlace();
    GetUserBooking();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Getlocationpermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Geolocator.requestPermission();
    } else {
      currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      clat = currentposition.latitude;
      clng = currentposition.longitude;
      getcurrentAddress();
      LocationUpdate();

      update();
    }
    //Timer timer=Timer.periodic(Duration(seconds: 5), (timer) {
    update();
  }

  void updatecamera() {
    newcontroller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(clat, clng),
      zoom: 12,
    )));
    update();
  }







Future favAddress(){
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get().then((value) {
            print(value);
        homefavAdress = value["saveAddress"]["Home"];
        workfavAddress = value["saveAddress"]["Work"];
        gymfavAddress = value["saveAddress"]["gym"];
      });
    }catch(e){
      print(e);
    }
}

  Future<void> GetUserBooking()async {
    try {
      dynamic id = await SharedPrefrence().getUserId();
      var url = "https://etscars.co.uk/etscars/apis/getPendingBookings.php?id=${id}";
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        bookingModel = bookingRecord.fromJson(decodeData);
        for(var d in bookingModel.data){
          if(d.status=="pending"){
            upcomingbookingModel.add(d);
          }
          else{
            completebookingModel.add(d);
          }
        }
        addImage();
      }
      else{
        throw Exception("error to load data");
      }
      print(bookingModel);
    }catch(e){
      print(e);
    }
  }

  void addImage(){
    for(var i=0;i<upcomingbookingModel.length;i++){
      image.add("assets/mapiamge.jpeg",);
    }
  }










  void getcurrentAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentposition.latitude, currentposition.longitude);
    Placemark place = placemarks[0];
    Placemark place1 = placemarks[1];
    String currentaddres = place.subLocality;
    print(place);
    print(place1);
    CurrntAddress = '${place.street},${place1.locality},${place1.country}';
    myaddress = CurrntAddress;
  }

  // void autoCompleteSearch(String value) async {
  //   var result = await ApiKey.googlePlacekey.autocomplete.get(
  //     value,
  //     components: [Component('country', 'PK')],
  //   );
  //   if (result != null && result.predictions != null) {
  //     predictions = result.predictions;
  //   }
  //   update();
  // }

  Future getSuggestion(input) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String key = "AIzaSyCCqd8m_4HfOlYgTiIDDoMIpTV_Z_k-6qQ";
    String request =
        "${baseURL}?input=${input}&radius=500&components=country:uk&key=${key}";
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      model.value = AutoSearchmodelForFavourite.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load predictions');
    }
  }





  Future getPlace() async {
    try {
      var getUrl = Uri.parse("http://leeds.taxi/api/getSavedPlaces.php");
      var response = await http.post(getUrl);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        placemodel = placesForFavourite.fromJson(data);
        print(placemodel);
      }
    } catch (e) {
      print(e);
    }
    isLoding = false;
    update();
  }

  void LocationUpdate() {
    LatLng latLng = LatLng(clat, clng);
    newcontroller.animateCamera(CameraUpdate.newLatLng(latLng));
    update();
  }
}
