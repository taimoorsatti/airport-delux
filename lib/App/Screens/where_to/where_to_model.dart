class AutoSearchmodel {
  List<Predictions> predictions;
  String status;

  AutoSearchmodel({this.predictions, this.status});

  AutoSearchmodel.fromJson(Map<String, dynamic> json) {
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



class places {
  List<Savedplace> savedplace;

  places({this.savedplace});

  places.fromJson(Map<String, dynamic> json) {
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




















class car {
  List<Data> data;

  car({this.data});

  car.fromJson(Map<String, dynamic> json) {
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
        this.status});

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













class Direction {
  int distanceValue;
  int durationValue;
  String encodedPoints;
  Direction({this.distanceValue, this.durationValue, this.encodedPoints});
}



class nearestLocationModel {
  List htmlAttributions;
  String nextPageToken;
  List<Results> results;
  String status;

  nearestLocationModel(
      {this.htmlAttributions, this.nextPageToken, this.results, this.status});

  nearestLocationModel.fromJson(Map<String, dynamic> json) {
    if (json['html_attributions'] != null) {
      htmlAttributions = <Null>[];
      json['html_attributions'].forEach((v) {
        htmlAttributions.add("k");
      });
    }
    nextPageToken = json['next_page_token'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.htmlAttributions != null) {
      data['html_attributions'] =
          this.htmlAttributions.map((v) => v.toJson()).toList();
    }
    data['next_page_token'] = this.nextPageToken;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Results {
  String businessStatus;
  Geometry geometry;
  String icon;
  String iconBackgroundColor;
  String iconMaskBaseUri;
  String name;
  List<Photos> photos;
  String placeId;
  PlusCode plusCode;
  int priceLevel;
  dynamic rating;
  String reference;
  String scope;
  List<String> types;
  int userRatingsTotal;
  String vicinity;
  OpeningHours openingHours;
  bool permanentlyClosed;

  Results(
      {this.businessStatus,
        this.geometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.photos,
        this.placeId,
        this.plusCode,
        this.priceLevel,
        this.rating,
        this.reference,
        this.scope,
        this.types,
        this.userRatingsTotal,
        this.vicinity,
        this.openingHours,
        this.permanentlyClosed});

  Results.fromJson(Map<String, dynamic> json) {
    businessStatus = json['business_status'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    plusCode = json['plus_code'] != null
        ? new PlusCode.fromJson(json['plus_code'])
        : null;
    priceLevel = json['price_level'];
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'].cast<String>();
    userRatingsTotal = json['user_ratings_total'];
    vicinity = json['vicinity'];
    openingHours = json['opening_hours'] != null
        ? new OpeningHours.fromJson(json['opening_hours'])
        : null;
    permanentlyClosed = json['permanently_closed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_status'] = this.businessStatus;
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    data['icon'] = this.icon;
    data['icon_background_color'] = this.iconBackgroundColor;
    data['icon_mask_base_uri'] = this.iconMaskBaseUri;
    data['name'] = this.name;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['place_id'] = this.placeId;
    if (this.plusCode != null) {
      data['plus_code'] = this.plusCode.toJson();
    }
    data['price_level'] = this.priceLevel;
    data['rating'] = this.rating;
    data['reference'] = this.reference;
    data['scope'] = this.scope;
    data['types'] = this.types;
    data['user_ratings_total'] = this.userRatingsTotal;
    data['vicinity'] = this.vicinity;
    if (this.openingHours != null) {
      data['opening_hours'] = this.openingHours.toJson();
    }
    data['permanently_closed'] = this.permanentlyClosed;
    return data;
  }
}

class Geometry {
  Location location;
  Viewport viewport;

  Geometry({this.location, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    viewport = json['viewport'] != null
        ? new Viewport.fromJson(json['viewport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.viewport != null) {
      data['viewport'] = this.viewport.toJson();
    }
    return data;
  }
}

class Location {
  double lat;
  double lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Viewport {
  Location northeast;
  Location southwest;

  Viewport({this.northeast, this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null
        ? new Location.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? new Location.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest.toJson();
    }
    return data;
  }
}

class Photos {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'].cast<String>();
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['html_attributions'] = this.htmlAttributions;
    data['photo_reference'] = this.photoReference;
    data['width'] = this.width;
    return data;
  }
}

class PlusCode {
  String compoundCode;
  String globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  PlusCode.fromJson(Map<String, dynamic> json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_code'] = this.compoundCode;
    data['global_code'] = this.globalCode;
    return data;
  }
}

class OpeningHours {
  bool openNow;

  OpeningHours({this.openNow});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json['open_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open_now'] = this.openNow;
    return data;
  }
}




class distanceModel {
  List<String> destinationAddresses;
  List<String> originAddresses;
  List<Rows> rows;
  String status;

  distanceModel(
      {this.destinationAddresses,
        this.originAddresses,
        this.rows,
        this.status});

  distanceModel.fromJson(Map<String, dynamic> json) {
    destinationAddresses = json['destination_addresses'].cast<String>();
    originAddresses = json['origin_addresses'].cast<String>();
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destination_addresses'] = this.destinationAddresses;
    data['origin_addresses'] = this.originAddresses;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Rows {
  List<Elements> elements;

  Rows({this.elements});

  Rows.fromJson(Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = <Elements>[];
      json['elements'].forEach((v) {
        elements.add(new Elements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elements != null) {
      data['elements'] = this.elements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Elements {
  Distance distance;
  Distance duration;
  String status;

  Elements({this.distance, this.duration, this.status});

  Elements.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new Distance.fromJson(json['duration'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Distance {
  String text;
  int value;

  Distance({this.text, this.value});

  Distance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}



class PlaceDetails {
  List htmlAttributions;
  Result result;
  String status;

  PlaceDetails({this.htmlAttributions, this.result, this.status});

  PlaceDetails.fromJson(Map<String, dynamic> json) {
    if (json['html_attributions'] != null) {
      htmlAttributions = <Null>[];
      // json['html_attributions'].forEach((v) {
      //  // htmlAttributions.add(new .fromJson(v));
      // });
    }
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.htmlAttributions != null) {
      data['html_attributions'] =
          this.htmlAttributions.map((v) => v.toJson()).toList();
    }
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  List<AddressComponents> addressComponents;
  String adrAddress;
  String businessStatus;
  String formattedAddress;
  Geometry detailGeometry;
  String icon;
  String iconBackgroundColor;
  String iconMaskBaseUri;
  String name;
  List<Photos> detailsPhotos;
  String placeId;
  double rating;
  String reference;
  List<Reviews> reviews;
  List<String> types;
  String url;
  int userRatingsTotal;
  int utcOffset;
  String vicinity;
  bool wheelchairAccessibleEntrance;

  Result(
      {this.addressComponents,
        this.adrAddress,
        this.businessStatus,
        this.formattedAddress,
        this.detailGeometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.detailsPhotos,
        this.placeId,
        this.rating,
        this.reference,
        this.reviews,
        this.types,
        this.url,
        this.userRatingsTotal,
        this.utcOffset,
        this.vicinity,
        this.wheelchairAccessibleEntrance});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['address_components'] != null) {
      addressComponents = <AddressComponents>[];
      json['address_components'].forEach((v) {
        addressComponents.add(new AddressComponents.fromJson(v));
      });
    }
    adrAddress = json['adr_address'];
    businessStatus = json['business_status'];
    formattedAddress = json['formatted_address'];
    detailGeometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    if (json['photos'] != null) {
      detailsPhotos = <Photos>[];
      json['photos'].forEach((v) {
        detailsPhotos.add(new Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    rating = json['rating'];
    reference = json['reference'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
    types = json['types'].cast<String>();
    url = json['url'];
    userRatingsTotal = json['user_ratings_total'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    wheelchairAccessibleEntrance = json['wheelchair_accessible_entrance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressComponents != null) {
      data['address_components'] =
          this.addressComponents.map((v) => v.toJson()).toList();
    }
    data['adr_address'] = this.adrAddress;
    data['business_status'] = this.businessStatus;
    data['formatted_address'] = this.formattedAddress;
    if (this.detailGeometry!= null) {
      data['geometry'] = this.detailGeometry.toJson();
    }
    data['icon'] = this.icon;
    data['icon_background_color'] = this.iconBackgroundColor;
    data['icon_mask_base_uri'] = this.iconMaskBaseUri;
    data['name'] = this.name;
    if (this.detailsPhotos != null) {
      data['photos'] = this.detailsPhotos.map((v) => v.toJson()).toList();
    }
    data['place_id'] = this.placeId;
    data['rating'] = this.rating;
    data['reference'] = this.reference;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    data['types'] = this.types;
    data['url'] = this.url;
    data['user_ratings_total'] = this.userRatingsTotal;
    data['utc_offset'] = this.utcOffset;
    data['vicinity'] = this.vicinity;
    data['wheelchair_accessible_entrance'] = this.wheelchairAccessibleEntrance;
    return data;
  }
}

class AddressComponents {
  String longName;
  String shortName;
  List<String> types;

  AddressComponents({this.longName, this.shortName, this.types});

  AddressComponents.fromJson(Map<String, dynamic> json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['long_name'] = this.longName;
    data['short_name'] = this.shortName;
    data['types'] = this.types;
    return data;
  }
}

class detailGeometry {
  Location DetailsLocation;
  Viewport DetailsViewport;

  detailGeometry({this.DetailsLocation, this.DetailsViewport});

  detailGeometry.fromJson(Map<String, dynamic> json) {
    DetailsLocation = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    DetailsViewport = json['viewport'] != null
        ? new Viewport.fromJson(json['viewport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.DetailsLocation != null) {
      data['location'] = this.DetailsLocation.toJson();
    }
    if (this.DetailsViewport != null) {
      data['viewport'] = this.DetailsViewport.toJson();
    }
    return data;
  }
}

class DetailsLocation {
  double lat;
  double lng;

  DetailsLocation({this.lat, this.lng});

  DetailsLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class DetailsViewport {
  Location northeast;
  Location southwest;

  DetailsViewport({this.northeast, this.southwest});

  DetailsViewport.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null
        ? new Location.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? new Location.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest.toJson();
    }
    return data;
  }
}

class detailsPhotos{
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  detailsPhotos({this.height, this.htmlAttributions, this.photoReference, this.width});

  detailsPhotos.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'].cast<String>();
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['html_attributions'] = this.htmlAttributions;
    data['photo_reference'] = this.photoReference;
    data['width'] = this.width;
    return data;
  }
}

class Reviews {
  String authorName;
  String authorUrl;
  String language;
  String originalLanguage;
  String profilePhotoUrl;
  int rating;
  String relativeTimeDescription;
  String text;
  int time;
  bool translated;

  Reviews(
      {this.authorName,
        this.authorUrl,
        this.language,
        this.originalLanguage,
        this.profilePhotoUrl,
        this.rating,
        this.relativeTimeDescription,
        this.text,
        this.time,
        this.translated});

  Reviews.fromJson(Map<String, dynamic> json) {
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    language = json['language'];
    originalLanguage = json['original_language'];
    profilePhotoUrl = json['profile_photo_url'];
    rating = json['rating'];
    relativeTimeDescription = json['relative_time_description'];
    text = json['text'];
    time = json['time'];
    translated = json['translated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_name'] = this.authorName;
    data['author_url'] = this.authorUrl;
    data['language'] = this.language;
    data['original_language'] = this.originalLanguage;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['rating'] = this.rating;
    data['relative_time_description'] = this.relativeTimeDescription;
    data['text'] = this.text;
    data['time'] = this.time;
    data['translated'] = this.translated;
    return data;
  }
}