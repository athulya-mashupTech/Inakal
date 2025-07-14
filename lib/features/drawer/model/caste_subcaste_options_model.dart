class CasteSubcasteOptionsModel {
  List<Castes>? castes;
  List<Subcastes>? subcastes;
  String? message;
  String? type;

  CasteSubcasteOptionsModel(
      {this.castes, this.subcastes, this.message, this.type});

  CasteSubcasteOptionsModel.fromJson(Map<String, dynamic> json) {
    if (json['castes'] != null) {
      castes = <Castes>[];
      json['castes'].forEach((v) {
        castes!.add(new Castes.fromJson(v));
      });
    }
    if (json['subcastes'] != null) {
      subcastes = <Subcastes>[];
      json['subcastes'].forEach((v) {
        subcastes!.add(new Subcastes.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.castes != null) {
      data['castes'] = this.castes!.map((v) => v.toJson()).toList();
    }
    if (this.subcastes != null) {
      data['subcastes'] = this.subcastes!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Castes {
  String? id;
  String? name;
  String? religionId;
  String? status;

  Castes({this.id, this.name, this.religionId, this.status});

  Castes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    religionId = json['religion_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['religion_id'] = this.religionId;
    data['status'] = this.status;
    return data;
  }
}

class Subcastes {
  String? id;
  String? name;
  String? religionId;
  String? status;

  Subcastes({this.id, this.name, this.religionId, this.status});

  Subcastes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    religionId = json['religion_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['religion_id'] = this.religionId;
    data['status'] = this.status;
    return data;
  }
}
