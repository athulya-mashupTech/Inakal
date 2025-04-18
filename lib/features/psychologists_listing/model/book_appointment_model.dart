class BookAppointmentModel {
  String? message;
  String? type;

  BookAppointmentModel({this.message, this.type});

  BookAppointmentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}
