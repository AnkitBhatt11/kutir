

class Tag{
  int? id;
  String? link,name,slug;

  Tag(this.id, this.link, this.name, this.slug);

  factory Tag.fromJson(json){
    return Tag(
      json["id"],
      json["link"],
      json["name"],
      json["slug"],
    );
  }

}