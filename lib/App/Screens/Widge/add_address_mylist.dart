import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Screens/SelectRide/SelectRideViewModel.dart';
import 'package:airport_deluxe/App/Screens/Widge/recent_address_item_list.dart';
import 'package:airport_deluxe/App/Screens/Widge/square_add_textfield_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../select_location_stop/components/stop_suggestion.dart';
import '../where_to/Components/shimmerLoading.dart';
import 'ets_appbar.dart';
import 'location_map.dart';

class AddAddressToMylist extends StatefulWidget {
  AddAddressToMylistScreenArguments arguments;



  AddAddressToMylist(
    this.arguments,

  );

  @override
  _AddAdressToMylistState createState() => _AddAdressToMylistState();
}

class _AddAdressToMylistState extends State<AddAddressToMylist> {
  List<IconData> favAddIcons = [
    Viiticons.history,
    Viiticons.history,
    Icons.star,
    Viiticons.history,
    Viiticons.history,
    Icons.location_on,
  ];
  List<String> favAddTitle = [
    "Rue des Lacs",
    "Avenue Ferdinand",
    "Red Bus Stop",
    "Beauchesne",
    "Rue des Lacs",
    "Set location on map"
  ];
  List<String> favAddAddresses = [
    "50, rue des Lacs, 83400 HYERESS",
    "19, rue La Boétie 75016 PARIS",
    "66, avenue Ferdinand de Lesseps 33170",
    "66, avenue Ferdinand de Lesseps 33170",
    "66, avenue Ferdinand de Lesseps 33170",
    "",
  ];
  TextEditingController addressController = TextEditingController();

  LocationState currentstate = LocationState.SHOW_SAVE_PLACES_FORM_STATE;

  @override
  void initState() {
    super.initState();
    print("AddAddressToMylist() init");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("AddAddressToMylist() didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("AddAddressToMylist() dispose");
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
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: <Widget>[
              SquareAddLocationTextFieldWidget(
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  hintText: widget.arguments.hintText,
                  myController: addressController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      viewmodel.getSuggestion(value);
                      setState(() {
                        currentstate =
                            LocationState.SHOW_PREDUCTION_PLACES_FORM_STATE;
                      });
                    }
                  },

                  ),
              SizedBox(
                height: 16,
              ),
              currentstate == LocationState.SHOW_SAVE_PLACES_FORM_STATE
                  ? Container()
                  : Search_location(viewmodel),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: favAddTitle.length,
              //     itemBuilder: (context, index) => GestureDetector(
              //       onTap: () {
              //         if (index ==5 ) {
              //          Get.to(LocationFromMap(LocationFromMapScreenArguments(
              //            toolbarTitle: widget.arguments.toolbarTitle,
              //            hintText: widget.arguments.hintText,
              //          ),));
              //         }else{
              //           Navigator.of(context).pop();
              //         }
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           children: <Widget>[
              //             RecentAddressItemList(
              //               addressTitle: favAddTitle[index],
              //               myIcon: favAddIcons[index],
              //               address: favAddAddresses[index],
              //               myBackgrounColor: kSettingFavAddAvtarBg,
              //               myIconColor: kTextLoginfaceid,
              //               isLastIndex: index == (favAddTitle.length - 1),
              //             ),
              //             index == (favAddTitle.length - 1)
              //                 ? SizedBox()
              //                 : Container(
              //               height: 0.5,
              //               margin: const EdgeInsets.only(
              //                 top: 14,
              //                 left: 46,
              //                 right: 16,
              //               ),
              //               color: kGrey,
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget saveplaces(SelectRideViewModel viewModel) {
  //   return Expanded(
  //     child: viewModel.placemodel.savedplace == null
  //         ? Center(
  //             child: Container(
  //             child: Text("No Suggestion"),
  //           ))
  //         : Column(
  //             children: [
  //               Expanded(
  //                 child: ListView.builder(
  //                   shrinkWrap: true,
  //                   itemCount: 5,
  //                   itemBuilder: (context, index) => Column(
  //                     children: <Widget>[
  //                       GestureDetector(
  //                         onTap: () {
  //                           Navigator.of(context).pop(true);
  //                         },
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 0, vertical: 8),
  //                           child: RecentAddressItemList(
  //                             addressTitle: index == 4
  //                                 ? "Set location on map"
  //                                 : viewModel.placemodel.savedplace[index]
  //                                     .placePrimary,
  //                             myBackgrounColor: kGrey,
  //                             myIcon: index == 4
  //                                 ? Icons.location_on
  //                                 : Viiticons.history,
  //                             iconsize: 18,
  //                             myIconColor: kTextLoginfaceid,
  //                             address: index == 4
  //                                 ? ""
  //                                 : viewModel.placemodel.savedplace[index]
  //                                     .placeSecondary,
  //                             onTap: () {},
  //                           ),
  //                         ),
  //                       ),
  //                       index == 4
  //                           ? SizedBox()
  //                           : Container(
  //                               height: 0.5,
  //                               margin: const EdgeInsets.only(
  //                                 top: 6,
  //                                 left: 62,
  //                                 right: 16,
  //                                 bottom: 6,
  //                               ),
  //                               color: kGrey,
  //                             ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //   );
  // }

  Widget Search_location(SelectRideViewModel viewModel) {
    return Obx(
        ()=>
       Expanded(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: viewModel.model.value.predictions == null
                ? Center(
                    child: Container(
                        child: Image.asset(
                    "assets/transparent.gif",
                    height: 50,
                    width: 50,
                  )))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.model.value.predictions.length,
                    itemBuilder: (context, index) => Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              addressController.text =
                                  viewModel.model.value.predictions[index].description;
                            },
                            child: RecentAddressItemList(
                              addressTitle: viewModel.model.value.predictions[index]
                                  .structuredFormatting.mainText,
                              myBackgrounColor: kGrey,
                              myIcon: Icons.place_outlined,
                              iconsize: 24,
                              myIconColor: kTextLoginfaceid,
                              address:
                                  viewModel.model.value.predictions[index].description,
                            )),
                        Container(
                          height: 0.5,
                          margin: const EdgeInsets.only(
                            top: 6,
                            left: 62,
                            right: 16,
                            bottom: 6,
                          ),
                          color: kGrey,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

// enum LocationState {
//   SHOW_SAVE_PLACES_FORM_STATE,
//   SHOW_PREDUCTION_PLACES_FORM_STATE,
// }

class AddAddressToMylistScreenArguments {
  final String toolbarTitle;
  final String hintText;

  AddAddressToMylistScreenArguments({
    this.toolbarTitle,
    this.hintText,
  });
}
