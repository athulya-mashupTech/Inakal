class InboxModel {
  List<InboxUser>? inboxUser;
  String? message;
  String? type;

  InboxModel({this.inboxUser, this.message, this.type});

  InboxModel.fromJson(Map<String, dynamic> json) {
    if (json['inboxUser'] != null) {
      inboxUser = <InboxUser>[];
      json['inboxUser'].forEach((v) {
        inboxUser!.add(new InboxUser.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inboxUser != null) {
      data['inboxUser'] = this.inboxUser!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class InboxUser {
  String? userId;
  String? name;
  String? image;
  String? lastMessage;
  String? lastMessageTime;
  bool? lastMessageByMe;
  int? unreadMsgs;

  InboxUser(
      {this.userId,
      this.name,
      this.image,
      this.lastMessage,
      this.lastMessageTime,
      this.lastMessageByMe,
      this.unreadMsgs});

  InboxUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    image = json['image'];
    lastMessage = json['lastMessage'];
    lastMessageTime = json['lastMessageTime'];
    lastMessageByMe = json['lastMessageByMe'];
    unreadMsgs = json['unreadMsgs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['lastMessage'] = this.lastMessage;
    data['lastMessageTime'] = this.lastMessageTime;
    data['lastMessageByMe'] = this.lastMessageByMe;
    data['unreadMsgs'] = this.unreadMsgs;
    return data;
  }
}
