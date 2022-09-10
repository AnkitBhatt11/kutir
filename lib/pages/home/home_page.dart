import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:golpo_kutir/Helper/Storage.dart';
import 'package:golpo_kutir/components/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:sizer/sizer.dart';
import '../../Helper/Repository.dart';
import '../../models/Post.dart';
import '../../navigation/navigation.dart';
import '../../networking/access.dart';
import 'PostView.dart';
import 'category_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController? carouselController;

  bool _visible = false;

  int _direction = 0;

  var _current = 0;

  var which = 0;

  Widget categoryList(index) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          _visible = false;
        });
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          setState(() {
            _visible = false;
          });
        });
      }
    });
    return Consumer<Repository>(
      builder: (cont, current, wid) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: 30.h,
            child: Stack(
              children: [
                NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    setState(() {
                      if (direction == ScrollDirection.reverse) {
                        print('reverse');
                        _direction = 0;
                        _visible = true;
                        _current = index;
                      } else if (direction == ScrollDirection.forward) {
                        print('forward');
                        _direction = 1;
                        _visible = true;
                        _current = index;
                      }
                    });
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: current.posts[index].length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    itemBuilder: (context, pos) {
                      var data = current.posts[index][pos];
                      return current.posts[index].isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PostView(data),
                                  ),
                                );
                              },
                              child: Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                elevation: 0,
                                shadowColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0),
                                      topRight: Radius.circular(0)),
                                ),
                                child: SizedBox(
                                  // height: data.actual_post_author == null ||
                                  //         data.actual_post_author == ''
                                  //     ? 20.h
                                  //     : data.title.length > 10
                                  //         ? 10.h
                                  //         : 9.h,
                                  width: 40.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 12.h,
                                        width: double.infinity,
                                        // padding: const EdgeInsets.only(
                                        //     right: 16, left: 16),
                                        // decoration: BoxDecoration(
                                        //   // color: Colors.white,
                                        //     border: Border.all(color: Colors.grey.shade200)),
                                        child: Image.network(
                                          data.image,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      data.actual_post_author == null ||
                                              data.actual_post_author == ''
                                          ? Container()
                                          : data.title.length > 10
                                              ? const SizedBox(
                                                  height: 17,
                                                )
                                              : const SizedBox(
                                                  height: 10,
                                                ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            data.actual_post_author == null ||
                                                    data.actual_post_author ==
                                                        ''
                                                ? Container()
                                                : Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 18),
                                                    child: Text(
                                                      "${data.actual_post_author}",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'kalpurush',
                                                          color: Colors
                                                              .grey.shade600,
                                                          fontSize: 10.sp),
                                                    ),
                                                  ),
                                            data.actual_post_author == null ||
                                                    data.actual_post_author ==
                                                        ''
                                                ? const SizedBox(
                                                    height: 17,
                                                  )
                                                : const SizedBox(
                                                    height: 2,
                                                  ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              child: Text(
                                                "${data.title}",
                                                maxLines: 2,
                                                // overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: 'kalpurush',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.3,
                                                    fontSize: 17.sp),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                              child: Text(
                                                "January 18, 2022",
                                                style: TextStyle(
                                                    fontFamily: 'kalpurush',
                                                    color: Colors.grey.shade600,
                                                    fontSize: 8.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              height: data.actual_post_author ==
                                                          null ||
                                                      data.actual_post_author ==
                                                          ''
                                                  ? 10
                                                  : 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // child: Container(
                              //   color: Colors.white,
                              //   margin: const EdgeInsets.only(right: 16),
                              //   width: 150,
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Container(
                              //         height: 100,
                              //         width: double.infinity,
                              //         padding:
                              //             EdgeInsets.only(right: 16, left: 16),
                              //         child: Image.network(
                              //           data.image,
                              //           fit: BoxFit.contain,
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 5,
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 8),
                              //         child: Text(
                              //           "${data.actual_post_author}",
                              //           style: TextStyle(
                              //               fontFamily: 'kalpurush',
                              //               color: Colors.grey.shade600,
                              //               fontSize: 14),
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 4,
                              //       ),
                              //       Padding(
                              //         padding:
                              //             EdgeInsets.symmetric(horizontal: 8),
                              //         child: Text(
                              //           "${data.title}",
                              //           maxLines: 2,
                              //           overflow: TextOverflow.ellipsis,
                              //           style: TextStyle(
                              //               height: 1.4,
                              //               fontFamily: 'kalpurush',
                              //               fontWeight: FontWeight.w600,
                              //               fontSize: 20),
                              //         ),
                              //       ),
                              //       const SizedBox(
                              //         height: 4,
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 8),
                              //         child: Text(
                              //           "January 18, 2022",
                              //           style: TextStyle(
                              //               color: Colors.grey.shade600,
                              //               fontSize: 11),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            )
                          : Container();
                    },
                  ),
                ),
                Visibility(
                  visible:
                      _visible == true && _direction == 0 && _current == index
                          ? true
                          : false,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Container(
                          // padding: EdgeInsets.only(right: 2),
                          color: Color(0xffE8E8E8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scrollController.animateTo(
                                      _scrollController
                                          .position.minScrollExtent,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      _visible == true && _direction == 1 && _current == index
                          ? true
                          : false,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          color: Color(0xffE8E8E8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchMedias();
    fetchTags();
    carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.25,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo_black.png",
          // height: 48,
          width: 63,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage<Post>(
                  barTheme: ThemeData(
                    textTheme: const TextTheme(
                      headline6: TextStyle(
                        decoration: TextDecoration.none,
                        decorationThickness: 0.0000001,
                        decorationColor:
                            Colors.transparent, // color of text underline
                      ),
                    ),
                    backgroundColor: Colors.white,
                    textSelectionTheme: const TextSelectionThemeData(
                      selectionHandleColor: Colors.black,
                      // Change bubble to red
                      cursorColor: Colors.black, // Change cursor
                    ),
                    appBarTheme: Theme.of(context).appBarTheme.copyWith(
                        backgroundColor: Colors.white,
                        iconTheme: const IconThemeData(
                          color: Colors.black,
                        )),
                  ),
                  items:
                      Provider.of<Repository>(context, listen: false).getList(),
                  searchLabel: 'Search Posts',
                  suggestion: const Center(
                    child: Text('Filter by post name'),
                  ),
                  failure: const Center(
                    child: Text('No Posts found.'),
                  ),
                  filter: (post) => [
                    post.title,
                    post.content,
                    post.slug,
                  ],
                  builder: (post) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => PostView(post),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.slug),
                      trailing: SizedBox(
                        height: 60,
                        width: 50,
                        child: CachedNetworkImage(
                          imageUrl: post.image,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              EvaIcons.search,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigation.instance.navigate('/CartPage');
            },
            child: Badge(
              badgeColor: Colors.grey.shade200,
              badgeContent: const Text(
                '3',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              child: const Icon(
                EvaIcons.shoppingCart,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigation.instance.navigateAndRemoveUntil("/login");
            },
            child: Container(
              height: 38,
              width: 38,
              margin: const EdgeInsets.only(right: 16, left: 8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200, shape: BoxShape.circle),
              child: Image.asset(
                "assets/images/profile_default_white.png",
                height: 24,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: Provider.of<Repository>(context, listen: true).subCateg
                ? 0.2
                : 1.0,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<Repository>(builder: (cont, data, wid) {
                    return SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          CarouselSlider(
                            carouselController: carouselController,
                            options: CarouselOptions(
                                height: 200, viewportFraction: 1.0),
                            items: data.medias.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.white),
                                    child: CachedNetworkImage(
                                      imageUrl: i.og_url,
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                              height: 200,
                                              width: 200,
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Container(
                                // padding: EdgeInsets.only(right: 2),
                                color: Color(0xffE8E8E8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        carouselController?.nextPage();
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_ios,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: SizedBox(
                          //     height: 50,
                          //     width: 50,
                          //     child: Container(
                          //       padding: EdgeInsets.only(right: 5),
                          //       color: Color(0xffE8E8E8),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.end,
                          //         children: [
                          //           GestureDetector(
                          //             onTap: () {
                          //               carouselController?.previousPage();
                          //             },
                          //             child: Icon(Icons.arrow_back_ios,),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                color: const Color(0xffE8E8E8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        carouselController?.nextPage();
                                      },
                                      child:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  Consumer<Repository>(
                    builder: (cont, current, wid) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: current.categories.length,
                        itemBuilder: (cont, index) {
                          var data = current.categories[index];
                          return current.posts[index].isNotEmpty
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${data.name}",
                                            style: const TextStyle(
                                                fontFamily: 'kalpurush',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 28),
                                          ),
                                          const Spacer(),
                                          MaterialButton(
                                            elevation: 0,
                                            height: 32,
                                            color: Colors.black,
                                            // shape: RoundedRectangleBorder(
                                            //   borderRadius: BorderRadius.circular(4),
                                            // ),
                                            padding: const EdgeInsets.only(
                                              left: 12.2,
                                              right: 11,
                                              top: 9,
                                              bottom: 9,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          CategoryView(index),
                                                ),
                                              );
                                            },
                                            child: const Text(
                                              "আরো",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'kalpurush',
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    categoryList(index),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                )
                              : Container();
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Row(
                  //     children: [
                  //       const Text("রোম্যান্টিক",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                  //       const Spacer(),
                  //       MaterialButton(
                  //         elevation: 0,
                  //         height: 32,
                  //         color: Colors.black,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //         ),
                  //         onPressed: (){},
                  //         child: Text("আরো",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 16,),
                  // categoryList(),
                  // const SizedBox(height: 80,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<Repository>(builder: (cont, current, wid) {
                  return Visibility(
                    visible: current.subCateg,
                    child: SizedBox(
                      width: double.infinity,
                      height: current.which == 0 ? 300 : 200,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 10,
                          bottom: 10,
                        ),
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${current.which == 0 ? "গল্প" : "বই"}",
                              style: const TextStyle(
                                  fontFamily: 'kalpurush',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 28),
                            ),
                            current.which == 0
                                ? Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            current.which == 0
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : Container(),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigation.instance.navigate('/productPage');
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            'E-book',
                                            style: const TextStyle(
                                                fontFamily: 'kalpurush',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: 28),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          'Book',
                                          style: const TextStyle(
                                              fontFamily: 'kalpurush',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 28),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                BottomBar(),
              ],
            ),
          )
        ],
      ),
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
        });
      } else {
        Storage.medias = _;
        Provider.of<Repository>(
                Navigation.instance.navigatorKey.currentState!.context,
                listen: false)
            .addMedias(_);
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
}
