class DeleteGalleryImageModel {
  String? type;
  String? message;

  DeleteGalleryImageModel({this.type, this.message});

  DeleteGalleryImageModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}
