import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import '../../Helper/Repository.dart';
import '../../components/button.dart';
import '../../components/custom_textfield.dart';
import '../../constants.dart';
import '../../models/Comments.dart';
import '../../models/Post.dart';
import '../../models/Tag.dart';
import '../../navigation/navigation.dart';
import '../../networking/access.dart';

class PostView extends StatefulWidget {
  final Post post;
  List<String>? tag_names;

  PostView(this.post) {
    tag_names = List.empty(growable: true);
  }

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  var list = [
    Comment(
      0,
      'ইউজারনেম',
      '16/12/22',
      'প্ল্যান পরেও বাছতে পারেন টার্মস এন্ড কন্ডিশনস প্ল্যান পরেও ',
    ),
    Comment(
      1,
      'টার্মস',
      '17/12/22',
      'kalpurush2',
    ),
  ];

  var isAccepted = false;

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
                          decoration:TextDecoration.none,
                          decorationThickness: 0.0000001,
                          decorationColor: Colors.transparent, // color of text underline
                        ),
                      ),
                      backgroundColor: Colors.white,
                      textSelectionTheme: const TextSelectionThemeData(
                        selectionHandleColor: Colors.black, // Change bubble to red
                        cursorColor: Colors.black, // Change cursor
                      ),
                      appBarTheme: Theme.of(context).appBarTheme.copyWith(
                          backgroundColor: Colors.white,
                          iconTheme: const IconThemeData(
                            color: Colors.black,
                          )
                      ),
                    ),
                    items: Provider.of<Repository>(context, listen: false)
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
                        Navigator.push(context, MaterialPageRoute (
                          builder: (BuildContext context) => PostView(post),
                        ),);
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
                color: Colors.grey.shade200, shape: BoxShape.circle),
            child: Image.asset(
              "assets/images/profile_default_white.png",
              height: 24,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  widget.post.title,
                  style: const TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  widget.post.Written_by,
                  style: const TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  widget.post.date.toString().split('T')[0],
                  style: const TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CachedNetworkImage(
                  height: 200,
                  width: 350,
                  imageUrl: widget.post.image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  getHTMLBodyPlainTextFromHTMLDocument(widget.post.content),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<Repository>(
                builder: (con, current, wid) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: <Widget>[...generate_tags(current)],
                    ),
                  );
                  // return SizedBox(
                  //   width: double.infinity, // <-- match_parent
                  //   height: 150,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 30, right:30),
                  //     child: GridView.builder(
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 30,
                  //           mainAxisSpacing: 10,
                  //           childAspectRatio:4,
                  //         ),
                  //         itemCount: current.current_tags.length,
                  //         itemBuilder: (cont, i) {
                  //           return Container(
                  //             decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               border: Border.all(
                  //                 color: Colors.black,
                  //                 width: 0.8
                  //               ),
                  //             ),
                  //             child: Center(
                  //               child: Text(
                  //                 '#${current.current_tags[i]}' ?? "NA",
                  //                 style: const TextStyle(
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         }),
                  //   ),
                  // );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "কমেণ্টস",
                  style: TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: ListView.separated(
                    itemCount: list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (cont, int) {
                      var data = list[int];
                      return Card(
                        child: SizedBox(
                          width: 220,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Container(
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                              width: 2, color: Colors.grey),
                                        ),
                                        child: const Icon(
                                          Icons.people,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.name ?? "",
                                          style: const TextStyle(
                                              fontFamily: 'kalpurush',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          data.date ?? "",
                                          style: const TextStyle(
                                              fontFamily: 'kalpurush',
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                data.desc ?? "",
                                style: const TextStyle(
                                    fontFamily: 'kalpurush',
                                    color: Colors.black,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity - 20,
                                height: 45,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left:19, right: 19),
                                  child: ElevatedButton(
                                      child: const Text(
                                        "উত্তর দিন",
                                        style: TextStyle(
                                            fontFamily: 'kalpurush',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      style: ButtonStyle(
                                        shadowColor: MaterialStateProperty.all<Color>(Colors.white) ,
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                              side: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      onPressed: () {}),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                  },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "কমেণ্ট করুন",
                  style: TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              const Center(
                child: Text(
                  "মন্তব্যের জন্য নিবন্ধন বাধ্যতামূলক নয়",
                  style: TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: TextEditingController(),
                      hint: "এখানে লিখ",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hint: "নাম",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hint: "ই-মেল",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hint: "ওয়েবসাইট",
                      isRequired: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAccepted = !isAccepted;
                            });
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                color: (isAccepted)
                                    ? Constants.primaryColor
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4)),
                            child: Icon(
                              Icons.check,
                              size: 20,
                              color: (isAccepted)
                                  ? Colors.white
                                  : Colors.grey.shade200,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Text(
                          "মন্তব্য করে আপনি আমাদের গোপনীয়তা নীতি গ্রহণ করছেন",
                          style: TextStyle(
                              fontFamily: 'kalpurush',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey.shade600),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(text: "কমেণ্ট", onPressed: () {}),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "গল্প কুটির পরিবারের\nস্বদস্য হন",
                    style: TextStyle(
                        fontFamily: 'kalpurush',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    "Faqs",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    "Terms",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: const Text(
                  "© 2022 গল্প কুটির",
                  style: TextStyle(
                      fontFamily: 'kalpurush',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getHTMLBodyPlainTextFromHTMLDocument(String htmlString) {
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    // parsedString = StringHelper.removeLineBreaks(parsedString);
    // parsedString = StringHelper.repalceMultipleSpacesWithSingleSpace(parsedString);
    return parsedString.trim();
  }

  getTitle(int data, List<Tag> list) {
    Access().GetIndividualTag(data).then((_) {
      widget.tag_names?.add(_.name ?? "NA");
      if (mounted) {
        setState(() {});
      }
    }).onError((error, stackTrace) {
      widget.tag_names?.add("NA");
      if (mounted) {
        setState(() {});
      }
    });
  }

  fetchTags() {
    for (var i in widget.post.tags) {
      Access().GetIndividualTag(i).then((_) {
        Provider.of<Repository>(
                Navigation.instance.navigatorKey.currentState!.context,
                listen: false)
            .addCurrentTag(_.name ?? "NA");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      fetchTags();
    });
  }

  generate_tags(current) {
    return current.current_tags.map((tag) => get_chip(tag)).toList();
  }

  get_chip(name) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: FilterChip(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        backgroundColor: Colors.white,
        selected: false,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        labelPadding: EdgeInsets.fromLTRB(-1, 0, -1, 0),
        selectedColor: Colors.blue.shade800,
        disabledColor: Colors.blue.shade400,
        labelStyle: const TextStyle(
            fontFamily: 'kalpurush',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        label: Text("#${name}"),
        onSelected: (bool value) {},
      ),
    );
  }
}
