class AuthDropdownModel {
  List<ReHeOcLangSt>? religions;
  List<ReHeOcLangSt>? highestEducations;
  List<ReHeOcLangSt>? occupations;
  List<ReHeOcLangSt>? languages;
  List<ReHeOcLangSt>? states;

  AuthDropdownModel(
      {this.religions,
      this.highestEducations,
      this.occupations,
      this.languages,
      this.states});

  AuthDropdownModel.fromJson(Map<String, dynamic> json) {
    if (json['religions'] != null) {
      religions = <ReHeOcLangSt>[];
      json['religions'].forEach((v) {
        religions!.add(new ReHeOcLangSt.fromJson(v));
      });
    }
    if (json['highest_educations'] != null) {
      highestEducations = <ReHeOcLangSt>[];
      json['highest_educations'].forEach((v) {
        highestEducations!.add(new ReHeOcLangSt.fromJson(v));
      });
    }
    if (json['occupations'] != null) {
      occupations = <ReHeOcLangSt>[];
      json['occupations'].forEach((v) {
        occupations!.add(new ReHeOcLangSt.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <ReHeOcLangSt>[];
      json['languages'].forEach((v) {
        languages!.add(new ReHeOcLangSt.fromJson(v));
      });
    }
    if (json['states'] != null) {
      states = <ReHeOcLangSt>[];
      json['states'].forEach((v) {
        states!.add(new ReHeOcLangSt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.religions != null) {
      data['religions'] = this.religions!.map((v) => v.toJson()).toList();
    }
    if (this.highestEducations != null) {
      data['highest_educations'] =
          this.highestEducations!.map((v) => v.toJson()).toList();
    }
    if (this.occupations != null) {
      data['occupations'] = this.occupations!.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReHeOcLangSt {
  String? id;
  String? name;
  String? status;

  ReHeOcLangSt({this.id, this.name, this.status});

  ReHeOcLangSt.fromJson(Map<String, dynamic> json) {
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
