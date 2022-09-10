class CustomImages {
  int? id;
  String? src, name;

  CustomImages.fromJson(json) {
    id = json['id'] ?? 0;
    src = json['src'] ?? "";
    name = json['name'] ?? "";
  }
}
