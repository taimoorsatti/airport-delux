import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Screens/where_to/Components/passengers_luggage%20screen.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class FromToLocationCard extends StatelessWidget {
  final String fromLocation;
  final String toLocation;
  final Function onTapSwitch;
  final bool isPlusVisible;
  WhereToViewModel viewmodel;

  FromToLocationCard(
      {Key key,
      @required this.fromLocation,
      @required this.toLocation,
      this.isPlusVisible = true,
      this.onTapSwitch,
      this.viewmodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[


        // Switch up-down icon
      ],
    );
  }
}
