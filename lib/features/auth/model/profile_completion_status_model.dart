class ProfileCompletionStatusModel {
  int? profileCompletion;
  String? message;
  String? type;

  ProfileCompletionStatusModel(
      {this.profileCompletion, this.message, this.type});

  ProfileCompletionStatusModel.fromJson(Map<String, dynamic> json) {
    profileCompletion = json['profile_completion'];
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_completion'] = this.profileCompletion;
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}
