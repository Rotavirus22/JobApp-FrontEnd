class JobModel {
  String? status;
  List<Data>? data;

  JobModel({this.status, this.data});

  JobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? jobTitle;
  String? userImage;
  String? userName;
  String? jobDescription;
  String? company;
  String? estimatedSalary;
  String? location;
  String? jobNature;
  String? endDate;
  String? jobStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.userId,
      this.jobTitle,
      this.userImage,
      this.userName,
      this.jobDescription,
      this.company,
      this.estimatedSalary,
      this.location,
      this.jobNature,
      this.endDate,
      this.jobStatus,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    jobTitle = json['job_title'];
    userImage = json['user_image'];
    userName = json['user_name'];
    jobDescription = json['job_description'];
    company = json['company'];
    estimatedSalary = json['estimated_salary'];
    location = json['location'];
    jobNature = json['job_nature'];
    endDate = json['end_date'];
    jobStatus = json['job_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['job_title'] = this.jobTitle;
    data['user_image'] = this.userImage;
    data['user_name'] = this.userName;
    data['job_description'] = this.jobDescription;
    data['company'] = this.company;
    data['estimated_salary'] = this.estimatedSalary;
    data['location'] = this.location;
    data['job_nature'] = this.jobNature;
    data['end_date'] = this.endDate;
    data['job_status'] = this.jobStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
