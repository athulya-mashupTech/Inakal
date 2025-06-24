class DropdownModel {
  List<ReEdOcLanSt>? religions;
  List<CaSub>? castes;
  List<CaSub>? subcastes;
  List<ReEdOcLanSt>? highestEducations;
  List<Qualifications>? qualifications;
  List<ReEdOcLanSt>? occupations;
  List<ReEdOcLanSt>? languages;
  List<ReEdOcLanSt>? states;
  List<Districts>? districts;

  DropdownModel(
      {this.religions,
      this.castes,
      this.subcastes,
      this.highestEducations,
      this.qualifications,
      this.occupations,
      this.languages,
      this.states,
      this.districts});

  DropdownModel.fromJson(Map<String, dynamic> json) {
    if (json['religions'] != null) {
      religions = <ReEdOcLanSt>[];
      json['religions'].forEach((v) {
        religions!.add(new ReEdOcLanSt.fromJson(v));
      });
    }
    if (json['castes'] != null) {
      castes = <CaSub>[];
      json['castes'].forEach((v) {
        castes!.add(new CaSub.fromJson(v));
      });
    }
    if (json['subcastes'] != null) {
      subcastes = <CaSub>[];
      json['subcastes'].forEach((v) {
        subcastes!.add(new CaSub.fromJson(v));
      });
    }
    if (json['highest_educations'] != null) {
      highestEducations = <ReEdOcLanSt>[];
      json['highest_educations'].forEach((v) {
        highestEducations!.add(new ReEdOcLanSt.fromJson(v));
      });
    }
    if (json['qualifications'] != null) {
      qualifications = <Qualifications>[];
      json['qualifications'].forEach((v) {
        qualifications!.add(new Qualifications.fromJson(v));
      });
    }
    if (json['occupations'] != null) {
      occupations = <ReEdOcLanSt>[];
      json['occupations'].forEach((v) {
        occupations!.add(new ReEdOcLanSt.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <ReEdOcLanSt>[];
      json['languages'].forEach((v) {
        languages!.add(new ReEdOcLanSt.fromJson(v));
      });
    }
    if (json['states'] != null) {
      states = <ReEdOcLanSt>[];
      json['states'].forEach((v) {
        states!.add(new ReEdOcLanSt.fromJson(v));
      });
    }
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(new Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.religions != null) {
      data['religions'] = this.religions!.map((v) => v.toJson()).toList();
    }
    if (this.castes != null) {
      data['castes'] = this.castes!.map((v) => v.toJson()).toList();
    }
    if (this.subcastes != null) {
      data['subcastes'] = this.subcastes!.map((v) => v.toJson()).toList();
    }
    if (this.highestEducations != null) {
      data['highest_educations'] =
          this.highestEducations!.map((v) => v.toJson()).toList();
    }
    if (this.qualifications != null) {
      data['qualifications'] =
          this.qualifications!.map((v) => v.toJson()).toList();
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
    if (this.districts != null) {
      data['districts'] = this.districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReEdOcLanSt {
  String? id;
  String? name;
  String? status;

  ReEdOcLanSt({this.id, this.name, this.status});

  ReEdOcLanSt.fromJson(Map<String, dynamic> json) {
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

class CaSub {
  String? id;
  String? name;
  String? religionId;
  String? status;

  CaSub({this.id, this.name, this.religionId, this.status});

  CaSub.fromJson(Map<String, dynamic> json) {
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

class Districts {
  String? id;
  String? name;
  String? stateId;
  String? status;

  Districts({this.id, this.name, this.stateId, this.status});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['status'] = this.status;
    return data;
  }
}
