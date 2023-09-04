

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Helpers/common/my_colors.dart';
import '../../../../Helpers/common/viiticons_icons.dart';
import '../../../../Helpers/global.dart';
import '../../../Widge/add_address_mylist.dart';
import '../../../Widge/recent_address_item_list.dart';
import '../../../Widge/square_schedule_textfield_widget.dart';
import '../../../where_to/where_to_screen.dart';
import '../../SelectRideViewModel.dart';

class GoodToSeeYouBottomSheet extends StatefulWidget {
  final VoidCallback myOnWhereToTap;
  final VoidCallback myOnScheduleTap;
  final Function(int) myOnLocationSelection;
  final SelectRideViewModel viewModel;

  GoodToSeeYouBottomSheet({
    @required this.myOnWhereToTap,
    @required this.myOnScheduleTap,
    @required this.myOnLocationSelection,
    @required this.viewModel,
  });

  @override
  _GoodToSeeYouBottomSheetState createState() =>
      _GoodToSeeYouBottomSheetState();
}

class _GoodToSeeYouBottomSheetState extends State<GoodToSeeYouBottomSheet> {
  List<IconData> favAddIcons = [
    Viiticons.home,
    Viiticons.work,
    Viiticons.loved,
  ];
  List<String> favAddTitle = [
    "Home",
    "Work",
    "Gym",
  ];
  List<String> favAddAddresses = [
    "50, rue des Lacs, 83400 HYÈRES",
    "19, rue La Boétie 75016 PARIS",
    "66, avenue Ferdinand de Lesseps 33170",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            "Hello Taimoor, good to see you!",
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: kPrimaryColor,
                  letterSpacing: 0.43,
                  fontSize: 20.sp,
              fontWeight:  FontWeight.w500
                ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SquareScheduleTextFieldWidget(
            hintText: "Where to?",
//            inputAction: TextInputAction.done,
//            inputType: TextInputType.text,
            onScheduleTap: widget.myOnScheduleTap,
            onWhereToTap: widget.myOnWhereToTap,
//            onSubmited: (str) {},
          ),
          SizedBox(
            height: 16.h,
          ),
          widget.viewModel.listLoading? Center(
              child: Container(
                  child: Image.asset(
                    "assets/transparent.gif",
                    height: 40.h,
                    width: 40.w,
                  ))
          ):
          Column(
            children: [
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      index=0;
                      viewmodel=widget.viewModel;
                      widget.viewModel.homefavAdress==""?
                      Get.to(AddAddressToMylist(
                        AddAddressToMylistScreenArguments(
                          toolbarTitle: "Home",
                          hintText: "Enter Home address",
                        ),

                      )):Get.to(WhereToScreen(address:widget.viewModel.homefavAdress,));
                    },
                    child:

                    RecentAddressItemList(
                      addressTitle:widget.viewModel.homefavAdress!=""? widget.viewModel.favAddTitle[0]:widget.viewModel.addressLabels[0],
                      myIcon: favAddIcons[0],
                      address: widget.viewModel.homefavAdress==""?"Address":widget.viewModel.homefavAdress,
                      myBackgrounColor: kSettingFavAddAvtarBg,
                      myIconColor: kTextLoginfaceid,
                      isLastIndex: 0 == 2,
                    ),
                  ),
                  0 == 2
                      ? SizedBox()
                      : Container(
                          height: 0.5,
                          margin: EdgeInsets.only(
                            top: 14.sp,
                            left: 46.sp,
                            right: 16.sp,
                            bottom: 12.sp,
                          ),
                          color: kGrey,
                        )
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      index=1;
                      widget.viewModel.workfavAddress==""?
                      Get.to(AddAddressToMylist(
                        AddAddressToMylistScreenArguments(
                          toolbarTitle: "Work",
                          hintText: "Enter Work address",
                        ),
                      )):Get.to(WhereToScreen(address:widget.viewModel.workfavAddress,));
                    },
                    child: RecentAddressItemList(
                      addressTitle:widget.viewModel.workfavAddress!=""? widget.viewModel.favAddTitle[1]:widget.viewModel.addressLabels[1],
                      myIcon: favAddIcons[1],
                      address: widget.viewModel.workfavAddress==""?"Address":widget.viewModel.workfavAddress,
                      myBackgrounColor: kSettingFavAddAvtarBg,
                      myIconColor: kTextLoginfaceid,
                      isLastIndex: 1 == 2,
                    ),
                  ),
                  1 == 2
                      ? SizedBox()
                      : Container(
                          height: 0.5,
                          margin:  EdgeInsets.only(
                            top: 14.sp,
                            left: 46.sp,
                            right: 16.sp,
                            bottom: 12.sp,
                          ),
                          color: kGrey,
                        )
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      index=2;
                      widget.viewModel.gymfavAddress==""?
                      Get.to(AddAddressToMylist(
                        AddAddressToMylistScreenArguments(
                          toolbarTitle: "Gym",
                          hintText: "Enter gym address",
                        ),
                      )):Get.to(WhereToScreen(address: widget.viewModel.gymfavAddress,));
                    },
                    child: RecentAddressItemList(
                      addressTitle:widget.viewModel.gymfavAddress!=""? widget.viewModel.favAddTitle[2]:widget.viewModel.addressLabels[2],
                      myIcon: favAddIcons[2],
                      address: widget.viewModel.gymfavAddress==""?"Address":widget.viewModel.gymfavAddress,
                      myBackgrounColor: kSettingFavAddAvtarBg,
                      myIconColor: kTextLoginfaceid,
                      isLastIndex: 2 == 2,
                    ),
                  ),
                  2 == 2
                      ? SizedBox(height: 20.h)
                      : Container(
                          height: 0.5,
                          margin: const EdgeInsets.only(
                            top: 14,
                            left: 46,
                            right: 16,
                            bottom: 12,
                          ),
                          color: kGrey,
                        )
                ],
              ),
            ],
          ),

          //
        ],
      ),
    );
  }
}
