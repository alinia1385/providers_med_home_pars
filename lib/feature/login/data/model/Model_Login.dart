class ModelLogin {
  String? profileImageURL;
  String? accessToken;
  String? name;
  String? permission;

  ModelLogin({this.accessToken, this.name, this.permission,this.profileImageURL});

  ModelLogin.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    name = json['name'];
    permission = json['permission'];
    profileImageURL = json['profileImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['name'] = name;
    data['permission'] = permission;
    data['profileImageURL'] = profileImageURL;
    return data;
  }
}