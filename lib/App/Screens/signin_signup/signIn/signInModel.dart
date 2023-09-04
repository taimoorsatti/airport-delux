class loginModel {
  String message;
  bool error;

  loginModel({this.message,this.error});

  loginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error=json["error"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error']=this.error;
    return data;
  }
}