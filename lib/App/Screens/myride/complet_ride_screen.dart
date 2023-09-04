

import 'package:flutter/material.dart';

import '../../Helpers/common/my_colors.dart';
import '../SelectRide/SelectRideViewModel.dart';
import '../Widge/upcoming_ride_itmelayout_widget.dart';


class CompletedRideScreen extends StatefulWidget {
  final SelectRideViewModel viewModel;
  CompletedRideScreen({this.viewModel});
  @override
  _State createState() => _State();
}

class _State extends State<CompletedRideScreen> {
  var arryLength = 0;
  List<String> image = [
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg",
    "assets/mapiamge.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          /*return arryLength != 0
              ? UpcomingRideItmeLayoutWidget()
              : Text(
                  "You have no completed rides.",
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kLoginBlack,
                        fontSize: 17,
                      ),
                );*/
          return
            widget.viewModel.completebookingModel.length==null||widget.viewModel.completebookingModel.length==0?
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                "You have no completed rides.",
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: kLoginBlack,
                      fontSize: 17,
                    ),
              ),
            ),
          ): ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.viewModel.upcomingbookingModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                    UpcomingRideItmeLayoutWidget(
                      rideTime: widget.viewModel.completebookingModel[index].pickupdate,
                      rideName: widget.viewModel.completebookingModel[index].vehicleSelected,
                      droopupAddress:
                      widget.viewModel.completebookingModel[index].dropofflocation,
                      pickupAddress:
                      widget.viewModel.completebookingModel[index].pickuplocation,
                      rideAmount: widget.viewModel.completebookingModel[index].price,
                      rideImage: image[index],
                    );
                });
        });
  }
}
