import 'package:airport_deluxe/App/Helpers/common/my_colors.dart';
import 'package:airport_deluxe/App/Helpers/common/viiticons_icons.dart';
import 'package:airport_deluxe/App/Helpers/global.dart';
import 'package:airport_deluxe/App/Screens/select_location_stop/select_location_stop_view.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_screen.dart';
import 'package:airport_deluxe/App/Screens/where_to/where_to_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Widge/fab_button_widget.dart';
import 'Widge/square_TextFeild_Widget.dart';
import 'package:airport_deluxe/App/Helpers/ImportFile.dart';
import 'package:airport_deluxe/App/Screens/Widge/square_TextFeild_Widget.dart';

List<String> drawlineList = [null];

class MyForm extends StatefulWidget {
  WhereToViewModel viewModel;

  MyForm({@required this.viewModel});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  static var friendsList;

  int itemcount = 1;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 25.0.sp, left: 16.0.sp, right: 16.0.sp,bottom: 25.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 20.w,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 8.h,
                        width: 8.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8 / 2),
                            color: Colors.black),
                      ),
                      ..._getline(context),
                    ],
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SquareTextFieldWidget(
                      hintText: "Enter Pickup",
                      myHeight: 45.sp,
                      viewmodel: widget.viewModel,
                      myController: widget.viewModel.pickupController,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            widget.viewModel.getSuggestion(value);
                            pickval = value;
                            widget.viewModel.currentstate = LocationState
                                .SHOW_PREDUCTION_PLACES_FORM_STATE;
                            ontap = "pick";
                            widget.viewModel.ontapText="pick";
                            print(widget.viewModel.currentstate);
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: widget.viewModel.dropoffController.text.isNotEmpty &&
                            widget.viewModel.pickupController.text.isNotEmpty &&
                            widget.viewModel.dropoffController.text != dropval &&
                            widget.viewModel.pickupController.text != pickval
                            ? FABButton(
                            myHeight: 30.h,
                            myWidth: 30.w,
                            bgColor: kAccentColor,
                            icon:  Icon(
                              Viiticons.plus,
                              color: Colors.white,
                              size: 20.h,
                            ),
                            onTap: () {
                              Get.to(AddStopScreen(
                                dropController:
                                widget.viewModel.dropoffController,
                                pickMainText: widget.viewModel.pickMainText,
                                dropMainText: widget.viewModel.dropMainText,
                              ));
                            }
                          /*Navigator.of(context).pushNamed(
                LocationFromMapScreen.routeName,
                arguments: LocationFromMapScreenArguments(
                  toolbarTitle: "Add Work Address",
                  hintText: "Enter work address",
                ),
              );
            },*/
                        )
                            : SizedBox(
                          height: 35.h,
                        ),
                      ),
                    ),
                    // PlayerList(
                    //   viewmodel: widget.viewModel,
                    // ),
                    SquareTextFieldWidget(
                      hintText: "Enter Desination",
                      myHeight: 45.sp,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            dropval = value;
                            widget.viewModel.getSuggestion(value);
                            widget.viewModel.currentstate =
                                LocationState.SHOW_PREDUCTION_PLACES_FORM_STATE;
                            ontap = "drop";
                            widget.viewModel.ontapText="drop";
                            print(widget.viewModel.currentstate);
                          }
                        });
                      },
                      myController: widget.viewModel.dropoffController,
                    ),
                    SizedBox(
                      height: 15.h,
                      width: 15.w,
                    ),

                    // ..._getFriends(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _getline(BuildContext context) {
    List<Widget> linelist = [];
    for (int i = 0; i < drawlineList.length; i++) {
      linelist.add(Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeRight: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 35,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          height: 2,
                          width: 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2 / 2),
                              color: Colors.black),
                        )
                      ],
                    );
                  })),
          SizedBox(
            height: 1,
          ),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 / 2), color: Colors.red),
          ),
        ],
      ));
    }
    return linelist;
  }
}

// needs to be StatefulWidget, so we can keep track of the count of the fields internally
class PlayerList extends StatefulWidget {
  WhereToViewModel viewmodel;

  PlayerList({
    this.initialCount = 0,
    this.viewmodel,
  });

  // also allow for a dynamic number of starting players
  final int initialCount;

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  int fieldCount = 0;
  int nextIndex = 0;

  List<Widget> _buildList() {
    int i;
    if (widget.viewmodel.controllers.length < fieldCount) {
      for (i = widget.viewmodel.controllers.length; i < fieldCount; i++) {
        widget.viewmodel.controllers.add(TextEditingController());
      }
    }
    i = 0;
    return widget.viewmodel.controllers
        .map<Widget>((TextEditingController controller) {
      int displayNumber = i + 1;
      i++;
      currentController = controller;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: SquareTextFieldWidget(
                hintText: "Add stop",
                myHeight: 40,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      widget.viewmodel.getSuggestion(value);
                      widget.viewmodel.currentstate =
                          LocationState.SHOW_PREDUCTION_PLACES_FORM_STATE;
                      ontap = "stop";
                      print(widget.viewmodel.currentstate);
                    }
                  });
                },
                myController: currentController,
              ),
            )),
            InkWell(
              onTap: () {
                setState(() {
                  fieldCount--;
                  widget.viewmodel.controllers.remove(controller);
                  print(widget.viewmodel.controllers);
                  drawlineList.removeAt(0);
                });
              },
              child: Container(
                height: 20,
                width: 20,
                child: const Icon(
                  Icons.remove,
                  size: 25,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      );
    }).toList(); // convert to a list
  }

  @override
  Widget build(BuildContext context) {
    // generate the list of TextFields
    final List<Widget> children = _buildList();

    // append an 'add player' button to the end of the list
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(

              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 0, right: 0),
                  child: widget.viewmodel.dropoffController.text.isNotEmpty &&
                          widget.viewmodel.pickupController.text.isNotEmpty &&
                          widget.viewmodel.dropoffController.text != dropval &&
                          widget.viewmodel.pickupController.text != pickval
                      ? FABButton(
                          myHeight: 30,
                          myWidth: 30,
                          bgColor: kAccentColor,
                          icon: Icon(
                            Viiticons.plus,
                            color: Colors.white,
                            size: 20,
                          ),
                          onTap: () {
                            Get.to(AddStopScreen(
                              dropController:
                                  widget.viewmodel.dropoffController,
                              pickMainText: widget.viewmodel.pickMainText,
                              dropMainText: widget.viewmodel.dropMainText,
                            ));
                          }
                          /*Navigator.of(context).pushNamed(
                LocationFromMapScreen.routeName,
                arguments: LocationFromMapScreenArguments(
                  toolbarTitle: "Add Work Address",
                  hintText: "Enter work address",
                ),
              );
            },*/
                          )
                      : SizedBox(
                          height: 30,
                          width: 30,
                        )),
            ),
          ],
        ),
      ),
    );

    // build the ListView
    return ListView(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: children,
    );
  }

  @override
  void initState() {
    super.initState();

    // upon creation, copy the starting count to the current count
    fieldCount = widget.initialCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(PlayerList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
