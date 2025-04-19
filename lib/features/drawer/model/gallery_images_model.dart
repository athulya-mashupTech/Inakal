class GalleryImagesModel {
  List<Gallery>? gallery;
  String? message;
  String? type;

  GalleryImagesModel({this.gallery, this.message, this.type});

  GalleryImagesModel.fromJson(Map<String, dynamic> json) {
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Gallery {
  String? id;
  String? image;
  String? isPublic;
  String? uploadedAt;
  String? clientId;

  Gallery({this.id, this.image, this.isPublic, this.uploadedAt, this.clientId});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPublic = json['is_public'];
    uploadedAt = json['uploaded_at'];
    clientId = json['client_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_public'] = this.isPublic;
    data['uploaded_at'] = this.uploadedAt;
    data['client_id'] = this.clientId;
    return data;
  }
}