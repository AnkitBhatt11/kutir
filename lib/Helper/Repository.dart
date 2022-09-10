import 'package:flutter/material.dart';

import '../models/BannerMedia.dart';
import '../models/Category.dart';
import '../models/Post.dart';
import '../models/ServerCategories.dart';
import '../models/ServerTag.dart';
import '../models/Tag.dart';
import '../models/product.dart';

class Repository extends ChangeNotifier {
  List<Banner_Media> medias = List.empty(growable: true);
  List<Category> categories = List.empty(growable: true);
  List<Tag> tags = List.empty(growable: true);
  List<List<Post>> posts = List.empty(growable: true);
  List<Post> allposts = [];
  List<String> current_tags = List.empty(growable: true);
  List<Product> products = [];
  List<ServerCategories> newCategories = [];
  List<ServerTag> newTags = [];

  // List<Product> products=[];
  int which = 0;
  bool subCateg = false;

  void setVisibility(bool data) {
    subCateg = !subCateg;
    notifyListeners();
  }

  void setWhich(int i) {
    which = i;
    notifyListeners();
  }

  void setServerCategory(List<ServerCategories> list) {
    newCategories = list;
    notifyListeners();
  }

  void setProduct(List<Product> list) {
    products = list;
    notifyListeners();
  }

  void setNewTags(List<ServerTag> tags) {
    newTags = tags;
    notifyListeners();
  }

  void addCurrentTag(String tag) {
    current_tags.add(tag);
    notifyListeners();
  }

  void addPost(List<Post> list) {
    print('list added ${list.length} ${categories.last.name}');
    posts.add(list);
    notifyListeners();
  }

  void addMedias(List<Banner_Media> media) {
    medias = media;
    notifyListeners();
  }

  void addCategory(List<Category> category) {
    categories = category;
    notifyListeners();
  }

  void setTag(List<Tag> tag) {
    tags = tag;
    notifyListeners();
  }

  List<Post> getList() {
    allposts = [];
    for (var i in posts) {
      allposts.addAll(i);
    }
    return allposts;
  }

  List<Post> produ = [];

  // double get total {
  //   return products.fold(0.0, (double currentTotal, Product nextProduct) {
  //     return currentTotal + nextProduct.cost;
  //   });
  // }
 

  void addToCart(Post product) => produ.add(product);
  void removeFromCart(Post product) {
    produ.remove(product);
    notifyListeners();
  }
}
