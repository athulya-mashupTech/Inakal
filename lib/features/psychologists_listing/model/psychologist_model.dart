class PsychologistModel {
  List<Doctors>? doctors;
  String? message;
  String? type;

  PsychologistModel({this.doctors, this.message, this.type});

  PsychologistModel.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Doctors {
  String? id;
  String? name;
  String? image;
  String? specializations;

  Doctors({
    this.id,
    this.name,
    this.image,
    this.specializations,
  });

  Doctors.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        specializations = json['specializations'] ?? 'Clinical Psychologist';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['specializations'] = specializations;
    return data;
  }
}
