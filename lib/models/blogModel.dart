class BlogModel {
  String? status;
  List<Data>? data;

  BlogModel({this.status, this.data});

  BlogModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? blogTitle;
  String? blogContent;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? userImage;

  Data(
      {this.sId,
      this.userId,
      this.userName,
      this.blogTitle,
      this.blogContent,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.userImage});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    blogTitle = json['blog_title'];
    blogContent = json['blog_content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['blog_title'] = this.blogTitle;
    data['blog_content'] = this.blogContent;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['user_image'] = this.userImage;
    return data;
  }
}
