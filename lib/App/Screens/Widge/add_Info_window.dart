import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../select_location_stop/select_location_stop_viewmodel.dart';

class AddInfoScreen extends StatefulWidget {
  LatLng latLng;
  String text;
  CustomInfoWindowController customInfoWindowController;

 AddInfoScreen({this.latLng,this.customInfoWindowController,this.text});

  @override
  _AddInfoScreenState createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return
      widget.customInfoWindowController.addInfoWindow(
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text("${widget.text}",
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
      widget.latLng,
    );
  }
}
