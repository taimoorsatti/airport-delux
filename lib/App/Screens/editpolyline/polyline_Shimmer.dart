// import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
// import 'package:connectcars/App/Helpers/ImportFile.dart';
// import 'package:connectcars/App/Helpers/common/my_colors.dart';
// import 'package:shimmer/shimmer.dart';
//
// class PolyLineShimerScreen extends StatefulWidget {
//   BoxConstraints constraints;
//  PolyLineShimerScreen({this.constraints});
//
//   @override
//   _PolyLineShimerScreenState createState() => _PolyLineShimerScreenState();
// }
//
// class _PolyLineShimerScreenState extends State<PolyLineShimerScreen> {
//   bool _enabled = true;
//   @override
//   Widget build(BuildContext context) {
//     return  Expanded(
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Expanded(
//               child: Shimmer.fromColors(
//                 baseColor: Colors.grey[300],
//                 highlightColor: Colors.grey[100],
//                 enabled: _enabled,
//                 child: Column(
//                   children: [
//                     Container(
//                         height: widget.constraints.maxHeight*0.5,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(
//                               10,
//                             ))
//                     ),
//                 Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Container(
//                                   height: 30,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: Colors.white,
//                                   ),
//
//                                   margin: EdgeInsets.only(top: 10),
//                                 ),
//                               ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemBuilder: (_, __) => Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(
//                                         100/2,
//                                       ))
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Container(
//                                         width: MediaQuery.of(context).size.width-270,
//                                         height:20,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(
//                                               5,
//                                             ))
//
//                                     ),
//                                     const Padding(
//                                       padding: EdgeInsets.symmetric(vertical: 5.0),
//                                     ),
//                                     Container(
//                                         width: double.infinity,
//                                         height: 20.0,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(
//                                                 5
//                                             ))
//
//                                     ),
//                                     const Padding(
//                                       padding: EdgeInsets.symmetric(vertical: 5.0),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Container(
//                                           width: 40.0,
//                                           height: 8.0,
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius.circular(
//                                                 5,
//                                               ))
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         itemCount: 6,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );;
//   }
// }
