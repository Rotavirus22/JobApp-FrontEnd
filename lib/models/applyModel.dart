class ApplyModel {
  String? status;
  int? count;
  List<Data>? data;

  ApplyModel({this.status, this.count, this.data});

  ApplyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
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
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? userName;
  String? userImage;
  String? jobId;
  String? jobName;
  String? jobCompany;
  String? expectedSalary;
  String? coverLetter;
  String? pdfUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.userId,
      this.userName,
      this.userImage,
      this.jobId,
      this.jobName,
      this.jobCompany,
      this.expectedSalary,
      this.coverLetter,
      this.pdfUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userImage = json['user_image'];
    jobId = json['job_id'];
    jobName = json['job_name'];
    jobCompany = json['job_company'];
    expectedSalary = json['expected_salary'];
    coverLetter = json['cover_letter'];
    pdfUrl = json['pdf_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['job_id'] = this.jobId;
    data['job_name'] = this.jobName;
    data['job_company'] = this.jobCompany;
    data['expected_salary'] = this.expectedSalary;
    data['cover_letter'] = this.coverLetter;
    data['pdf_url'] = this.pdfUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
