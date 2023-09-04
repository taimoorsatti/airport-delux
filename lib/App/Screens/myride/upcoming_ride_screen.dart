import 'package:flutter/material.dart';

import '../../Helpers/common/my_colors.dart';
import '../SelectRide/SelectRideViewModel.dart';
import '../Widge/upcoming_ride_itmelayout_widget.dart';

class UpComingRideScreen extends StatefulWidget {
  final SelectRideViewModel viewModel;

  UpComingRideScreen({this.viewModel});

  @override
  _State createState() => _State();
}

class _State extends State<UpComingRideScreen> {
  List<String> rideTimes = [
    "Today, 9:30 AM",
    "Dec 6, 2019 8:25 AM",
    "Dec 5, 2019 8:25 AM",
    "Dec 6, 2019 8:25 AM",
  ];
  List<String> rideType = ["Mini S", "Standard Xtra", "Vitt S", "Vitt C"];
  List<String> pickUpAdd = [
    "38, rue des Nations",
    "14, boulevard Amiral",
    "75, Rue Roussy"
  ];
  List<String> dropUpAdd = [
    "54, rue du Gue Jacquet",
    "75, Rue Roussy",
    "14, boulevard Amiral"
  ];
  List<String> amount = [" 432.10", "133.60", "123.14"];

  @override
  Widget build(BuildContext context) {
    return widget.viewModel.upcomingbookingModel.length == null ||
            widget.viewModel.upcomingbookingModel.length == 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                "You have no Upcoming rides.",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 17,
                    ),
              ),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.viewModel.upcomingbookingModel.length,
            itemBuilder: (BuildContext context, int index) {
              return UpcomingRideItmeLayoutWidget(
                rideTime:
                    widget.viewModel.upcomingbookingModel[index].pickupdate,
                rideName: widget
                    .viewModel.upcomingbookingModel[index].vehicleSelected,
                droopupAddress: widget
                    .viewModel.upcomingbookingModel[index].dropofflocation,
                pickupAddress:
                    widget.viewModel.upcomingbookingModel[index].pickuplocation,
                rideAmount: widget.viewModel.upcomingbookingModel[index].price,
                rideImage: widget.viewModel.image[index],
              );
            });
  }
}
