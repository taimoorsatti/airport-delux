// import 'package:ets_pak/App/Helpers/ImportFile.dart';
// import 'package:shimmer/shimmer.dart';
//
// class LoadingListPage extends StatefulWidget {
//   @override
//   _LoadingListPageState createState() => _LoadingListPageState();
// }
//
// class _LoadingListPageState extends State<LoadingListPage> {
//   bool _enabled = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//           child: Expanded(
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300],
//               highlightColor: Colors.grey[100],
//               enabled: _enabled,
//               child: ListView.builder(
//                 itemBuilder: (_, __) => Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         width: 48.0,
//                         height: 48.0,
//                         color: Colors.white,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8.0),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Container(
//                               width: double.infinity,
//                               height: 8.0,
//                               color: Colors.white,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 2.0),
//                             ),
//                             Container(
//                               width: double.infinity,
//                               height: 8.0,
//                               color: Colors.white,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(vertical: 2.0),
//                             ),
//                             Container(
//                               width: 40.0,
//                               height: 8.0,
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 itemCount: 6,
//               ),
//             ),
//           ),
//
//       ),
//     );
//   }
// }