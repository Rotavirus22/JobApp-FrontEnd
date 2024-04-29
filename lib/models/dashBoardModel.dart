class DashboardModel {
  String? status;
  Data? data;

  DashboardModel({this.status, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? fullName;
  String? email;
  String? workPosition;
  bool? isSubscribed;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.fullName,
      this.email,
      this.workPosition,
      this.isSubscribed,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    workPosition = json['workPosition'];
    isSubscribed = json['isSubscribed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['workPosition'] = this.workPosition;
    data['isSubscribed'] = this.isSubscribed;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
