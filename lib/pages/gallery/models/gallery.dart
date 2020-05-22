import 'package:meta/meta.dart';
import 'package:photogallery/pages/gallery/models/photo.dart';

class Gallery {
  String title;
  List<Photo> photos = [];

  Gallery({@required this.title, @required this.photos});
}
