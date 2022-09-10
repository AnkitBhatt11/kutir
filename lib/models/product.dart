import 'package:golpo_kutir/models/Category.dart';

import 'custom_images.dart';

class ProductResponse {
  bool? status;
  List<Product>? products;

  ProductResponse.fromJson(json) {
    status = true;
    products = (json as List).map((e) => Product.fromJson(e)).toList();
  }

  ProductResponse.withError() {
    status = false;
  }
}

class Product {
  int? id, total_sales, rating_count;
  String? name,
      slug,
      permalink,
      date,
      type,
      status,
      description,
      sku,
      tax_status;
  double? price, regular_price, sale_price, average_rating;
  bool? featured,
      catalog_visibility,
      on_sale,
      purchasable,
      virtual,
      downloadable,
      manage_stock,
      reviews_allowed;
  List<Category>? categories, tags;
  List<CustomImages>? images;
  List<int>? relatedIds;
  List<String>? self, collection;

  Product.fromJson(json) {
    print('regular ${json['regular_price']}');
    print('sale ${json['sale_price']}');
    //int
    id = json['id'] ?? 0;
    total_sales = json['total_sales'] ?? 0;
    rating_count = json['rating_count'] ?? 0;

    //double
    price = json['price'] == null ? 0 : double.parse(json['price'].toString());
    regular_price = json['regular_price'] == null
        ? 0
        : double.parse(json['regular_price'].toString());
    sale_price = (json['sale_price'] == null || json['sale_price'] == "")
        ? 0
        : double.parse(json['sale_price'].toString()) ?? 0;
    average_rating = json['average_rating'] == null
        ? 0
        : double.parse(json['average_rating'].toString());

    //bool
    featured = json['featured'] ?? false;
    catalog_visibility = json['catalog_visibility'] == 'true' ? true : false;
    on_sale = json['on_sale'] ?? false;
    purchasable = json['purchasable'] ?? false;
    virtual = json['virtual'] ?? false;
    downloadable = json['downloadable'] ?? false;
    manage_stock = json['manage_stock'] ?? false;
    reviews_allowed = json['reviews_allowed'] ?? false;

    //String
    name = json['name'] ?? "";
    permalink = json['permalink'] ?? "";
    date = json['date'] ?? "";
    type = json['type'] ?? "";
    status = json['status'] ?? "";
    description = json['description'] ?? "";
    sku = json['sku'] ?? "";
    tax_status = json['tax_status'] ?? "";

    //Data objects
    categories = json['categories'] == null
        ? []
        : (json['categories'] as List)
            .map((e) => Category.fromJson(e))
            .toList();
    tags = json['tags'] == null
        ? []
        : (json['tags'] as List).map((e) => Category.fromJson(e)).toList();
    images = json['images'] == null
        ? []
        : (json['images'] as List)
            .map((e) => CustomImages.fromJson(e))
            .toList();

    relatedIds = json['related_ids'] == null
        ? []
        : (json['related_ids'] as List)
            .map(
              (e) => int.parse(e.toString()),
            )
            .toList();

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
