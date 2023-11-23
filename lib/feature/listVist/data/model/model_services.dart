



import 'package:note_app/feature/home_visit/data/model/model_service_item.dart';

class ModelServices {
  String? title;
  Map<int,List<ModelServiceItem>>? items=<int,List<ModelServiceItem>>{};
  bool isEnable = false;
  int id=0;
  ModelServices({this.title, this.items});
  ModelServices.fromModelServices(this.title,this.items, this.id )
    {
      isEnable = items![id]!=null ;
    }

  ModelServices.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    List<dynamic> tmp= json['items'];
    tmp.forEach((element) {
      if(items![element['parent_id']]==null){
        items![element['parent_id']] = [];
      }
      items![element['parent_id']]!.add(ModelServiceItem.fromJson(element));
    });
    isEnable = items!.isNotEmpty;
  }



}
