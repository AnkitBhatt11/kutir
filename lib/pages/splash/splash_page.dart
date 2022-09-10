import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golpo_kutir/Helper/Storage.dart';
import 'package:golpo_kutir/navigation/navigation.dart';
import 'package:provider/provider.dart';

import '../../Helper/Repository.dart';
import '../../networking/access.dart';

class SplashPage extends StatefulWidget {
  SplashPage() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Access().GetRazorpay();
    fetchCategories();
    fetchMedias();
    fetchTags();
    fetchServerCategory();
    // fetchPosts();
    Timer(const Duration(seconds: 10), () {
      Navigation.instance.navigate("/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }

  void fetchCategories() async {
    Access().getCategory().then((_) {
      if (mounted) {
        setState(() {
          Storage.categories = _;
          Provider.of<Repository>(
                  Navigation.instance.navigatorKey.currentState!.context,
                  listen: false)
              .addCategory(_);
          for (var i in _) {
            print(i.name);
            fetchPosts(i.id);
          }
        });
      } else {
        Storage.categories = _;
        Provider.of<Repository>(
                Navigation.instance.navigatorKey.currentState!.context,
                listen: false)
            .addCategory(_);
        for (var i in _) {
          fetchPosts(i.id);
        }
      }
    });
  }

  void fetchTags() async {
    Access().getTag().then((_) {
      Provider.of<Repository>(
              Navigation.instance.navigatorKey.currentState!.context,
              listen: false)
          .setTag(_);
      if (mounted) {
        setState(() {});
      }
    });
  }

  void fetchPosts(category) async {
    Access().getPosts(category).then((_) {
      if (mounted) {
        setState(() {
          Storage.posts.add(_);
          Provider.of<Repository>(
                  Navigation.instance.navigatorKey.currentState!.context,
                  listen: false)
              .addPost(_);
        });
      } else {
        Storage.posts.add(_);
        Provider.of<Repository>(
                Navigation.instance.navigatorKey.currentState!.context,
                listen: false)
            .addPost(_);
      }
    });
  }

  void fetchMedias() {
    Access().GetBanner_Media().then((_) {
      if (mounted) {
        setState(() {
          Storage.medias = _;
          Provider.of<Repository>(
                  Navigation.instance.navigatorKey.currentState!.context,
                  listen: false)
              .addMedias(_);
          // for (var i in _) {
          //   fetchPosts(i.id);
          // }
        });
      } else {
        Storage.medias = _;
        Provider.of<Repository>(
                Navigation.instance.navigatorKey.currentState!.context,
                listen: false)
            .addMedias(_);
        // for (var i in _) {
        //   fetchPosts(i.id);
        // }
      }
    });
  }

  void fetchServerCategory() async {
    final response = await Access().fetchCategory();
    if (response.status ?? false) {
      Provider.of<Repository>(
              Navigation.instance.navigatorKey.currentState!.context,
              listen: false)
          .setServerCategory(response.categories ?? []);
    }
    final response1 = await Access().fetchProducts();
    if (response1.status ?? false) {
      Provider.of<Repository>(
              Navigation.instance.navigatorKey.currentState!.context,
              listen: false)
          .setProduct(response1.products ?? []);
    }
    final response2 = await Access().fetchTags();
    if (response2.status ?? false) {
      Provider.of<Repository>(
              Navigation.instance.navigatorKey.currentState!.context,
              listen: false)
          .setNewTags(response2.tags ?? []);
    }
  }
}
