import 'package:get/get.dart';


class Translate extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en':
    {
      'Hellow World':'Hellow World:',
      'Dark mode:':'Dark mode'
    },
    'fa':
    {
      'Hellow World':'سلام',
      'Dark mode:':'حالت تاریک'
    }
  };

}