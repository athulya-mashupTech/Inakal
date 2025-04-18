class ProfileModel {
  String? type;
  User? user;
  String? message;

  ProfileModel({this.type, this.user, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class User {
  String? user_id;
  String? firstname;
  String? lastname;
  String? location;
  String? job;
  String? religion;
  String? caste;
  String? profileImage;
  String? age;
  String? height;
  String? weight;
  String? description;
  List<String>? images;

  User(
      {this.user_id,
      this.firstname,
      this.lastname,
      this.location,
      this.job,
      this.religion,
      this.caste,
      this.profileImage,
      this.age,
      this.height,
      this.weight,
      this.description,
      this.images});

  User.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    location = json['location'];
    job = json['job'];
    religion = json['religion'];
    caste = json['caste'];
    profileImage = json['profile_image'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    description = json['description'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['location'] = this.location;
    data['job'] = this.job;
    data['religion'] = this.religion;
    data['caste'] = this.caste;
    data['profile_image'] = this.profileImage;
    data['age'] = this.age;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['images'] = this.images;
    return data;
  }
}
