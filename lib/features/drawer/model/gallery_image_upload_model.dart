class UploadGalleryImageModel {
  String? fileName;
  int? uploaded;
  String? url;

  UploadGalleryImageModel({this.fileName, this.uploaded, this.url});

  UploadGalleryImageModel.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    uploaded = json['uploaded'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['uploaded'] = this.uploaded;
    data['url'] = this.url;
    return data;
  }
}
