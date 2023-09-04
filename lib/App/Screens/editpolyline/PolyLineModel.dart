class Carmodel {
  List<Data> data;

  Carmodel({this.data});

  Carmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



// class CarRateModel {
//   int saloonStandardRate;
//   int saloonTwowayRate;
//   int estateStandardRate;
//   int estateTwowayRate;
//   int executiveStandardRate;
//   int peoplecarrierStandardRate;
//   int peoplecarrierTwowayRate;
//   int minibusStandardRate;
//   int miniBusTwoway;
//   int executiveMinibusStandardRate;
//   int executiveMiniBusTwoway;
//
//
//   CarRateModel(
//       {this.saloonStandardRate,
//         this.saloonTwowayRate,
//         this.estateStandardRate,
//         this.estateTwowayRate,
//         this.executiveStandardRate,
//         this.peoplecarrierStandardRate,
//         this.peoplecarrierTwowayRate,
//         this.minibusStandardRate,
//         this.miniBusTwoway,
//         this.executiveMinibusStandardRate,
//         this.executiveMiniBusTwoway,
//         this.onewayrate,
//         this.twowayrate
//       });
//
//   CarRateModel.fromJson(Map<String, dynamic> json) {
//     saloonStandardRate = json['saloonStandardRate'];
//     saloonTwowayRate = json['saloonTwowayRate'];
//     estateStandardRate = json['estateStandardRate'];
//     estateTwowayRate = json['estateTwowayRate'];
//     executiveStandardRate = json['executiveStandardRate'];
//     peoplecarrierStandardRate = json['peoplecarrierStandardRate'];
//     peoplecarrierTwowayRate = json['peoplecarrierTwowayRate'];
//     minibusStandardRate = json['minibusStandardRate'];
//     miniBusTwoway = json['miniBusTwoway'];
//     executiveMinibusStandardRate = json['executiveMinibusStandardRate'];
//     executiveMiniBusTwoway = json['executiveMiniBusTwoway'];
//     onewayrate= json['onewayrate'];
//     twowayrate=json["twowayrate"];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['saloonStandardRate'] = this.saloonStandardRate;
//     data['saloonTwowayRate'] = this.saloonTwowayRate;
//     data['estateStandardRate'] = this.estateStandardRate;
//     data['estateTwowayRate'] = this.estateTwowayRate;
//     data['executiveStandardRate'] = this.executiveStandardRate;
//     data['peoplecarrierStandardRate'] = this.peoplecarrierStandardRate;
//     data['peoplecarrierTwowayRate'] = this.peoplecarrierTwowayRate;
//     data['minibusStandardRate'] = this.minibusStandardRate;
//     data['miniBusTwoway'] = this.miniBusTwoway;
//     data['executiveMinibusStandardRate'] = this.executiveMinibusStandardRate;
//     data['executiveMiniBusTwoway'] = this.executiveMiniBusTwoway;
//      data['onewayrate']=this.twowayrate;
//     data["twowayrate"]=this.twowayrate;
//     return data;
//   }
// }









class Data {
  String id;
  String name;
  String onewayrate;
  String twowayrate;
  String passengers;
  String luggage;
  String handLuggage;
  String quantity;
  String vehicleImage;
  String fixedUplift;
  String percentUplift;
  String standardRate;
  String outofHrsRate;
  String status;


  Data(
      {this.id,
        this.name,
        this.onewayrate,
        this.twowayrate,
        this.passengers,
        this.luggage,
        this.handLuggage,
        this.quantity,
        this.vehicleImage,
        this.fixedUplift,
        this.percentUplift,
        this.standardRate,
        this.outofHrsRate,
        this.status}
        );

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    onewayrate = json['onewayrate'];
    twowayrate = json['twowayrate'];
    passengers = json['passengers'];
    luggage = json['luggage'];
    handLuggage = json['handLuggage'];
    quantity = json['quantity'];
    vehicleImage = json['vehicleImage'];
    fixedUplift = json['fixedUplift'];
    percentUplift = json['percentUplift'];
    standardRate = json['standardRate'];
    outofHrsRate = json['outofHrsRate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['onewayrate'] = this.onewayrate;
    data['twowayrate'] = this.twowayrate;
    data['passengers'] = this.passengers;
    data['luggage'] = this.luggage;
    data['handLuggage'] = this.handLuggage;
    data['quantity'] = this.quantity;
    data['vehicleImage'] = this.vehicleImage;
    data['fixedUplift'] = this.fixedUplift;
    data['percentUplift'] = this.percentUplift;
    data['standardRate'] = this.standardRate;
    data['outofHrsRate'] = this.outofHrsRate;
    data['status'] = this.status;
    return data;
  }
}

















class DirectionDetail{
  int distanceValue;
  int durationValue;
  String durationText;
  String distanceText;
  String encodePoint;
  DirectionDetail({this.distanceValue,this.durationValue,this.durationText,this.distanceText,this.encodePoint});
}





class currentUserModel {
  List<CurrntData> data;

  currentUserModel({this.data});

  currentUserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CurrntData>[];
      json['data'].forEach((v) {
        data.add(new CurrntData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrntData {
  String id;
  String firstName;
  String lastName;
  String emailAddress;
  String mobileNumber;
  String guestWhatsapp;

  CurrntData(
      {this.id,
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.mobileNumber,
        this.guestWhatsapp});

  CurrntData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    mobileNumber = json['mobileNumber'];
    guestWhatsapp = json['guestWhatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailAddress'] = this.emailAddress;
    data['mobileNumber'] = this.mobileNumber;
    data['guestWhatsapp'] = this.guestWhatsapp;
    return data;
  }
}




