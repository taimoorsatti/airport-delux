

import 'package:flutter/material.dart';


import '../../Helpers/global.dart';
import '../Widge/add_address_mylist.dart';
import '../Widge/square_TextFeild_Widget.dart';
import '../practice.dart';
import '../select_location_stop/components/stop_suggestion.dart';
import '../where_to/where_to_viewmodel.dart';

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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 20,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8 / 2),
                            color: Colors.black),
                      ),
                      //..._getline(),
                    ],
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: SquareTextFieldWidget(
                        hintText: "Enter Pickup",
                        myHeight: 40,
                        viewmodel: widget.viewModel,
                        myController: widget.viewModel.pickupController,
                        onChanged: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              widget.viewModel.getSuggestion(value);
                              widget.viewModel.currentstate == LocationState.SHOW_PREDUCTION_PLACES_FORM_STATE;
                              ontap="pick";
                              print(widget.viewModel.currentstate);
                            }
                          });
                        },
                      ),
                    ),
                  PlayerList(viewmodel: widget.viewModel,),
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

  // List<Widget> _addvias() {
  //   List<Widget> vaislist = [];
  //   print(friendsList.length);
  //   for (int i = 0; i < friendsList.length; i++) {
  //     vaislist.add(Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         MediaQuery.removePadding(
  //             context: context,
  //             removeTop: true,
  //             removeRight: true,
  //             child: ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: itemcount,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return Column(
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(vertical: 23.0),
  //                         child: Row(
  //                           children: [
  //                             Expanded(
  //                                 child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                 right: 20.0,
  //                               ),
  //                               child: SquareTextFieldWidget(
  //                                 hintText: i == friendsList.length - 1
  //                                     ? "Add Desination"
  //                                     : "Add stop",
  //                                 myHeight: 40,
  //                                 myController: i == 0
  //                                     ? widget.viewModel.stop0Controller
  //                                     : i == 1
  //                                         ? widget.viewModel.stop1Controller
  //                                         : i == 2
  //                                             ? widget.viewModel.stop2Controller
  //                                             : i == 3
  //                                                 ? widget
  //                                                     .viewModel.stop3Controller
  //                                                 : "",
  //                                 onChanged: (value) {
  //                                   setState(() {
  //                                     if (value.isNotEmpty) {
  //                                       widget.viewModel.getSuggestion(value);
  //                                       widget.viewModel.currentstate =
  //                                           LocationState
  //                                               .SHOW_PREDUCTION_PLACES_FORM_STATE;
  //                                       print(widget.viewModel.currentstate);
  //                                     }
  //                                   });
  //                                 },
  //                               ),
  //                             )),
  //                             _addRemoveButton(
  //                                 i == friendsList.length - 1 && i < 3, index),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   );
  //                 })),
  //       ],
  //     ));
  //   }
  //   return vaislist;
  // }

  // List<Widget> _getFriends() {
  //   List<Widget> friendsTextFields = [];
  //   List<Widget> line = [];
  //   print(friendsList.length);
  //   for (int i = 0; i < friendsList.length; i++) {
  //     print(friendsTextFields.length);
  //     i == 0 ? friendsTextFields.insert(0, Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 23.0),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: SquareTextFieldWidget(
  //               hintText: "Enter Destination",
  //               myHeight: 40,
  //             ),
  //           ),
  //           _addRemoveButton(
  //               i == friendsList.length - 1 && i < 3, i
  //           ),
  //         ],
  //       ),
  //     )) :
  //     friendsTextFields.insert(0,
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 23.0),
  //           child: Row(
  //             children: [
  //               Expanded(child: SquareTextFieldWidget(
  //                 hintText: "Enter stop",
  //                 myHeight: 40,
  //                 myController: i == 0
  //                     ? widget.viewModel.stop0Controller
  //                     : i == 1
  //                     ? widget.viewModel.stop1Controller
  //                     : i == 2
  //                     ? widget.viewModel.stop2Controller
  //                     : i == 3
  //                     ? widget.viewModel.stop3Controller
  //                     : "",
  //                 index: i,
  //               ),
  //               ),
  //
  //
  //               SizedBox(width: 16),
  //               _addRemoveButton(i == friendsList.length - 1 && i < 3, i),
  //
  //             ],
  //           ),
  //         )
  //     );
  //   }
  //   print(_nameController);
  //   return friendsTextFields;
  // }



  // Widget _addRemoveButton(bool add, int index) {
  //   return InkWell(
  //       onTap: () {
  //         if (add) {
  //           if (index != 3) {
  //             friendsList.insert(0, null);
  //             print(friendsList);
  //           } else {
  //             Fluttertoast.showToast(msg: "No add vias more than 4");
  //           }
  //         } else
  //           friendsList.removeAt(index);
  //
  //         setState(() {});
  //       },
  //       child: Container(
  //         height: 20,
  //         width: 20,
  //         child: Icon(
  //           (add) ? Viiticons.plus : Icons.remove,
  //           size: (add) ? 18 : 25,
  //           color: (add) ? kPrimaryColor : Colors.red,
  //         ),
  //       )
  //   );
  // }
}



