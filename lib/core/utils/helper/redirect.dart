import 'package:url_launcher/url_launcher.dart';


mixin reDirect {

  lunchUrl(String url) async
  {
    if(await canLaunchUrl(url as Uri))
      {
              await lunchUrl(url);
      }else
        {
          throw 'could not lunch $url';
        }
  }
}

