// import 'package:connectcars/App/Helpers/ImportFile.dart';
// import 'package:connectcars/App/Helpers/common/my_colors.dart';
// import 'package:connectcars/App/Screens/DrawPolyline/PolyLineViewModel.dart';
//
// import '../editpolyline/PolyLineViewModel.dart';
// import 'flat_Button_Widget.dart';
//
// class Preview_BottomSheet extends StatefulWidget {
//   PolyLineViewModel viewmodel;
//   Preview_BottomSheet({this.viewmodel});
//
//   @override
//   _Preview_BottomSheetState createState() => _Preview_BottomSheetState();
// }
//
// class _Preview_BottomSheetState extends State<Preview_BottomSheet> {
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
//                   fontSize: 28,
//                 ),
//               ),
//             ),
//           ),
//
//
//           Expanded(
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: widget.viewmodel.model.data
//                     .length,
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
//                                     child: Image
//                                         .asset(
//                                       widget.viewmodel.addcar[index]
//                                           .image,
//                                       height: 100,
//                                       width: 100,
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
//                                         width: 180,
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
//                                             widget.viewmodel
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
//                                          widget.viewmodel
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
//                         shadowColor: Colors.black,
//                         elevation: index == 0 ? 6 : 0,
//                       ),
//                     ),
//                   );
//                 },
//               )),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 top: 4,
//                 left: 26,
//                 right: 26,
//                 bottom: 10,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: FlatButtonWidget(
//                       btnColor: kAccentColor,
//                       btnTxt: "Next",
//                       btnOnTap: () async {
//                        // widget.viewmodel.fetchCarModel();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
