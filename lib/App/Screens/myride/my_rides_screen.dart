

import 'package:airport_deluxe/App/Screens/myride/upcoming_ride_screen.dart';
import 'package:flutter/material.dart';

import '../SelectRide/SelectRideViewModel.dart';
import '../Widge/my_ride_tab_widget.dart';
import 'canceled_ride_screen.dart';
import 'complet_ride_screen.dart';



class MyRidesScreen extends StatelessWidget {
  static const String routeName = "myrides";
 final SelectRideViewModel viewModel;
 MyRidesScreen({this.viewModel});


  @override
  Widget build(BuildContext context) {
    return MyRides(viewModel: viewModel,);
  }
}





class MyRides extends StatefulWidget {
  final SelectRideViewModel viewModel;
  MyRides ({this.viewModel});
  @override
  _MyRidesState createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> {
  var upcomingRideSelect = true;
  var completRideSelect = false;
  var canceledRideSelect = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          width: 16,
          height: 16,
        ),
        MyRideTabWidget(
          onTapUpcoming: () {
            setState(() {
              upcomingRideSelect = true;
              completRideSelect = false;
              canceledRideSelect = false;
            });
          },
          onTapComplet: () {
            setState(() {
              upcomingRideSelect = false;
              completRideSelect = true;
              canceledRideSelect = false;
            });
          },
          onTapCancele: () {
            setState(() {
              upcomingRideSelect = false;
              completRideSelect = false;
              canceledRideSelect = true;
            });
          },
          upcomingRideSelect: upcomingRideSelect,
          completRideSelect: completRideSelect,
          //canceledRideSelect: canceledRideSelect,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: upcomingRideSelect
                ? UpComingRideScreen(viewModel: widget.viewModel,)
                : completRideSelect
                    ? CompletedRideScreen(viewModel: widget.viewModel,)
                    : CanceledRideScreen(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
