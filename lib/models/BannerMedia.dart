class Banner_Media{
  int _id,_author;
  String _date,_slug,_link,_og_url,_og_title;

  Banner_Media(this._id, this._author, this._date, this._slug, this._link,
      this._og_url, this._og_title);

  factory Banner_Media.fromJson(json){
    return Banner_Media(
      json['id'],
      json['author'],
      json['date'],
      json['slug'],
      json['link'],
      json['yoast_head_json']['og_url'],
      json['yoast_head_json']['og_title'],
    );
  }

  get og_title => _og_title;

  get og_url => _og_url;

  get link => _link;

  get slug => _slug;

  String get date => _date;

  get author => _author;

  int get id => _id;
}