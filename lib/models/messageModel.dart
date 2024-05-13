class MessageModel {
  String? senderId;
  String? sender;
  String? receiverId;
  String? receiver;
  String? content;
  bool? seen;
  String? image;
  String? senderImage;
  DateTime? createdOn;
  Type? type;
  MessageModel(
      {this.senderId,
      this.sender,
      this.receiverId,
      this.receiver,
      this.content,
      this.seen,
      this.createdOn,
      this.image,
      this.type,
      this.senderImage});

  MessageModel.fromMap(Map<String, dynamic> map) {
    senderId = map["senderId"].toString();
    sender = map["sender"].toString();
    receiverId = map["receiverId"].toString();
    receiver = map["receiver"].toString();
    content = map["content"].toString();
    image = map["image"].toString();
    senderImage = map["senderImage"].toString();
    seen = map["seen"];
    createdOn = map["createdOn"].toDate();
    type = map["type"].toString() == Type.image.name ? Type.image : Type.text;
  }
  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "image": image,
      "sender": sender,
      "senderImage": senderImage,
      "receiverId": receiverId,
      "receiver": receiver,
      "content": content,
      "seen": seen,
      "createdOn": createdOn,
      "type": type?.name,
    };
  }
}

enum Type { text, image }
