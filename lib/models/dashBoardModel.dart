class DashBoardModel {
  String? status;
  Data? data;

  DashBoardModel({this.status, this.data});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? subscribed;
  String? sId;
  String? fullName;
  String? email;
  int? iV;

  Data({this.subscribed, this.sId, this.fullName, this.email, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    subscribed = json['subscribed'];
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribed'] = this.subscribed;
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['__v'] = this.iV;
    return data;
  }
}
