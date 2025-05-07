class MobileNumberCheckModel {
  bool? exists;
  String? message;
  String? type;
  int? otp;

  MobileNumberCheckModel({this.exists, this.message, this.type, this.otp});

  MobileNumberCheckModel.fromJson(Map<String, dynamic> json) {
    exists = json['exists'];
    message = json['message'];
    type = json['type'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exists'] = this.exists;
    data['message'] = this.message;
    data['type'] = this.type;
    data['otp'] = this.otp;
    return data;
  }
}
