import 'package:cypherkicks/components/images.dart';
import 'package:cypherkicks/utils/constants.dart';

class CollectionsModel {
  String? title;
  String? season;
  String? nFTs;
  String? dateTime;
  String? imagePath;
  String? url;

  CollectionsModel(
      {this.title, this.season, this.nFTs, this.dateTime, this.imagePath,this.url});
}
List<CollectionsModel> collections = [
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 1 & 2',
    nFTs: '350',
    dateTime: '22,Jan 2023',
    imagePath: Images.season1and2,
    url: season1and2url
  ),
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 3',
    nFTs: '350',
    dateTime: '11,Feb 2023',
    imagePath: Images.season3,
    url: season3url
  ),
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 4',
    nFTs: '250',
    dateTime: '22,Feb 2023',
    imagePath: Images.season4,
    url: season4url
  ),
  CollectionsModel(
    title: 'CypherKicks',
    season: 'Season 5',
    nFTs: '350',
    dateTime: '22,Feb 2023',
    imagePath: Images.season5,
    url: season5url

  ),
  CollectionsModel(
    title: 'DeadKicks',
    season: 'Cross-Chain',
    nFTs: '350',
    dateTime: '22,Feb 2023',
    imagePath: Images.deadKicks,
    url: deadKicksurl
  )
];
