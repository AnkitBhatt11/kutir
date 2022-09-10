import 'package:flutter/material.dart';
import 'package:golpo_kutir/components/slider_transition.dart';
import 'package:golpo_kutir/navigation/navigation.dart';
import 'package:provider/provider.dart';

import '../Helper/Repository.dart';
import '../Helper/Storage.dart';
import '../pages/home/category_view.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(

      builder: (cont,data,wid){
        return Container(
          color: Colors.black,
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 10, top: 4, bottom: 5, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Provider.of<Repository>(context,listen: false).setWhich(0);
                  Provider.of<Repository>(context,listen: false).setVisibility(true);

                },
                child: Container(
                  decoration: BoxDecoration(
                    border: data.subCateg&&data.which==0?const Border(
                      bottom: BorderSide(width: 2, color: Colors.white),
                    ):Border.all(width: 0),
                  ),
                  height: 50,
                  child: const Center(
                    child: Text(
                      "গল্প",
                      style: TextStyle(
                          fontFamily: 'kalpurush',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "ধারাবাহিক",
                    style: TextStyle(
                        fontFamily: 'kalpurush',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "গ্রাফিক স্টোরিজ",
                    style: TextStyle(
                        fontFamily: 'kalpurush',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Provider.of<Repository>(context,listen: false).setWhich(1);
                  Provider.of<Repository>(context,listen: false).setVisibility(true);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: data.subCateg&&data.which==1?const Border(
                      bottom: BorderSide(width: 2, color: Colors.white),
                    ):Border.all(width: 0),
                  ),
                  height: 50,
                  child: const Center(
                    child: Text(
                      "বই",
                      style: TextStyle(
                          fontFamily: 'kalpurush',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Center(
              //     child: SizedBox(
              //       height: 50,
              //       child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: Storage.categories.length,
              //           itemBuilder: (cont, index) {
              //             var data = Storage.categories[index].name;
              //             return GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   SlideRightRoute(
              //                     page: CategoryView(index),
              //                   ),
              //                 );
              //               },
              //               child: SizedBox(
              //                 height: 40,
              //                 width: 60,
              //                 child: Center(
              //                   child: Text(
              //                     data,
              //                     style: const TextStyle(
              //                         fontFamily: 'kalpurush',
              //                         fontSize: 15,
              //                         fontWeight: FontWeight.w500,
              //                         color: Colors.white),
              //                   ),
              //                 ),
              //               ),
              //             );
              //           }),
              //     ),
              //   ),
              // ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigation.instance.navigate("/menu");
                },
                child: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        );
      },

    );
  }

  show_sub_categ(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.music_note),
                title: const Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
