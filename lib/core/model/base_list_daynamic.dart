class BaseListDaynamic {
  bool ?success;
  String ?message;
  Map<String, dynamic>? data;

  BaseListDaynamic({
    this.success,
    this.message,
    this.data,
  });

  // for login request
  factory BaseListDaynamic.fromJson(Map<String, dynamic> json) {
    if (json["success"] == true )
     { return BaseListDaynamic(
       success: json["success"] /*Source.fromJson(json["source"])*/,
        message: json["message"],
        data: json["data"] as Map<String, dynamic>,
      );}
    else{

      return BaseListDaynamic(
        success: json["success"] /*Source.fromJson(json["source"])*/,
        message: json["message"].toString(),
        data: {},
      );}
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
  };


}
