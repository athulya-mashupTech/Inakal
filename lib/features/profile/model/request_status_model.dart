class RequestStatusModel {
  Status? sent;
  String? sentStatus;
  Status? received;
  String? receivedStatus;
  String? message;
  String? type;

  RequestStatusModel(
      {this.sent,
      this.sentStatus,
      this.received,
      this.receivedStatus,
      this.message,
      this.type});

  RequestStatusModel.fromJson(Map<String, dynamic> json) {
    sent = json['sent'] != null ? new Status.fromJson(json['sent']) : null;
    sentStatus = json['sent_status'];
    received =
        json['received'] != null ? new Status.fromJson(json['received']) : null;
    receivedStatus = json['received_status'];
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sent != null) {
      data['sent'] = this.sent!.toJson();
    }
    data['sent_status'] = this.sentStatus;
    if (this.received != null) {
      data['received'] = this.received!.toJson();
    }
    data['received_status'] = this.receivedStatus;
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}

class Status {
  String? id;
  String? fromClientId;
  String? toClientId;
  String? assignedBy;
  String? assignedById;
  String? remarks;
  String? status;
  String? createdAt;

  Status(
      {this.id,
      this.fromClientId,
      this.toClientId,
      this.assignedBy,
      this.assignedById,
      this.remarks,
      this.status,
      this.createdAt});

  Status.fromJson(Map<String, dynamic> json) {
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
