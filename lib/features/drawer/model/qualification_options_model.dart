class QualificationOptionsModel {
  List<Qualifications>? qualifications;
  String? message;
  String? type;

  QualificationOptionsModel({this.qualifications, this.message, this.type});

  QualificationOptionsModel.fromJson(Map<String, dynamic> json) {
    if (json['qualifications'] != null) {
      qualifications = <Qualifications>[];
      json['qualifications'].forEach((v) {
        qualifications!.add(new Qualifications.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.qualifications != null) {
      data['qualifications'] =
          this.qualifications!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Qualifications {
  String? id;
  String? name;
  String? educationId;
  String? status;

  Qualifications({this.id, this.name, this.educationId, this.status});

  Qualifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    educationId = json['education_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['education_id'] = this.educationId;
    data['status'] = this.status;
    return data;
  }
}
