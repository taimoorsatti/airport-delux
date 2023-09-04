
 import 'dart:async';


import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Screens/SelectRide/SelectRideViewModel.dart';
import 'ImportFile.dart';
import 'package:flutter/material.dart';





  //List<NearbyAvaliableDriver> nearbyAvaliableDriverList=[];

  String rideStatus = " ";

  String carDetail="";

 String driverName="";


 String driverPhone="";
 String CurrntAddress;

 LatLng driverCurrentLocation;
 double clat=33.5664623;
 double clng=73.1384546;
 double dlat=33.5664623;
 double dlng=73.1384546;


 String myaddress;
 TextEditingController currentController;
 TextEditingController stopcurrentController;
 String ontap;
 TextEditingController _myLocationController = TextEditingController();
 TextEditingController get myLocationController => _myLocationController;

 int fieldCount = 0;
 String pickval;
 String dropval;
 String SelectDate="pick";
String hour;
 SelectRideViewModel viewmodel=SelectRideViewModel();
 int index;



