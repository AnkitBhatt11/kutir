import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golpo_kutir/components/button.dart';
import 'package:golpo_kutir/navigation/navigation.dart';
import 'package:provider/provider.dart';

import '../../Helper/Repository.dart';
import '../../Helper/Storage.dart';
import '../home/PostView.dart';
import '../home/category_view.dart';

class MenuPage extends StatelessWidget {
  List<String> items = [
    "গল্প",
    "ধারাবাহিক",
    "গ্রাফিক স্টোরিজ",
    "বই",
    "অনুগল্প",
    "সম্পাদকের পছন্দ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer<Repository>(
          builder: (cont, data, wid) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "মেনু",
                            style: TextStyle(
                                fontFamily: 'kalpurush',
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Column(
                            children: const [
                              Text(
                                "শুভ সন্ধ্যা",
                                style: TextStyle(
                                    fontFamily: 'kalpurush',
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                              Text(
                                "পাঠক",
                                style: TextStyle(
                                    fontFamily: 'kalpurush',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigation.instance.navigateAndRemoveUntil("/login");
                            },
                            child: Container(
                              height: 38,
                              width: 38,
                              margin: const EdgeInsets.only(left: 16),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle),
                              child: Image.asset(
                                "assets/images/profile_default_white.png",
                                height: 24,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListView.separated(
                        itemCount: data.categories.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, pos) {
                          return const Divider(
                            color: Colors.white,
                            height: 1,
                          );
                        },
                        itemBuilder: (context, pos) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  print('Here');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CategoryView(pos),
                                    ),
                                  );
                                },
                                child: IgnorePointer(
                                  ignoring: false,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(right: 8.0),
                                    // tilePadding:const EdgeInsets.only(right:8.0),
                                    iconColor: Colors.black,
                                    // collapsedIconColor: Colors.black,/**/
                                    title: Text(
                                      data.categories[pos].name,
                                      style: const TextStyle(
                                          fontFamily: 'kalpurush',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              data.posts[pos].isNotEmpty&&(data.categories[pos].name=='গল্প'||data.categories[pos].name=='বই')?SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: ListView.separated(
                                  itemCount: data.posts[pos].length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  separatorBuilder: (context, pos) {
                                    return const Divider(
                                      color: Colors.white,
                                      height: 1,
                                    );
                                  },
                                  itemBuilder: (BuildContext context, int i) {
                                    return SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (BuildContext context) =>
                                          //         CategoryView(pos),
                                          //   ),
                                          // );
                                          Navigator.push(context, MaterialPageRoute (
                                            builder: (BuildContext context) => PostView(Storage.posts[pos][i]),
                                          ),);
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              margin:
                                              const EdgeInsets.only(right: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image:
                                                  CachedNetworkImageProvider(
                                                      Storage
                                                          .posts[pos][i].image
                                                          .toString()),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              Storage.posts[pos][i].title,
                                              style: const TextStyle(
                                                  fontFamily: 'kalpurush',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ):Container(),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Button(
                              text: "সাইন ইন করুন",
                              onPressed: () {},
                              color: Colors.white,
                              type: ButtonType.outlined,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 1,
                            child: Button(
                              text: "সাইন ইন করুন",
                              onPressed: () {},
                              color: Colors.white,
                              textColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.white,
                        thickness: 0.8,
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "গল্প কুটির পরিবারের\nস্বদস্য হন",
                            style: TextStyle(
                                fontFamily: 'kalpurush',
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                                color: Colors.white),
                          )),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "About Us",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "Faqs",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "Terms",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text(
                          "© 2022 গল্প কুটির",
                          style: TextStyle(
                              fontFamily: 'kalpurush',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigation.instance.goBack();
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
