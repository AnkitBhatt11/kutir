

import '../models/BannerMedia.dart';
import '../models/Category.dart';
import '../models/Post.dart';

class Storage{
  static List<List<Post>>posts =List.empty(growable: true);
  static List<Category>categories =List.empty(growable: true);
  static  List<Banner_Media>medias =List.empty(growable: true);
  static int which =0;
  static bool subCateg=false;

}