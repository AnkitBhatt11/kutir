import 'package:dio/dio.dart';
import 'package:golpo_kutir/constants.dart';
import 'package:golpo_kutir/models/Post.dart';
import 'package:golpo_kutir/models/SignupData.dart';
import 'package:uuid/uuid.dart';
import '../models/BannerMedia.dart';
import '../models/Category.dart';
import '../models/ServerCategories.dart';
import '../models/ServerTag.dart';
import '../models/Tag.dart';
import '../models/product.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Dio? dio;
  BaseOptions option =
      BaseOptions(connectTimeout: 25000, receiveTimeout: 30000, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });

  Future<List<Post>> GetPosts(category) async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'categories': category,
        'page': 1,
        'per_page': 10,
      });
      if (response?.statusCode == 200) {
        var data = response?.data as List;
        List<Post> list =
            data.map((e) => Post.fromJson(e)).toList(growable: false);

        return list;
      } else {
        List<Post> list = List.empty();
        return list;
      }
    } on DioError catch (e) {
      print(e);
      List<Post> list = List.empty();
      return list;
    }
  }

  Future<List<Category>> GetCategory() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'page': 1,
        'per_page': 15,
      });
      if (response?.statusCode == 200) {
        var data = response?.data as List;

        List<Category> list =
            data.map((e) => Category.fromJson(e)).toList(growable: false);

        return list;
      } else {
        List<Category> list = List.empty();
        return list;
      }
    } on DioError catch (e) {
      print(e);
      List<Category> list = List.empty();
      return list;
    }
  }

  Future<List<Tag>> GetTag() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'page': 1,
        'per_page': 100,
      });
      if (response?.statusCode == 200) {
        var data = response?.data as List;

        List<Tag> list =
            data.map((e) => Tag.fromJson(e)).toList(growable: false);

        return list;
      } else {
        List<Tag> list = List.empty();
        return list;
      }
    } on DioError catch (e) {
      print(e.response);
      List<Tag> list = List.empty();
      return list;
    }
  }

  Future<void> GetRazorpay() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'membership': 1,
        'currency': 100,
      });
      if (response?.statusCode == 200) {
        print('Razorpay ${response?.data}');
      } else {
        print('Razorpay err ${response?.data}');
      }
    } on DioError catch (e) {
      // print(e.response);
      print('Razorpay ${e.response}');
    }
  }

  Future<void> signin() async {
    dio = Dio(option);
    print(url);
    print({
      'gk_app': '1',
      'log': 'adasdad',
      'pwd': '100',
      'rememberme': 1,
      'action': 'subscriber_login',
      'wp-submit': 1,
    });
    try {
      Response? response = await dio?.post(url, queryParameters: {
        'gk_app': '1',
        'log': 'adasdad',
        'pwd': '100',
        'rememberme': 1,
        'action': 'subscriber_login',
        'wp-submit': 1,
      });
      if (response?.statusCode == 200) {
        print('signin ${response?.data}');
      } else {
        print('signin err ${response?.data}');
      }
    } on DioError catch (e) {
      // print(e.response);
      print('signin err ${e.response}');
    }
  }

  Future<void> signup() async {
    dio = Dio(option);
    print(url);
    print({
      'gk_app': '1',
      'action': 'sign_up_data_submit_action',
      'first_name': 'deb',
      'last_name': 'son',
      'username': 'dson',
      'mobile': '567835315',
      'email': 'adasd@gmail.com',
      'password': 'adasdad',
      'password_re_enter': 'adasdad', 'sign_up_data_submit': 1,
      // 'rememberme': 1,
      // 'action': 'subscriber_login',
      // 'wp-submit': 1,
    });
    try {
      Response? response = await dio?.post(url, queryParameters: {
        'gk_app': '1',
        'action': 'sign_up_data_submit_action',
        'first_name': 'deb',
        'last_name': 'son',
        'username': 'dson',
        'mobile': '567835315',
        'email': 'adasd@gmail.com',
        'password': 'adasdad',
        'password_re_enter': 'adasdad',
        'sign_up_data_submit': 1,
        // 'rememberme': 1,
        // 'action': 'subscriber_login',
        // 'wp-submit': 1,
      });
      if (response?.statusCode == 200) {
        print('signin ${response?.data}');
      } else {
        print('signin err ${response?.data}');
      }
    } on DioError catch (e) {
      // print(e.response);
      print('signin err ${e.response}');
    }
  }

  Future<Tag> GetIndividualTag() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'page': 1,
        'per_page': 100,
      });
      if (response?.statusCode == 200) {
        var data = Tag.fromJson(response?.data);

        return data;
      } else {
        print("Something went wrong tag");
        return Tag(0, "", "", "");
      }
    } on DioError catch (e) {
      print(e.response);
      return Tag(0, "", "", "");
    }
  }

  Future<List<Banner_Media>> GetBanner_Media() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'page': 1,
        'per_page': 15,
      });
      if (response?.statusCode == 200) {
        var data = response?.data as List;
        // print(data);
        List<Banner_Media> list =
            data.map((e) => Banner_Media.fromJson(e)).toList(growable: false);

        return list;
      } else {
        List<Banner_Media> list = List.empty();
        return list;
      }
    } on DioError catch (e) {
      print(e);
      List<Banner_Media> list = List.empty();
      return list;
    }
  }

  Future Signup(SignupData data) async {
    var uuid = Uuid();
    dio = Dio(option);
    print(url);
    Response? response;
    try {
      response = await dio?.post(url, queryParameters: {
        'name': data.name,
        'email': data.email,
        // 'first_name':data.first_name,
        // 'last_name':data.last_name,
        'username': data.username,
        'password': data.password,
        'slug': uuid.v4(),
      });
      if (response?.statusCode == 200) {
        var data = response?.data;
        return data;
      } else {
        print(response!.data);
        return 'false';
      }
    } on DioError catch (e) {
      print(e.response);

      return 'false';
    }
  }

  Future<ProductResponse> fetchProducts() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'consumer_key': Constants.ck,
        'consumer_secret': Constants.cs,
      });
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        // var data = response?.data;
        print('products response ${response?.data}');
        return ProductResponse.fromJson(response?.data);
      } else {
        print(response!.data);
        return ProductResponse.withError();
      }
    } on DioError catch (e) {
      print(e.response);
      return ProductResponse.withError();
    }
  }

  Future<ServerCategoriesResponse> fetchCategory() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'consumer_key': Constants.ck,
        'consumer_secret': Constants.cs,
      });
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        // var data = response?.data;
        print('category response ${response?.data}');
        return ServerCategoriesResponse.fromJson(response?.data);
      } else {
        print(response!.data);
        return ServerCategoriesResponse.withError();
      }
    } on DioError catch (e) {
      print(e.response);
      return ServerCategoriesResponse.withError();
    }
  }

  Future<ServerTagResponse> fetchTags() async {
    dio = Dio(option);
    print(url);
    try {
      Response? response = await dio?.get(url, queryParameters: {
        'consumer_key': Constants.ck,
        'consumer_secret': Constants.cs,
      });
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        // var data = response?.data;
        print('tags response ${response?.data}');
        return ServerTagResponse.fromJson(response?.data);
      } else {
        print(response!.data);
        return ServerTagResponse.withError();
      }
    } on DioError catch (e) {
      print(e.response);
      return ServerTagResponse.withError();
    }
  }
}
