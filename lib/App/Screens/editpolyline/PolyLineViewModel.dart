// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';


import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
//import 'package:square_in_app_payments/in_app_payments.dart';
//import 'package:square_in_app_payments/models.dart';


import '../../Helpers/ImportFile.dart';
import '../../Helpers/Shared_Pref_helper.dart';
import '../../Helpers/global.dart';
import '../where_to/where_to_viewmodel.dart';
import 'PolyLineModel.dart';

class PolyLineViewModel extends GetxController {
  WhereToViewModel ViewModel;
  double droplat;
  double droplng;
  BuildContext context;
  bool isLoading = true;
  List<PolylineWayPoint> wayPointValue = <PolylineWayPoint>[];
  final String username = 'flutterdev';
  String onclick;
  bool isSelected = false;
  int hour;
  double distanceTotal;

  PolyLineViewModel({this.ViewModel,
    this.distanceTotal,
    this.droplat,
    this.droplng,
    this.context,
    this.wayPointValue,
    this.onclick,
    this.hour});

  GoogleMapController mapController;

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Marker> markerSet = Set<Marker>();
  Set<Circle> CircleSet = Set<Circle>();
  Set<Polyline> PolylineSet = Set<Polyline>();
  Completer<GoogleMapController> controllerGoogleMap = Completer();
  GoogleMapController newRideGoogleMapController;
  LatLng source;
  LatLng desination;
  Carmodel model = Carmodel();
  List<Data> listCarModel=[];
  List list = [];
  DirectionDetail directionDetail = DirectionDetail();
  List listprices = [];
  var distance;
  String calculatedistance;
  List listcar = [];
  List<AddCar> addcar = [];
  BitmapDescriptor customIcon;
  double maxBottomHeight = 700;
  currentUserModel currntUser = currentUserModel();
  int selectedIndex = 0;
  Map<String, dynamic> paymentIntentData;

  //double minHeight;
  //double currentHeight;

  //List<PolylineWayPoint> waypoint=[];
  CustomInfoWindowController customInfoWindowControllerpick =
  CustomInfoWindowController();

  CustomInfoWindowController customInfoWindowControllerdrop =
  CustomInfoWindowController();

  String additionalInfo = "Additional Info";
  TextEditingController additionalInfoController = TextEditingController();

  String googleAPiKey = "AIzaSyCCqd8m_4HfOlYgTiIDDoMIpTV_Z_k-6qQ";

  @override
  void onInit() {
    // TODO: implement onInit
    //minHeight=MediaQuery.of(context).size.width*0.6;
    customMarker(context);
    //obtainPlaceDirectionDetail(LatLng(clat, clng), LatLng(droplat, droplng));
    fetchCarModel(distanceTotal, hour);
    getCurrentUser();
  }

  // set sheetHeight(double height){
  //   currentHeight=MediaQuery.of(context).size.width*0.6;
  //   update();
  // }

  Set setAdditionalInfo(String value) {
    additionalInfo = value;
    isSelected = true;
    update();
  }

  // Future<void> payment() async {
  //   await InAppPayments.setSquareApplicationId(
  //       'sandbox-sq0idb-R7DQSITPmGo3wEtN89ojoQ');
  //   await InAppPayments.startCardEntryFlow(
  //       onCardNonceRequestSuccess: (CardDetails result) {
  //         try {
  //           InAppPayments.completeCardEntry(
  //               onCardEntryComplete:() =>print("Yay"));
  //         } on Exception catch (ex) {
  //           print("there are problem");
  //           InAppPayments.showCardNonceProcessingError(ex.toString());
  //         }
  //       },
  //       onCardEntryCancel: () {});
  // }




