// import 'package:flutter/material.dart';
//
//
//
//
// class bottomSheetScreen extends StatefulWidget {
//   bottomSheetScreen({Key key,  this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _bottomSheetScreenState createState() => _bottomSheetScreenState();
// }
//
// class _bottomSheetScreenState extends State<bottomSheetScreen> {
//   ScrollController listScrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("bottomSheet"),
//       ),
//
//       // Floating action button implemented with the
//       // auto scroll function to the bottom of list
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (listScrollController.hasClients) {
//             final position = listScrollController.position.minScrollExtent;
//             listScrollController.animateTo(
//               position,
//               duration: Duration(seconds: 3),
//               curve: Curves.easeOut,
//             );
//           }
//         },
//         isExtended: true,
//         tooltip: "Scroll to Bottom",
//         child: Icon(Icons.arrow_downward),
//       ),
//
//       // ListView with 100 list items
//       body: ListView.builder(
//
//         // Scroll Controller for functionality
//         controller: listScrollController,
//         itemCount: 100,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text("Item ${index + 1}"),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';

import '../Helpers/ImportFile.dart';
import '../Helpers/common/my_colors.dart';

class CheckBottomSheet extends StatefulWidget {
  const CheckBottomSheet({Key key}) : super(key: key);


  @override
  _CheckBottomSheetState createState() => _CheckBottomSheetState();
}

class _CheckBottomSheetState extends State<CheckBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DraggableBottomSheet(
            backgroundWidget: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    height: 300,
                    color: Color(0xffF6F6F6),
                  ),
                ],
              ),
            ),

            previewChild: PreviewChild(),
            expandedChild:expandedChild(),

            minExtent: 300,
            maxExtent: 600,
          ),

        ],
      ));

  }
  Widget PreviewChild(){
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              //color of shadow
              spreadRadius: 5,
              //spread radius
              blurRadius: 7,
              // blur radius
              offset: Offset(
                  0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            width: 100,
            height: 6,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10)),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                //Get.to(BottomSheetScreen());
              },
              child: InkWell(

                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    "Ride details",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(
                      color: kLoginBlack,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Container(
                //   color: Color(0XFFD8D8D8),
                //   height: 1,
                // ),

                // GestureDetector(
                //   onTap: () {
                //    Get.to(RattingScreen());
                //   },
                //   child: Container(
                //     height: 36,
                //     width: double.infinity,
                //     color: Colors.white,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         // Text(
                //         //   "For me",
                //         //   textAlign: TextAlign.center,
                //         //   style: Theme.of(context).textTheme.caption.copyWith(
                //         //     color: kPrimary,
                //         //     fontSize: 15,
                //         //   ),
                //         // ),
                //         // Icon(
                //         //   Icons.keyboard_arrow_down,
                //         //   color: kPrimary,
                //         //   size: 20,
                //         // )
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   color: Color(0XFFD8D8D8),
                //   height: 1,
                // ),
              ],
            ),
          ),

        ],
      ),
    );
  }


  Widget expandedChild(){
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              //color of shadow
              spreadRadius: 5,
              //spread radius
              blurRadius: 7,
              // blur radius
              offset: Offset(
                  0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            width: 100,
            height: 6,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(
                    10)),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "click here",
                style:
                Theme
                    .of(context)
                    .textTheme
                    .caption
                    .copyWith(
                  color: kLoginBlack,
                  fontSize: 24,
                ),
              ),
            ),
          ),



          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //       top: 4,
          //       left: 26,
          //       right: 26,
          //       bottom: 10,
          //     ),
          //     child: Row(
          //       children: <Widget>[
          //         Expanded(
          //           child: FlatButtonWidget(
          //             btnColor: kAccentColor,
          //             btnTxt: "Next",
          //             btnOnTap: () async {
          //               viewmodel.fetchCarModel();
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       Container(
          //         color: Color(0XFFD8D8D8),
          //         height: 1,
          //       ),
          //
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(RattingScreen());
          //         },
          //         child: Container(
          //           height: 36,
          //           width: double.infinity,
          //           color: Colors.white,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               Text(
          //                 "For me",
          //                 textAlign: TextAlign.center,
          //                 style: Theme.of(context).textTheme.caption.copyWith(
          //                   color: kPrimary,
          //                   fontSize: 15,
          //                 ),
          //               ),
          //               Icon(
          //                 Icons.keyboard_arrow_down,
          //                 color: kPrimary,
          //                 size: 20,
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         color: Color(0XFFD8D8D8),
          //         height: 1,
          //       ),
          //       Container(
          //         color: Color(0XFFFFF1F3F7),
          //         height: 62,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: <Widget>[
          //             Expanded(
          //               flex: 1,
          //               child: ListTileWithLessPadding(
          //                 myOnTap: () {
          //                   Get.to(PaymentOptionScreen());
          //                 },
          //                 myIcon: Icon(
          //                   Viiticons.payment,
          //                   size: 34,
          //                   color:  kPrimary,
          //                 ),
          //                 myText: "Payment",
          //               ),
          //             ),
          //             VerticalDivider(
          //               color: Color(0XFFD8D8D8),
          //             ),
          //             Expanded(
          //               flex: 1,
          //               child: ListTileWithLessPadding(
          //                 myOnTap: () {
          //                   showDialog(
          //                     context: context,
          //                     builder: (context){
          //                       return PromoBoxWidget(
          //                         titleText: "Any additional info?",
          //                         secondaryBtnTxt: "Cancel",
          //                         primaryBtnTxt: "add",
          //                         onPrimaryTap: () {
          //                           Navigator.of(context).pop();
          //                         },
          //                         onSecondaryTap: () {
          //                           Navigator.of(context).pop();
          //                         },
          //                       );
          //
          //                     },
          //
          //                   );
          //                 },
          //                 myIcon: Icon(
          //                   Viiticons.plus,
          //                   size: 30,
          //                   color: kPrimary,
          //                 ),
          //                 myText: "Addtional info",
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }


}
