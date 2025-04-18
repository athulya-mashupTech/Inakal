class LoginModel {
  String? token;
  String? userId;
  String? message;
  String? type;

  LoginModel({this.token, this.userId, this.message, this.type});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}
