class ServerTagResponse {
  bool? status;
  List<ServerTag>? tags;

  ServerTagResponse.fromJson(json) {
    status = true;
    tags = (json as List).map((e) => ServerTag.fromJson(e)).toList();
  }

  ServerTagResponse.withError() {
    status = false;
  }
}

class ServerTag {
  int? id, count;
  String? name, slug, description;
  List<String>? self, collection;

  ServerTag.fromJson(json) {
    print(json['id']);
    //int
    id = json['id'] == null || json['id'] == ''
        ? 0
        : int.parse(json['id'].toString()) ?? 0;
    count = json['count'] ?? 0;

    //string
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
    description = json['description'] ?? "";

    //Custom list
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
