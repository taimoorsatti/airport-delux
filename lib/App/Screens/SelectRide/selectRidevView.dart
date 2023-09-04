


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Widge/ets_appbar.dart';
import '../Widge/home_nav_drawer.dart';
import '../myride/my_rides_screen.dart';
import '../notification/notifications_screen.dart';
import '../payment/add_card_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';
import 'Components/bottom_sheets/good_to_see_you_bottomsheet.dart';
import 'Components/location_information.dart';
import 'SelectRideViewModel.dart';

class SelectRideScreen extends StatefulWidget {
  SelectRideViewModel viewModel;

  SelectRideScreen({this.viewModel});

  @override
  static const String routeName = "slectride";

  _SelectRideScreenState createState() => _SelectRideScreenState();
}

class _SelectRideScreenState extends State<SelectRideScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LocationInformation() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("LocationInformation() dispose");
  }




  CameraPosition kInitialPosition = CameraPosition(
      target: LatLng(33.6726, 73.5742), zoom: 15, tilt: 0, bearing: 0);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int myCurrentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder(
      init: SelectRideViewModel(),
      builder: (SelectRideViewModel viewModel) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: MyNavDrawer(
                context: context,
                viewModel: viewModel,
                //myListItems: _buildItems(),
                currentSelectedNavItem: myCurrentNavIndex,
                onProfileTap: () {
                  print("Clicked on profile...");
                  setState(
                    () {
                      myCurrentNavIndex = 9; //Profile index onTap
                    },
                  );
                  Navigator.of(context).pop();
                },
                onNavItemChange: (int tapedIndex) {
                  print("I am tapped with $tapedIndex");
                  setState(() {
                    if (tapedIndex == 3) {
                      // Navigator.pushNamed(context,HomeScreen.routeName);
                      // print("Goto Login screen");
                    } else {
                      myCurrentNavIndex = tapedIndex;
                      Navigator.of(context).pop();
                      // }
                    }
                  });
                },
              ),
              appBar: myCurrentNavIndex != 0
                  ? ViitAppBar(
                      leadingWidget: ViitAppBarIconWidget(
                        viitAppBarIconType: ViitAppBarIconTypes.MENU,
                      ),
                      titleWidget: ViitTitleWidget(
                        _getAppBarTitleByIndex(myCurrentNavIndex),
                      ),
                      onLeadingPressed: () {
                        print("Leading click");
                        _scaffoldKey.currentState.openDrawer();
                      },
                      isActionWidget: myCurrentNavIndex == 7,
                      onActionPressed: () {},
                      actionWidget: const Padding(
                        padding: EdgeInsets.only(
                          right: 6,
                        ),
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 31,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
              body: _buildNavBodyByIndex(
                  myCurrentNavIndex, context, viewModel, constraints),

              /*_buildNavBodyByIndex(
            myCurrentNavIndex,
            context,
          )*/
            ),
          );
        });
      },
    );
  }

  _getAppBarTitleByIndex(paramTapedIndex) {
    switch (paramTapedIndex) {
      case 1: // MyRides
        return "My Rides";
        break;
      case 2: // Payment
        return "Payment";
        break;
      case 3: // Free Rides
        return "Free Rides";
        break;
      case 4: // Loyalty Program
        return "Loyalty Program";
        break;
      case 5: // Feel Good
        return "Feel Good";
        break;
      case 6: // Help & Support
        return "Help & Support";
        break;
      case 7: // Notifications
        return "Notifications";
        break;
      case 8: // Settings
        return "Settings";
        break;
      case 9: // Settings
        return "Edit Profile";
        break;
      default: // default home
        return "Home";
        break;
    }
  }

  _buildNavBodyByIndex(paramTapedIndex, buildContext, viewmodel, constrains) {
    switch (paramTapedIndex) {
      case 1: // MyRides
        return MyRidesScreen(viewModel: viewmodel,);
        break;
      case 2: // Payment
        return AddCardScreen();
        break;
      case 3: // Free Rides
        // return FreeRides();
        break;
      case 4: // Loyalty Program
        //return LoyaltyProgramScreen();
        break;
      case 5: // Feel Good
        //return FeelGoodScreen();
        break;
      case 6: // Help & Support
        //return HelpSupportScreen();
        break;
      case 7: // Notifications
        return NotificationsScreen();
        break;
      case 8: // Settings
       return SettingsScreen();
        break;
      case 9: // Profile
        return ProfileScreen();
        break;
      default: // default home
        return LocationInformation(
          viewmodel: viewmodel,
          constraints: constrains,
        );
        break;
    }
  }
}
