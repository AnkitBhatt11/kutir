class ServerCategoriesResponse {
  bool? status;
  List<ServerCategories>? categories;

  ServerCategoriesResponse.fromJson(json) {
    status = true;
    categories = json == null
        ? []
        : (json as List).map((e) => ServerCategories.fromJson(e)).toList();
  }

  ServerCategoriesResponse.withError() {
    status = false;
  }
}

class ServerCategories {
  // List<String>? self, collection;

  int? id, parent, menue_order, count;
  String? name, slug, description, display, image;
  List<String>? self, collection;

  ServerCategories.fromJson(json) {
    //int
    id = json['id'] ?? 0;
    parent = json['parent'] ?? 0;
    menue_order = json['menue_order'] ?? 0;
    count = json['count'] ?? 0;

    //String
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
    description = json['description'] ?? "";
    display = json['display'] ?? "";
    image = json['image'] ?? "";

    //List
    self = json['_links']['self'] == null
        ? []
        : (json['_links']['self'] as List)
            .map(
              (e) => e['href'].toString(),
            )
            .toList();

    collection = json['_links']['collection'] == null
        ? []
        : (json['_links']['collection'] as List)
            .map(
              (e) => e['href'].toString(),
            )
            .toList();
  }
}
