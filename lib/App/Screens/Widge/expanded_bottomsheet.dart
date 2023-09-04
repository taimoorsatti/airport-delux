// import 'package:connectcars/App/Screens/Widge/payment_option.dart';
// import 'package:connectcars/App/Screens/Widge/promo_box_widget.dart';
// import 'package:date_format/date_format.dart';
// import 'package:connectcars/App/Helpers/ImportFile.dart';
// import 'package:connectcars/App/Helpers/common/my_colors.dart';
// import 'package:connectcars/App/Screens/DrawPolyline/PolyLineViewModel.dart';
// import 'package:connectcars/App/Screens/DrawPolyline/PolylineView.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../Helpers/common/viiticons_icons.dart';
// import '../editpolyline/PolyLineViewModel.dart';
// import '../ratting/ratting_screen.dart';
// import 'flat_Button_Widget.dart';
//
// class ExpandedBottomSheet extends StatefulWidget {
//   PolyLineViewModel viewmodel;
//   BoxConstraints constraints;
//   ExpandedBottomSheet({this.viewmodel,this.constraints});
//
//   @override
//   _ExpandedBottomSheetState createState() => _ExpandedBottomSheetState();
// }
//
// class _ExpandedBottomSheetState extends State<ExpandedBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               //color of shadow
//               spreadRadius: 5,
//               //spread radius
//               blurRadius: 7,
//               // blur radius
//               offset: Offset(
//                   0, 2), // changes position of shadow
//             ),
//           ],
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20))),
//       child: Column(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.all(8),
//             width: 100,
//             height: 6,
//             decoration: BoxDecoration(
//                 color: Colors.black12,
//                 borderRadius: BorderRadius.circular(
//                     10)),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               margin: EdgeInsets.all(10),
//               child: Text(
//                 "Ride details",
//                 style:
//                 Theme
//                     .of(context)
//                     .textTheme
//                     .caption
//                     .copyWith(
//                   color: kLoginBlack,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//           ),
//
//
//           Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: widget.viewmodel.model.data.length,
//                 itemBuilder: (BuildContext context,
//                     int index) {
//
//
//                   return InkWell(
//                     onTap: () {
//                       // Get.to(ConfirmRideView(lat:widget.ViewModel.pickuplat,lng: widget.ViewModel.pickuplng,viewmodel:viewmodel,));
//                       // setState(() {
//                       //   if (_selectedIndex == index) {
//                       //     _selectedIndex = -1;
//                       //   } else {
//                       //     _selectedIndex = index;
//                       //   }
//                       // });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(
//                           left: 12,
//                           right: 12,
//                           top: 0),
//                       height: MediaQuery
//                           .of(context)
//                           .size
//                           .width / 3,
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius
//                               .circular(15.0),
//                         ),
//                         shadowColor: Colors.black,
//                         elevation: 6,
//                         child: Padding(
//                           padding: const EdgeInsets
//                               .only(
//                               left: 8.0, right: 8.0),
//                           child: Row(
//                             crossAxisAlignment:
//                             CrossAxisAlignment.center,
//                             mainAxisAlignment:
//                             MainAxisAlignment
//                                 .spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     child:  Image.network(
//                                       widget.viewmodel
//                                           .model.data[
//                                       index]
//                                           .vehicleImage,
//                                       height: widget.constraints.maxWidth*0.25,
//                                       width: widget.constraints.maxWidth*0.25,
//                                     ),
//                                   ),
//                                   Column(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .center,
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment
//                                         .start,
//                                     children: [
//                                       Container(
//                                         width: widget.constraints.maxWidth*0.3,
//                                         child: Text(
//                                           widget.viewmodel
//                                               .model
//                                               .data[index]
//                                               .name,
//                                           overflow:
//                                           TextOverflow
//                                               .ellipsis,
//                                           style: TextStyle(
//                                             color: index ==
//                                                 0
//                                                 ? kPrimaryColor
//                                                 : Colors
//                                                 .black,
//                                             fontSize: 20,
//                                             fontWeight:
//                                             FontWeight
//                                                 .w600,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 8,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons
//                                                 .person,
//                                             color: Colors
//                                                 .black54,
//                                           ),
//                                           SizedBox(
//                                             width: 1,
//                                           ),
//                                           Text(
//                                            widget. viewmodel
//                                                 .model
//                                                 .data[index]
//                                                 .passengers,
//                                             style: TextStyle(
//                                                 color: Colors
//                                                     .black38,
//                                                 fontSize: 14,
//                                                 fontWeight:
//                                                 FontWeight
//                                                     .w500),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment
//                                     .center,
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment
//                                     .end,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         margin:
//                                         EdgeInsets
//                                             .only(
//                                             right: 3),
//                                         child: Text(
//                                           "PKR",
//                                           style: TextStyle(
//                                               color: Colors
//                                                   .black87,
//                                               fontSize: 16,
//                                               fontWeight:
//                                               FontWeight
//                                                   .w600),
//                                         ),
//                                       ),
//                                       Text(
//                                         widget.viewmodel.model.data.length!=null?
//                                         ( widget.viewmodel.intvalue
//                                             * double.parse(widget.viewmodel.model
//                                                 .data[index]
//                                                 .standardRate)+double.parse(widget.viewmodel.model
//                                             .data[index]
//                                             .fixedUplift)).toString():"",
//                                         style: TextStyle(
//                                             color: Colors
//                                                 .black,
//                                             fontSize: 16,
//                                             fontWeight:
//                                             FontWeight
//                                                 .w600),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.luggage,
//                                         color: Colors
//                                             .black54,
//                                       ),
//                                       SizedBox(
//                                         width: 2,
//                                       ),
//                                       Text(
//                                           widget.viewmodel
//                                               .model
//                                               .data[index]
//                                               .luggage,
//                                           style: TextStyle(
//                                             color: Colors
//                                                 .black38,
//                                             fontSize: 16,
//                                           )),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               )),
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Padding(
//           //     padding: const EdgeInsets.only(
//           //       top: 4,
//           //       left: 26,
//           //       right: 26,
//           //       bottom: 10,
//           //     ),
//           //     child: Row(
//           //       children: <Widget>[
//           //         Expanded(
//           //           child: FlatButtonWidget(
//           //             btnColor: kAccentColor,
//           //             btnTxt: "Next",
//           //             btnOnTap: () async {
//           //               widget.viewmodel.fetchCarModel();
//           //             },
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.end,
//           //     children: <Widget>[
//           //       Container(
//           //         color: Color(0XFFD8D8D8),
//           //         height: 1,
//           //       ),
//           //
//           //       GestureDetector(
//           //         onTap: () {
//           //           Get.to(RattingScreen());
//           //         },
//           //         child: Container(
//           //           height: 36,
//           //           width: double.infinity,
//           //           color: Colors.white,
//           //           child: Row(
//           //             mainAxisAlignment: MainAxisAlignment.center,
//           //             children: <Widget>[
//           //               Text(
//           //                 "For me",
//           //                 textAlign: TextAlign.center,
//           //                 style: Theme.of(context).textTheme.caption.copyWith(
//           //                   color: kPrimary,
//           //                   fontSize: 15,
//           //                 ),
//           //               ),
//           //               Icon(
//           //                 Icons.keyboard_arrow_down,
//           //                 color: kPrimary,
//           //                 size: 20,
//           //               )
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //       Container(
//           //         color: Color(0XFFD8D8D8),
//           //         height: 1,
//           //       ),
//           //       Container(
//           //         color: Color(0XFFFFF1F3F7),
//           //         height: 62,
//           //         child: Row(
//           //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //           children: <Widget>[
//           //             Expanded(
//           //               flex: 1,
//           //               child: ListTileWithLessPadding(
//           //                 myOnTap: () {
//           //                   Get.to(PaymentOptionScreen());
//           //                 },
//           //                 myIcon: Icon(
//           //                   Viiticons.payment,
//           //                   size: 34,
//           //                   color:  kPrimary,
//           //                 ),
//           //                 myText: "Payment",
//           //               ),
//           //             ),
//           //             VerticalDivider(
//           //               color: Color(0XFFD8D8D8),
//           //             ),
//           //             Expanded(
//           //               flex: 1,
//           //               child: ListTileWithLessPadding(
//           //                 myOnTap: () {
//           //                   showDialog(
//           //                     context: context,
//           //                     builder: (context){
//           //                       return PromoBoxWidget(
//           //                         titleText: "Any additional info?",
//           //                         secondaryBtnTxt: "Cancel",
//           //                         primaryBtnTxt: "add",
//           //                         onPrimaryTap: () {
//           //                           Navigator.of(context).pop();
//           //                         },
//           //                         onSecondaryTap: () {
//           //                           Navigator.of(context).pop();
//           //                         },
//           //                       );
//           //
//           //                     },
//           //
//           //                   );
//           //                 },
//           //                 myIcon: Icon(
//           //                   Viiticons.plus,
//           //                   size: 30,
//           //                   color: kPrimary,
//           //                 ),
//           //                 myText: "Addtional info",
//           //               ),
//           //             )
//           //           ],
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
