import 'package:get/get.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ModelListVisit {
  int? id;
  String? personType;
  int? personId;
  String? createdAt;

  ModelListVisit({this.id, this.personType, this.personId, this.createdAt});

  ModelListVisit.fromJson(Map<String, dynamic> json) {
    String date = "";
    String time = "";
    Gregorian g = Gregorian.now();
    if (json['created_at'].toString().length > 10) {
      String date = json['created_at'].toString().substring(0, 10);
      String time = json['created_at'].toString().substring(
          json['created_at'].toString().indexOf("T") + 1,
          json['created_at'].toString().indexOf("."));

      var dateArray = date.split("-");
      var timeArray = time.split(":");
      print(dateArray);
      print(timeArray);

      g = Gregorian(
        int.parse(dateArray[0]),
        int.parse(dateArray[1]),
        int.parse(dateArray[2]),
        int.parse(timeArray[0]),
        int.parse(timeArray[1]),
        int.parse(timeArray[2]),
      );

    }

    id = json['id'];
    personType = json['person_type'];
    personId = json['person_id'];
    createdAt = "${g.toJalali().year} / ${g.toJalali().month} / ${g.toJalali().day} - ${g.hour} : ${g.minute}";
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['person_type'] = this.personType;
    data['person_id'] = this.personId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
