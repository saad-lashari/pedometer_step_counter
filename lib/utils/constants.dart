// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

const String appname = 'CYPHERKICKS';
const String season1and2url = 'https://www.jpg.store/collection/cypherkicksoneandtwo?tab=items';
const String season3url = 'https://www.jpg.store/collection/cypherkicks';
const String season4url = 'https://www.jpg.store/collection/cypherkicksseasonfour';
const String season5url = 'https://www.jpg.store/collection/cypherkicksseasonfive';
const String deadKicksurl = 'https://www.jpg.store/collection/deadkicks';

 launchURL(String collectionUrl) async {
  String url = collectionUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}