import 'package:golpo_kutir/models/SignupData.dart';

import '../models/BannerMedia.dart';
import '../models/Category.dart';
import '../models/Post.dart';
import '../models/ServerCategories.dart';
import '../models/ServerTag.dart';
import '../models/Tag.dart';
import '../models/product.dart';
import 'network_helper.dart';

class Access {
  static const base_url = "https://bengali.golpokutir.in/wp-json/wp/v2/";
  static const base_url_new = "https://mangoshstudio.com/demo/gkwp/wp-json/wc/v3/";
  static const razorpay_url =
      "https://www.mangoshstudio.com/demo/gkwp/wp-content/themes/golpokutir/classes/razorpay/generate_order.php";
  static const primary_url =
      "https://mangoshstudio.com/demo/gkwp/wp-admin/admin-ajax.php";

  Future<dynamic> getPosts(int category) async {
    NetworkHelper helper = NetworkHelper(base_url + 'posts');

    List<Post> a = await helper.GetPosts(category);
    return a;
  }

  Future<dynamic> getCategory() async {
    NetworkHelper helper = NetworkHelper(base_url + 'categories');

    List<Category> a = await helper.GetCategory();
    return a;
  }

  Future<dynamic> getTag() async {
    NetworkHelper helper = NetworkHelper(base_url + 'tags');

    List<Tag> a = await helper.GetTag();
    return a;
  }

  Future<dynamic> GetRazorpay() async {
    NetworkHelper helper = NetworkHelper(razorpay_url);

    await helper.GetRazorpay();
  }

  Future<dynamic> signin() async {
    NetworkHelper helper = NetworkHelper(primary_url);

    await helper.signin();
  }

  Future<dynamic> signup() async {
    NetworkHelper helper = NetworkHelper(primary_url);

    await helper.signup();
  }

  Future<Tag> GetIndividualTag(id) async {
    NetworkHelper helper = NetworkHelper(base_url + 'tags/${id}');

    Tag a = await helper.GetIndividualTag();
    return a;
  }

  Future<dynamic> GetBanner_Media() async {
    NetworkHelper helper = NetworkHelper(base_url + 'media');

    List<Banner_Media> a = await helper.GetBanner_Media();
    return a;
  }

  Future<dynamic> Signup(SignupData data) async {
    NetworkHelper helper = NetworkHelper(base_url + 'users');

    var a = await helper.Signup(data);
    return a;
  }

  Future<ServerCategoriesResponse> fetchCategory() async {
    NetworkHelper helper = NetworkHelper(base_url_new + 'products/categories');

    var a = await helper.fetchCategory();
    return a;
  }

  Future<ProductResponse> fetchProducts() async {
    NetworkHelper helper = NetworkHelper(base_url_new + 'products');

    var a = await helper.fetchProducts();
    return a;
  }

  Future<ServerTagResponse> fetchTags() async {
    NetworkHelper helper = NetworkHelper(base_url_new + 'products/tags');

    var a = await helper.fetchTags();
    return a;
  }
}
