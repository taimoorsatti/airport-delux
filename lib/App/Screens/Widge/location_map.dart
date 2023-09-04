import 'dart:async';

import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Screens/Widge/square_add_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ets_appbar.dart';

class LocationFromMap extends StatefulWidget {
  LocationFromMapScreenArguments arguments;

  LocationFromMap(this.arguments);

  @override
  _LocationFromMapState createState() => _LocationFromMapState();
}

class _LocationFromMapState extends State<LocationFromMap> {
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
    clat,
      clng,
    ),
    zoom: 14.4746,
  );

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    print("LocationFromMap() init");

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationFromMap() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("LocationFromMap() dispose");

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ViitAppBar(
          onLeadingPressed: () {
            Navigator.of(context).pop();
          },
          leadingWidget: ViitAppBarIconWidget(
            viitAppBarIconType: ViitAppBarIconTypes.BACK,
          ),
          titleWidget: ViitTitleWidget(
            widget.arguments.toolbarTitle,
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (CameraPosition cameraPosition) {
                print("Latitude: ${cameraPosition.target.latitude}");
                print("Latitude: ${cameraPosition.target.longitude}");
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(21),
                child: SquareAddLocationTextFieldWidget(
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    hintText: widget.arguments.hintText,
                    onChanged: (str) {
                      print("");
                    },
                    onFabTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Viiticons.location,
                size: 51,
                color: kAccentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationFromMapScreenArguments {
  final String toolbarTitle;
  final String hintText;

  LocationFromMapScreenArguments({
    this.toolbarTitle,
    this.hintText,
  });
}
