class Category {
  int _id;
  String _link,_name,_slug;

  Category(this._id, this._link, this._name, this._slug);

  factory Category.fromJson(json){
    return Category(
      json["id"]??0,
      json["link"]??"",
      json["name"]??"",
      json["slug"]??"",
    );
  }

  get slug => _slug;

  get name => _name;

  get link => _link;

  get id => _id;
}
