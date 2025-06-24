class CheckAppointmentModel {
  Appointment? appointment;
  String? message;
  String? type;

  CheckAppointmentModel({this.appointment, this.message, this.type});

  CheckAppointmentModel.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'] != null
        ? new Appointment.fromJson(json['appointment'])
        : null;
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointment != null) {
      data['appointment'] = this.appointment!.toJson();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Appointment {
  String? id;
  Null? doctor;
  String? client;
  String? created;
  Null? assigned;
  String? status;
  String? remarks;

  Appointment(
      {this.id,
      this.doctor,
      this.client,
      this.created,
      this.assigned,
      this.status,
      this.remarks});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'];
    client = json['client'];
    created = json['created'];
    assigned = json['assigned'];
    status = json['status'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor'] = this.doctor;
    data['client'] = this.client;
    data['created'] = this.created;
    data['assigned'] = this.assigned;
    data['status'] = this.status;
    data['remarks'] = this.remarks;
    return data;
  }
}
