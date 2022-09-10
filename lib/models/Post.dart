

class Post{
  int _id,_author,_featured_media;
  bool _sticky;
  String? _date,_modified,_slug,_status,_type,_link,_title,_content,_comment_status,_ping_status,_actual_post_author,_image,_twitter_creator,_Written_by;
  List<int> _categories,_tags;

  Post(
      this._id,
      this._author,
      this._featured_media,
      this._sticky,
      this._date,
      this._modified,
      this._slug,
      this._status,
      this._type,
      this._link,
      this._title,
      this._content,
      this._comment_status,
      this._ping_status,
      this._actual_post_author,
      this._image,
      this._twitter_creator,
      this._Written_by,
      this._categories,
      this._tags);

factory Post.fromJson(dynamic json){
 return Post(
   json['id'],
   json['author'],
   json['featured_media'],
   json['sticky'].toString()=='false'?false:true,
   json['date'],
   json['modified'],
   json['slug'],
   json['status'],
   json['type'],
   json['link'],
   json['title']['rendered'],
   json['content']['rendered'],
   json['comment_status'],
   json['ping_status'],
   json['acf']['actual_post_author'],
   json['yoast_head_json']['og_image'][0]['url'],
   json['yoast_head_json']['twitter_creator'],
   json['yoast_head_json']['twitter_misc']['Written by'],
   (json['categories']as List).map((e)=>int.parse(e.toString())).toList(growable: false),
   (json['tags']as List).map((e)=>int.parse(e.toString())).toList(growable: false),
 );
}

  get tags => _tags;

  get categories => _categories;

  get Written_by => _Written_by;

  get twitter_creator => _twitter_creator;

  get image => _image;

  get actual_post_author => _actual_post_author;

  get ping_status => _ping_status;

  get comment_status => _comment_status;

  get content => _content;

  get title => _title;

  get link => _link;

  get type => _type;

  get status => _status;

  get slug => _slug;

  get modified => _modified;

  get date => _date;

  get sticky => _sticky;

  get featured_media => _featured_media;

  get author => _author;

  get id => _id;
}