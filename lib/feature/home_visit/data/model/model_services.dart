class ModelServices {
  int? serviceId;
  int? cnt;
  String? title;
  String? icon;

  ModelServices({this.serviceId, this.cnt, this.title, this.icon});

  ModelServices.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    cnt = json['cnt'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['cnt'] = this.cnt;
    data['title'] = this.title;
    data['icon'] = this.icon;
    return data;
  }
}
