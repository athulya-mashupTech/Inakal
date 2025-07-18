class AuthDropdownModel {
  Data? data;
  String? message;
  String? type;

  AuthDropdownModel({this.data, this.message, this.type});

  AuthDropdownModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Data {
  List<RelStaOc>? religions;
  List<RelStaOc>? occupations;
  List<RelStaOc>? states;

  Data({this.religions, this.occupations, this.states});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['religions'] != null) {
      religions = <RelStaOc>[];
      json['religions'].forEach((v) {
        religions!.add(new RelStaOc.fromJson(v));
      });
    }
    if (json['occupations'] != null) {
      occupations = <RelStaOc>[];
      json['occupations'].forEach((v) {
        occupations!.add(new RelStaOc.fromJson(v));
      });
    }
    if (json['states'] != null) {
      states = <RelStaOc>[];
      json['states'].forEach((v) {
        states!.add(new RelStaOc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.religions != null) {
      data['religions'] = this.religions!.map((v) => v.toJson()).toList();
    }
    if (this.occupations != null) {
      data['occupations'] = this.occupations!.map((v) => v.toJson()).toList();
    }
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelStaOc {
  String? id;
  String? name;
  String? status;

  RelStaOc({this.id, this.name, this.status});

  RelStaOc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}
