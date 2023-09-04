
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class Favourite{

  String popularlocation;
  int favourite;
  Favourite({this.favourite,this.popularlocation});

}












class AutoSearchmodelForFavourite{
  List<Predictions> predictions;
  String status;

  AutoSearchmodelForFavourite({this.predictions, this.status});

  AutoSearchmodelForFavourite.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions.add(new Predictions.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.predictions != null) {
      data['predictions'] = this.predictions.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}


class Predictions {
  String description;
  String placeId;
  String reference;
  StructuredFormatting structuredFormatting;
  List<Terms> terms;
  List<String> types;

  Predictions(
      {this.description,
        this.placeId,
        this.reference,
        this.structuredFormatting,
        this.terms,
        this.types});

  Predictions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
    reference = json['reference'];
    structuredFormatting = json['structured_formatting'] != null
        ? new StructuredFormatting.fromJson(json['structured_formatting'])
        : null;
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms.add(new Terms.fromJson(v));
      });
    }
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['place_id'] = this.placeId;
    data['reference'] = this.reference;
    if (this.structuredFormatting != null) {
      data['structured_formatting'] = this.structuredFormatting.toJson();
    }
    if (this.terms != null) {
      data['terms'] = this.terms.map((v) => v.toJson()).toList();
    }
    data['types'] = this.types;
    return data;
  }
}

class StructuredFormatting {
  String mainText;
  List<MainTextMatchedSubstrings> mainTextMatchedSubstrings;
  String secondaryText;

  StructuredFormatting(
      {this.mainText, this.mainTextMatchedSubstrings, this.secondaryText});

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      mainTextMatchedSubstrings = <MainTextMatchedSubstrings>[];
      json['main_text_matched_substrings'].forEach((v) {
        mainTextMatchedSubstrings
            .add(new MainTextMatchedSubstrings.fromJson(v));
      });
    }
    secondaryText = json['secondary_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_text'] = this.mainText;
    if (this.mainTextMatchedSubstrings != null) {
      data['main_text_matched_substrings'] =
          this.mainTextMatchedSubstrings.map((v) => v.toJson()).toList();
    }
    data['secondary_text'] = this.secondaryText;
    return data;
  }
}

class MainTextMatchedSubstrings {
  int length;
  int offset;

  MainTextMatchedSubstrings({this.length, this.offset});

  MainTextMatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['offset'] = this.offset;
    return data;
  }
}
class Terms {
  int offset;
  String value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['value'] = this.value;
    return data;
  }
}


class placesForFavourite {
  List<Savedplace> savedplace;

  placesForFavourite({this.savedplace});

  placesForFavourite.fromJson(Map<String, dynamic> json) {
    if (json['savedplace'] != null) {
      savedplace = <Savedplace>[];
      json['savedplace'].forEach((v) {
        savedplace.add(new Savedplace.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.savedplace != null) {
      data['savedplace'] = this.savedplace.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Savedplace {
  String id;
  String placePrimary;
  String placeSecondary;

  Savedplace({this.id, this.placePrimary, this.placeSecondary});

  Savedplace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placePrimary = json['place_primary'];
    placeSecondary = json['place_secondary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['place_primary'] = this.placePrimary;
    data['place_secondary'] = this.placeSecondary;
    return data;
  }
}





class SetAddress {
  List<FavouritePlaces> favouritePlaces;

  SetAddress({this.favouritePlaces});

  SetAddress.fromJson(Map<String, dynamic> json) {
    if (json['favouritePlaces'] != null) {
      favouritePlaces = <FavouritePlaces>[];
      json['favouritePlaces'].forEach((v) {
        favouritePlaces.add(new FavouritePlaces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favouritePlaces != null) {
      data['favouritePlaces'] =
          this.favouritePlaces.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavouritePlaces {
  String work;
  String home;
  String gym;

  FavouritePlaces({this.work, this.home, this.gym});

  FavouritePlaces.fromJson(Map<String, dynamic> json) {
    work = json['work'];
    home = json['home'];
    gym = json['gym'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['work'] = this.work;
    data['home'] = this.home;
    data['gym'] = this.gym;
    return data;
  }
}





class bookingRecord {
  List<Data> data;

  bookingRecord({this.data});

  bookingRecord.fromJson(Map<String, dynamic> json) {
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

class Data {
  String pickuplocation;
  String dropofflocation;
  String vias;
  String pickupdate;
  String returnDate;
  String pickuptime;
  String returnTime;
  String ride;
  String payment;
  String distance;
  String price;
  String status;
  String vehicleSelected;
  String bookingDate;

  Data(
      {this.pickuplocation,
        this.dropofflocation,
        this.vias,
        this.pickupdate,
        this.returnDate,
        this.pickuptime,
        this.returnTime,
        this.ride,
        this.payment,
        this.distance,
        this.price,
        this.status,
        this.vehicleSelected,
        this.bookingDate});

  Data.fromJson(Map<String, dynamic> json) {
    pickuplocation = json['pickuplocation'];
    dropofflocation = json['dropofflocation'];
    vias = json['vias'];
    pickupdate = json['pickupdate'];
    returnDate = json['returnDate'];
    pickuptime = json['pickuptime'];
    returnTime = json['returnTime'];
    ride = json['ride'];
    payment = json['payment'];
    distance = json['distance'];
    price = json['Price'];
    status = json['status'];
    vehicleSelected = json['VehicleSelected'];
    bookingDate = json['BookingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickuplocation'] = this.pickuplocation;
    data['dropofflocation'] = this.dropofflocation;
    data['vias'] = this.vias;
    data['pickupdate'] = this.pickupdate;
    data['returnDate'] = this.returnDate;
    data['pickuptime'] = this.pickuptime;
    data['returnTime'] = this.returnTime;
    data['ride'] = this.ride;
    data['payment'] = this.payment;
    data['distance'] = this.distance;
    data['Price'] = this.price;
    data['status'] = this.status;
    data['VehicleSelected'] = this.vehicleSelected;
    data['BookingDate'] = this.bookingDate;
    return data;
  }
}


