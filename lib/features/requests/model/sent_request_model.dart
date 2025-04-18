class SentRequestModel {
  List<Requests>? requests;
  String? message;
  String? type;

  SentRequestModel({this.requests, this.message, this.type});

  SentRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(new Requests.fromJson(v));
      });
    }
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Requests {
  String? id;
  String? fromClientId;
  String? toClientId;
  String? assignedBy;
  String? assignedById;
  Null? remarks;
  String? status;
  String? createdAt;

  Requests(
      {this.id,
      this.fromClientId,
      this.toClientId,
      this.assignedBy,
      this.assignedById,
      this.remarks,
      this.status,
      this.createdAt});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromClientId = json['from_client_id'];
    toClientId = json['to_client_id'];
    assignedBy = json['assigned_by'];
    assignedById = json['assigned_by_id'];
    remarks = json['remarks'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_client_id'] = this.fromClientId;
    data['to_client_id'] = this.toClientId;
    data['assigned_by'] = this.assignedBy;
    data['assigned_by_id'] = this.assignedById;
    data['remarks'] = this.remarks;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
