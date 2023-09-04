class signUPModel {
  dynamic success;
  String message;
  String id;

  signUPModel({this.success, this.message});

  signUPModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    id=json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data["id"]=this.id;
    return data;
  }
}


class getUserId {
  List<Id> id;

  getUserId({this.id});

  getUserId.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = <Id>[];
      json['id'].forEach((v) {
        id.add(new Id.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Id {
  String id;

  Id({this.id});

  Id.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}