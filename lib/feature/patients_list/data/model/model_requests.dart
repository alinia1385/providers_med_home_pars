class ModelRequests {
  int? id;
  int? memberId;
  String? createdAt;
  String? updatedAt;
  String? latlong;
  String? status;
  String? name;
  String? surname;
  String? image;
  String? phone;
  String? mobile;
  String? description;
  String? address;


  ModelRequests(
      {this.id,
        this.memberId,
        this.createdAt,
        this.updatedAt,
        this.latlong,
        this.status,
        this.name,
        this.surname,
        this.image,
        this.phone,
        this.mobile,
        this.description,
        this.address,
      });

  ModelRequests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    latlong = json['latlong'];
    status = json['status'];
    name = json['name'];
    surname = json['surname'];
    image = json['image'];
    phone = json['phone'];
    mobile = json['mobile'];
    description = json['description'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['latlong'] = this.latlong;
    data['status'] = this.status;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['description'] = this.description;
    data['address'] = this.address;
    return data;
  }
}
