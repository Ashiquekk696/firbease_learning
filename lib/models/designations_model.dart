class DesignationsModel {
  int? id;
  String? name;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  DesignationsModel(
      {this.id, this.name, this.deletedAt, this.createdAt, this.updatedAt});

  DesignationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
