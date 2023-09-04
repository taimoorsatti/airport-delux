// import 'package:ets_pak/App/Helpers/ImportFile.dart';
//
// class vaisTextField extends StatelessWidget {
//   const vaisTextField({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//      return  Stack(
//     // crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//      Padding(
//      padding: const EdgeInsets.only(left:17,right: 35.0,top: 50),
//      child: MyTextFeild(),
//      ),
//
//      ],
//      );
//   }
// }
// class MyTextFeild extends StatelessWidget {
//   const MyTextFeild({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 45,
//           child: TextFormField(
//             //controller: viewmodel.dropController,
//             style: TextStyle(
//               //color: list[ind].color,
//                 color: Color(0xff2E353B),
//                 fontSize: 13,
//                 fontWeight: FontWeight.w400),
//             decoration: InputDecoration(
//
//               //border: InputBorder.none,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 focusedBorder:OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.black38,),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 enabledBorder:OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.black12,),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 hintText: "PickUp location",
//                 hintStyle:TextStyle(fontSize: 13,color: Colors.black54),
//                 contentPadding: const EdgeInsets.only(left: 10,bottom: 10)
//             ),
//             validator: (v){
//               if(v.trim().isEmpty) return 'Please enter something';
//               return null;
//             },
//
//
//           ),
//         ),
//       ],
//     );
//   }
// }
//
