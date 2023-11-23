class BaseListDaynamicStandard {
  bool ?success;
  String ?message;
  List<dynamic> ?data;


  BaseListDaynamicStandard({
    this.success,
    this.message,
    this.data,

  });

  //for login request
  factory BaseListDaynamicStandard.fromJson(Map<String, dynamic> json) {
    if (json["success"] ) {
      return BaseListDaynamicStandard(
        success: json["success"],
        message: json["message"],
        data: json["data"] as List<dynamic>,

      );
    } else {
      return BaseListDaynamicStandard(
        success: json["success"] /*Source.fromJson(json["source"])*/,
        message: json["message"],
        data: null,

      );
    }
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,

  };
}