  Future getCurrentUser() async {
    try {
      var id = await SharedPrefrence().getUserId();
      var url = "https://etscars.co.uk/etscars/apis/getUserRecord.php?id=${id}";
      var response = await http.get(Uri.parse(url));
      var decodeData = json.decode(response.body);
      if (response.statusCode == 200) {
        currntUser = currentUserModel.fromJson(decodeData);
        print(currntUser);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
  }

  Future booking() async {
    try {
      dynamic id= await SharedPrefrence().getUserId();
      var url =
          "https://etscars.co.uk/etscars/apis/newBooking.php?pickuplocation=${ViewModel
          .pickupController.text}tt&dropofflocation=${ViewModel
          .dropoffController.text}&vias="
          "&pickupdate=${ViewModel.pickDate}&returnDate=${ViewModel
          .returnDate}&pickupTime=${ViewModel.pickTime}&retrunTime=${ViewModel
          .returnTime}&ride=single&payment=pending&distance=${ViewModel.distance
          .toString()}&price=${model.data[selectedIndex]
          .onewayrate}&status=alkjlk&vehicleSelected=${model.data[selectedIndex]
          .name}&passengerMobile=${currntUser.data[0]
          .mobileNumber}&reference=nilll&bookedBy=${currntUser.data[0]
          .firstName + currntUser.data[0].lastName}&bookingDate=${ViewModel
          .initaldate}&bookedById=${id}";
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["error"] == false) {
          Fluttertoast.showToast(msg: "Booking Addded Successfully");
        }
      } else {
        throw Exception(
          "Failed to load data",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Carmodel> fetchCarModel(double disValue, int hour) async {
    try {
      Uri url = Uri.parse(
          'https://connectcars.taxi/connect-car/apis/vehiclesRecord.php?selectedHour=${hour}&totalDistance=${disValue}');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        model = Carmodel.fromJson(parsed);
        listCarModel=model.data;
        print(model.data.length);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (ex) {
      print(ex);
    }
    isLoading = false;
    update();
  }



  double calculateDistance(plat, plng, dlat, dlng) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((dlat - plat) * p) / 2 +
        c(plat * p) * c(dlat * p) * (1 - c((dlng - plng) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }



  void onMapCreated(GoogleMapController controller) async {
    source = LatLng(clat, clng);
    desination = LatLng(droplat, droplng);
    getPolyline(controller, source, desination, ViewModel);
  }

  addMarker(LatLng source, LatLng desination) {
    Marker Pickupmarker = Marker(
      markerId: MarkerId("PickupLocation"),
      icon: customIcon,
      position: source,
      // infoWindow: InfoWindow(title: "pick up", snippet: "pick up address")
    );
    Marker dropupmarker = Marker(
      markerId: MarkerId("dropOffLocation"),
      icon: customIcon,
      position: desination,
      // infoWindow: InfoWindow(title: "drop off", snippet: "drop off address"),
    );
    markerSet.add(Pickupmarker);
    markerSet.add(dropupmarker);
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
    updateCameraLocation(source, desination, controller);
    update();
  }

  getPolyline(GoogleMapController controller, LatLng source, LatLng desination,
      WhereToViewModel viewmodel) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(desination.latitude, desination.longitude),
      travelMode: TravelMode.driving,
      wayPoints: onclick == "with stop"
          ? wayPointValue
          : [
        PolylineWayPoint(
          location: "",
        )
      ],
    );
    polylineCoordinates.clear();
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    print(result);
    print(polylineCoordinates);
    addMarker(source, desination);
    AddCircle(source, desination);
    _addPolyLine(controller, source, desination);

    update();
  }

  void AddCircle(LatLng source, LatLng desination) {
    Circle pickupcircle = Circle(
        fillColor: Colors.yellow,
        center: source,
        radius: 6,
        strokeWidth: 4,
        strokeColor: Colors.yellowAccent,
        circleId: const CircleId("origin"));
    Circle dropupcircle = Circle(
        fillColor: Colors.red,
        center: desination,
        radius: 6,
        strokeWidth: 4,
        strokeColor: Colors.red,
        circleId: const CircleId("destination"));
    CircleSet.add(pickupcircle);
    CircleSet.add(dropupcircle);
    update();
  }

  void customMarker(BuildContext context) {
    if (customIcon == null) {
      ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(context, size: Size(2, 2));
      BitmapDescriptor.fromAssetImage(imageConfiguration, "assets/circle.png")
          .then((value) {
        customIcon = value;
        print(value);
      });
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

//   Future sendMail() async {
//     String usernam = 'sattitaimoor581@gmail.com';
//     String password = 'vocoqpbjhhmtrtys';
//
//     final smtpServer = gmail(usernam, password);
//
//     //Create our Message
//     final message = Message()
//       ..from = Address(usernam, 'Taimoor')
//       ..recipients.add('tamoorbaba21@gmail.com')
//     // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//     // ..bccRecipients.add(Address('bccAddress@example.com'))
//       ..subject = 'New Booking'
//       ..text = 'Auto Mailing with Flutter with Custom Template';
//     var nameFromSomeInput = usernam;
//     var yourHtmlTemplate = '''
//          <!DOCTYPE "
// "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
//  <head>
//    <meta name="viewport" content="width=device-width" />
//    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
//    <title>Flutter Mailer</title>
//    <style>
//      /* -------------------------------------
//          GLOBAL RESETS
//      ------------------------------------- */
//      /*All the styling goes here*/
//      body {
//        background-color: #f6f6f6;
//        font-family: sans-serif;
//        -webkit-font-smoothing: antialiased;
//        font-size: 14px;
//        line-height: 1.4;
//        margin: 0;
//        padding: 0;
//        -ms-text-size-adjust: 100%;
//        -webkit-text-size-adjust: 100%;
//      }
//      table {
//        border-collapse: separate;
//        mso-table-lspace: 0pt;
//        mso-table-rspace: 0pt;
//        width: 100%; }
//        table td {
//          font-family: sans-serif;
//          font-size: 14px;
//          vertical-align: top;
//      }
//      /* -------------------------------------
//          BODY & CONTAINER
//      ------------------------------------- */
//      .body {
//        background-color: #343738;
//        width: 100%;
//      }
//      /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */
//      .container {
//        display: block;
//        margin: 0 auto !important;
//        /* makes it centered */
//        max-width: 580px;
//        padding: 10px;
//        width: 580px;
//      }
//      /* This should also be a block element, so that it will fill 100% of the .container */
//      .content {
//        box-sizing: border-box;
//        display: block;
//        margin: 0 auto;
//        max-width: 580px;
//        padding: 10px;
//      }
//      /* -------------------------------------
//          HEADER, FOOTER, MAIN
//      ------------------------------------- */
//      .main {
//        background: #ffffff;
//        border-radius: 3px;
//        width: 100%;
//      }
//      .wrapper {
//        box-sizing: border-box;
//        padding: 20px;
//      }
//      .content-block {
//        padding-bottom: 10px;
//        padding-top: 10px;
//      }
//      .footer {
//        clear: both;
//        margin-top: 10px;
//        text-align: center;
//        width: 100%;
//      }
//        .footer td,
//        .footer p,
//        .footer span,
//        .footer a {
//          color: #2b42d6;
//          font-size: 12px;
//          text-align: center;
//      }
//      /* -------------------------------------
//          TYPOGRAPHY
//      ------------------------------------- */
//      h1,
//      h2,
//      h3,
//      h4 {
//        color: #000000;
//        font-family: sans-serif;
//        font-weight: 400;
//        line-height: 1.4;
//        margin: 0;
//        margin-bottom: 30px;
//      }
//      h1 {
//        font-size: 35px;
//        font-weight: 300;
//        text-align: center;
//        text-transform: capitalize;
//      }
//      p,
//      ul,
//      ol {
//        font-family: sans-serif;
//        font-size: 14px;
//        font-weight: normal;
//        margin: 0;
//        margin-bottom: 15px;
//      }
//        p li,
//        ul li,
//        ol li {
//          list-style-position: inside;
//          margin-left: 5px;
//      }
//      a {
//        color: #3498db;
//        text-decoration: underline;
//      }
//      /* -------------------------------------
//          BUTTONS
//      ------------------------------------- */
//      .btn {
//        box-sizing: border-box;
//        width: 100%; }
//        .btn > tbody > tr > td {
//          padding-bottom: 15px; }
//        .btn table {
//          width: auto;
//      }
//        .btn table td {
//          background-color: #ffffff;
//          border-radius: 5px;
//          text-align: center;
//      }
//        .btn a {
//          background-color: #ffffff;
//          border: solid 1px #3498db;
//          border-radius: 5px;
//          box-sizing: border-box;
//          color: #3498db;
//          cursor: pointer;
//          display: inline-block;
//          font-size: 14px;
//          font-weight: bold;
//          margin: 0;
//          padding: 12px 25px;
//          text-decoration: none;
//          text-transform: capitalize;
//      }
//      .btn-primary table td {
//        background-color: #3498db;
//      }
//      .btn-primary a {
//        background-color: #3498db;
//        border-color: #3498db;
//        color: #ffffff;
//      }
//      /* -------------------------------------
//          OTHER STYLES THAT MIGHT BE USEFUL
//      ------------------------------------- */
//      .last {
//        margin-bottom: 0;
//      }
//      .first {
//        margin-top: 0;
//      }
//      .align-center {
//        text-align: center;
//      }
//      .align-right {
//        text-align: right;
//      }
//      .align-left {
//        text-align: left;
//      }
//      .clear {
//        clear: both;
//      }
//      .mt0 {
//        margin-top: 0;
//      }
//      .mb0 {
//        margin-bottom: 0;
//      }
//      .preheader {
//        color: transparent;
//        display: none;
//        height: 0;
//        max-height: 0;
//        max-width: 0;
//        opacity: 0;
//        overflow: hidden;
//        mso-hide: all;
//        visibility: hidden;
//        width: 0;
//      }
//      .powered-by a {
//        text-decoration: none;
//      }
//      hr {
//        border: 0;
//        border-bottom: 1px solid #f6f6f6;
//        margin: 20px 0;
//      }
//      /* -------------------------------------
//          RESPONSIVE AND MOBILE FRIENDLY STYLES
//      ------------------------------------- */
//      @media only screen and (max-width: 620px) {
//        table[class=body] h1 {
//          font-size: 28px !important;
//          margin-bottom: 10px !important;
//        }
//        table[class=body] p,
//        table[class=body] ul,
//        table[class=body] ol,
//        table[class=body] td,
//        table[class=body] span,
//        table[class=body] a {
//          font-size: 16px !important;
//        }
//        table[class=body] .wrapper,
//        table[class=body] .article {
//          padding: 10px !important;
//        }
//        table[class=body] .content {
//          padding: 0 !important;
//        }
//        table[class=body] .container {
//          padding: 0 !important;
//          width: 100% !important;
//        }
//        table[class=body] .main {
//          border-left-width: 0 !important;
//          border-radius: 0 !important;
//          border-right-width: 0 !important;
//        }
//        table[class=body] .btn table {
//          width: 100% !important;
//        }
//        table[class=body] .btn a {
//          width: 100% !important;
//        }
//        table[class=body] .img-responsive {
//          height: auto !important;
//          max-width: 100% !important;
//          width: auto !important;
//        }
//      }
//      /* -------------------------------------
//          PRESERVE THESE STYLES IN THE HEAD
//      ------------------------------------- */
//      @media all {
//        .ExternalClass {
//          width: 100%;
//        }
//        .ExternalClass,
//        .ExternalClass p,
//        .ExternalClass span,
//        .ExternalClass font,
//        .ExternalClass td,
//        .ExternalClass div {
//          line-height: 100%;
//        }
//        .apple-link a {
//          color: inherit !important;
//          font-family: inherit !important;
//          font-size: inherit !important;
//          font-weight: inherit !important;
//          line-height: inherit !important;
//          text-decoration: none !important;
//        }
//        #MessageViewBody a {
//          color: inherit;
//          text-decoration: none;
//          font-size: inherit;
//          font-family: inherit;
//          font-weight: inherit;
//          line-height: inherit;
//        }
//        .btn-primary table td:hover {
//          background-color: #34495e !important;
//        }
//        .btn-primary a:hover {
//          background-color: #34495e !important;
//          border-color: #34495e !important;
//        }
//      }
//    </style>
//  </head>
//  <body class="">
//    <span class="preheader">This is a preview text </span>
//    <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="body">
//      <tr>
//        <td>&nbsp;</td>
//        <td class="container">
//          <div class="content">
//            <!-- START CENTERED WHITE CONTAINER -->
//            <table role="presentation" class="main">
//              <!-- START MAIN CONTENT AREA -->
//              <tr>
//                <td class="wrapper">
//                  <table role="presentation" border="0" cellpadding="0" cellspacing="0">
//                    <tr>
//                      <td>
//                        <p>Hi {{NAME}},</p>
//
//                        <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="btn btn-primary">
//                          <tbody>
//                            <tr>
//                              <td align="left">
//                                <table role="presentation" border="0" cellpadding="0" cellspacing="0">
//                                  <tbody>
//
//                                  </tbody>
//                                </table>
//                              </td>
//                            </tr>
//                          </tbody>
//                        </table>
//
//                      </td>
//                    </tr>
//                  </table>
//                </td>
//              </tr>
//            <!-- END MAIN CONTENT AREA -->
//            </table>
//            <!-- END CENTERED WHITE CONTAINER -->
//          </div>
//        </td>
//        <td>&nbsp;</td>
//      </tr>
//    </table>
//  </body>
// </html>''';
//     message.html = yourHtmlTemplate.replaceAll('{{NAME}}', nameFromSomeInput);
//
//     try {
//       final sendReport = await send(message, smtpServer);
//       print('Message sent: ' + sendReport.toString());
//     } on MailerException catch (e) {
//       print('Message not sent.');
//       for (var p in e.problems) {
//         print('Problem: ${p.code}: ${p.msg}');
//       }
//     }
//   }




  Future<void> makePayment() async {
    try {
      paymentIntentData =
      await createPaymentIntent('20', 'usd'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              setupIntentClientSecret: 'sk_test_MQ1aylZmN2819bdBvjWYjp3e00DxKHz4m8',
              paymentIntentClientSecret:
              paymentIntentData['client_secret'],
              //applePay: PaymentSheetApplePay.,
              //googlePay: true,
              //testEnv: true,
              customFlow: true,
              style: ThemeMode.dark,
              // merchantCountryCode: 'US',
              merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Payment is successful'),
        ),
      );
    } catch (errorr) {
      if (errorr is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occured ${errorr.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occured $errorr'),
          ),
        );
      }
    }
  }



  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' + 'sk_test_MQ1aylZmN2819bdBvjWYjp3e00DxKHz4m8',
            'Content-Type': 'application/x-www-form-urlencoded'
          }
      );
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}

class AddCar extends GetxController {
  String image;
  String name;
  String distance;
  String price;
  String requaridtime;

  AddCar({this.image, this.name, this.distance, this.requaridtime, this.price});
}
