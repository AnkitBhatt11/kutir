import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:sizer/sizer.dart';
import '../../Helper/Repository.dart';
import '../../Helper/Storage.dart';
import '../../models/Post.dart';
import 'PostView.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class CategoryView extends StatefulWidget {
  final index;

  CategoryView(this.index);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Consumer<Repository>(
          builder: (cont, current, wid) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 14.0, right: 14.0, bottom: 8.0, top: 150),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        // alignment: WrapAlignment.start,
                        children: current.posts[widget.index]
                            .map((post) => MyCard(post, context))
                            .toList(),
                      ),
                    ),
                  ),
                  // child: GridView.builder(
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       mainAxisSpacing: 10,
                  //       crossAxisSpacing: 20,
                  //       childAspectRatio: 2.2 / 3,
                  //     ),
                  //     // shrinkWrap: true,
                  //     itemCount: current.posts[widget.index].length,
                  //     itemBuilder: (cont, pos) {
                  //       var data = current.posts[widget.index][pos];
                  //       return Card(
                  //         elevation: 0,
                  //         shadowColor: Colors.transparent,
                  //         shape: const RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.only(
                  //                 bottomRight: Radius.circular(0),
                  //                 topRight: Radius.circular(0)),
                  //             ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             SizedBox(
                  //               height: 100,
                  //               width: double.infinity,
                  //               // padding: const EdgeInsets.only(
                  //               //     right: 16, left: 16),
                  //               // decoration: BoxDecoration(
                  //               //   // color: Colors.white,
                  //               //     border: Border.all(color: Colors.grey.shade200)),
                  //               child: Image.network(
                  //                 data.image,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             data.actual_post_author==null||data.actual_post_author==''?Container():const SizedBox(
                  //               height: 10,
                  //             ),
                  //             Expanded(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   data.actual_post_author==null||data.actual_post_author==''?Container():Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 18),
                  //                     child: Text(
                  //                       "${data.actual_post_author}",
                  //                       style: TextStyle(
                  //                           fontFamily: 'kalpurush',
                  //                           color: Colors.grey.shade600,
                  //                           fontSize: 14),
                  //                     ),
                  //                   ),
                  //                   data.actual_post_author==null||data.actual_post_author==''?Container():const SizedBox(
                  //                     height: 2,
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 18),
                  //                     child: Text(
                  //                       "${data.title}",
                  //                       maxLines: 2,
                  //                       // overflow: TextOverflow.ellipsis,
                  //                       style: const TextStyle(
                  //                           fontFamily: 'kalpurush',
                  //                           fontWeight: FontWeight.w600,
                  //                           height: 1.3,
                  //                           fontSize: 21),
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 5,
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         horizontal: 18),
                  //                     child: Text(
                  //                       "January 18, 2022",
                  //                       style: TextStyle(
                  //                           fontFamily: 'kalpurush',
                  //                           color: Colors.grey.shade600,
                  //                           fontSize: 11),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: data.actual_post_author==null||data.actual_post_author==''?10:5,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //
                  //
                  //           ],
                  //         ),
                  //       );
                  //     }),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white,
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/logo_black.png",
                            // height: 48,
                            width: 63,
                          ),
                          Spacer(),
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
                                          decorationColor: Colors
                                              .transparent, // color of text underline
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      textSelectionTheme:
                                          const TextSelectionThemeData(
                                        selectionHandleColor: Colors.black,
                                        // Change bubble to red
                                        cursorColor:
                                            Colors.black, // Change cursor
                                      ),
                                      appBarTheme: Theme.of(context)
                                          .appBarTheme
                                          .copyWith(
                                              backgroundColor: Colors.white,
                                              iconTheme: const IconThemeData(
                                                color: Colors.black,
                                              )),
                                    ),
                                    items: Provider.of<Repository>(context,
                                            listen: false)
                                        .getList(),
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
                                            builder: (BuildContext context) =>
                                                PostView(post),
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
                              )),
                          Container(
                            height: 38,
                            width: 38,
                            margin: const EdgeInsets.only(right: 16, left: 8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle),
                            child: Image.asset(
                              "assets/images/profile_default_white.png",
                              height: 24,
                            ),
                          )
                        ],
                      ),
                      Text(
                        Storage.categories[widget.index].name,
                        style: const TextStyle(
                            fontFamily: 'kalpurush',
                            fontSize: 38,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget MyCard(Post data, context) {
  bool isa = false;
  return Consumer<Repository>(builder: (cont, current, wid) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0), topRight: Radius.circular(0)),
      ),
      child: SizedBox(
        height: data.actual_post_author == null || data.actual_post_author == ''
            ? 220
            : data.title.length > 10
                ? 28.9.h
                : 24.8.h,
        width: 40.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            data.actual_post_author == null || data.actual_post_author == ''
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data.actual_post_author == null ||
                          data.actual_post_author == ''
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text(
                            "${data.actual_post_author}",
                            style: TextStyle(
                                fontFamily: 'kalpurush',
                                color: Colors.grey.shade600,
                                fontSize: 11.sp),
                            //14
                          ),
                        ),
                  data.actual_post_author == null ||
                          data.actual_post_author == ''
                      ? const SizedBox(
                          height: 17,
                        )
                      : const SizedBox(
                          height: 2,
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "${data.title}",
                      maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'kalpurush',
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          fontSize: 16.sp),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () {
                            print('tyty$data');
                            current.addToCart(data);
                          //  Repository().addToCart(data);
                            //  context.read<Repository>().addToCart(data);
                            print('uuuu${current.produ}');
                          },
                          child: Text('Add to cart'))

                      //  Text(
                      //   "January 18, 2022",
                      //   style: TextStyle(
                      //       fontFamily: 'kalpurush',
                      //       color: Colors.grey.shade600,
                      //       fontSize: 8.sp),
                      // ),
                      ),
                  SizedBox(
                    height: data.actual_post_author == null ||
                            data.actual_post_author == ''
                        ? 10
                        : 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
