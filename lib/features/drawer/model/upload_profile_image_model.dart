class UploadProfileImageModel {
  String? fileName;
  int? uploaded;
  String? type;
  String? url;

  UploadProfileImageModel(
      {this.fileName, this.uploaded, this.type, this.url});

  UploadProfileImageModel.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    uploaded = json['uploaded'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['uploaded'] = this.uploaded;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
