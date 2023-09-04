// class model {
//   List<Data> data;
//
//   Carmodel({this.data});
//
//   Carmodel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String id;
//   String name;
//   String onewayrate;
//   String twowayrate;
//   String passengers;
//   String luggage;
//   String handLuggage;
//   String quantity;
//   String vehicleImage;
//   String fixedUplift;
//   String percentUplift;
//   String standardRate;
//   String outofHrsRate;
//   String status;
//
//   Data(
//       {this.id,
//         this.name,
//         this.onewayrate,
//         this.twowayrate,
//         this.passengers,
//         this.luggage,
//         this.handLuggage,
//         this.quantity,
//         this.vehicleImage,
//         this.fixedUplift,
//         this.percentUplift,
//         this.standardRate,
//         this.outofHrsRate,
//         this.status}
//         );
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     onewayrate = json['onewayrate'];
//     twowayrate = json['twowayrate'];
//     passengers = json['passengers'];
//     luggage = json['luggage'];
//     handLuggage = json['handLuggage'];
//     quantity = json['quantity'];
//     vehicleImage = json['vehicleImage'];
//     fixedUplift = json['fixedUplift'];
//     percentUplift = json['percentUplift'];
//     standardRate = json['standardRate'];
//     outofHrsRate = json['outofHrsRate'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['onewayrate'] = this.onewayrate;
//     data['twowayrate'] = this.twowayrate;
//     data['passengers'] = this.passengers;
//     data['luggage'] = this.luggage;
//     data['handLuggage'] = this.handLuggage;
//     data['quantity'] = this.quantity;
//     data['vehicleImage'] = this.vehicleImage;
//     data['fixedUplift'] = this.fixedUplift;
//     data['percentUplift'] = this.percentUplift;
//     data['standardRate'] = this.standardRate;
//     data['outofHrsRate'] = this.outofHrsRate;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
//
//
//
//
// class DirectionDetail{
//   int distanceValue;
//   int durationValue;
//   String durationText;
//   String distanceText;
//   DirectionDetail({this.distanceValue,this.durationValue,this.durationText,this.distanceText});
// }
