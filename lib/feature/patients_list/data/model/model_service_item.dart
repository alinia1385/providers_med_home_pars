class ModelServiceItem {
  int? id;
  int? parentId;
  String? title;
  int? order;

  ModelServiceItem({this.id, this.parentId, this.title, this.order});

  ModelServiceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    title = json['title'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    data['order'] = this.order;
    return data;
  }
}
