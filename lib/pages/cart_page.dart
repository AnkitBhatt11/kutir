import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:golpo_kutir/pages/last_page.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:sizer/sizer.dart';
import '../Helper/Repository.dart';
import '../models/Post.dart';
import '../navigation/navigation.dart';
import 'home/PostView.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController quant = TextEditingController();
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
            onTap: () {},
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
      body: Consumer<Repository>(builder: (context, cart, chld) {
        int ui = 0;
        int subt() {
          for (int i = 0; i < cart.produ.length; i++) {
            ui = ui + int.parse(cart.produ[i].id.toString());
          }
          return ui;
        }

        return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(5.w),
            child: SingleChildScrollView(
                child: Column(children: [
              Text(
                'Cart',
                style: TextStyle(
                    fontFamily: 'kalpurush', fontSize: 38, color: Colors.black),
              ),
              cart.produ.isEmpty
                  ? Center(child: Text('No products in cart'))
                  : Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cart.produ.length,
                        itemBuilder: (BuildContext context, int index) {
                          print('tyty${cart.produ.length}');
                          if (cart.produ.length == 0) {
                            return Center(child: Text('no products in cart'));
                          } else {
                            var item = cart.produ[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                      //  tileColor: Colors.grey,
                                      leading: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          cart.removeFromCart(item);
                                        },
                                      ),

                                      // onTap: () {
                                      //   //   context.read<Cart>().removeFromCart(item);

                                      // },
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                      //   minVerticalPadding: 1,
                                      //  tileColor: Colors.grey,
                                      title: Text(
                                        'Product :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // subtitle:
                                      //     Text('cost: ${item.id.toString() ?? 'free'}'),
                                      trailing: Text(
                                        item.title.toString(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      onTap: () {
                                        //   context.read<Cart>().removeFromCart(item);
                                        cart.removeFromCart(item);
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                      //   minVerticalPadding: 1,
                                      //  tileColor: Colors.grey,
                                      title: Text(
                                        'Price :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // subtitle:
                                      //     Text('cost: ${item.id.toString() ?? 'free'}'),
                                      trailing:
                                          Text('Rs. ${item.id.toString()}'),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                        //   minVerticalPadding: 1,
                                        //  tileColor: Colors.grey,
                                        title: Text(
                                          'Quantity :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // subtitle:
                                        //     Text('cost: ${item.id.toString() ?? 'free'}'),
                                        trailing: SizedBox(
                                          height: 40,
                                          width: 100,
                                          child: TextFormField(
                                            //  autofillHints: '1',
                                            keyboardType: TextInputType.number,
                                            cursorHeight: 20,
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              hintText: '1',
                                              contentPadding: EdgeInsets.only(
                                                  left: 14.0,
                                                  bottom: 14.0,
                                                  top: 14.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xFFCCCCCC)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xFFCCCCCC)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                            // controller: quant,
                                          ),
                                        )),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                      //   minVerticalPadding: 1,
                                      //  tileColor: Colors.grey,
                                      title: Text(
                                        'Subtotal :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // subtitle:
                                      //     Text('cost: ${item.id.toString() ?? 'free'}'),
                                      trailing: Text((int.parse(
                                                  quant.text.isEmpty
                                                      ? '1'
                                                      : quant.text) *
                                              int.parse(item.id.toString()))
                                          .toString()),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.grey)),
                                    child: ListTile(
                                        //   minVerticalPadding: 1,
                                        //  tileColor: Colors.grey,
                                        title: Container(
                                          color: Colors.white,
                                          height: 40,
                                          width: 50,
                                          child: TextFormField(
                                            //  autofillHints: '1',
                                            keyboardType: TextInputType.number,
                                            cursorHeight: 20,
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              hintText: 'Coupon Code',
                                              contentPadding: EdgeInsets.only(
                                                  left: 14.0,
                                                  //  bottom: 14.0,
                                                  top: 14.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xFFCCCCCC)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xFFCCCCCC)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                            //  controller: quant,
                                          ),
                                        ),

                                        // subtitle:
                                        //     Text('cost: ${item.id.toString() ?? 'free'}'),
                                        trailing: Text('  Apply Coupon')),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.grey[200],
                                  //       border: Border.symmetric(
                                  //           vertical: BorderSide(
                                  //               width: 1, color: Colors.grey))),
                                  //   child: ListTile(
                                  //     //   minVerticalPadding: 1,
                                  //     //  tileColor: Colors.grey,
                                  //     title: Text(
                                  //       'Update Cart',
                                  //       style: TextStyle(fontWeight: FontWeight.bold),
                                  //     ),
                                  //     trailing: Text(''),
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
              cart.produ.isEmpty
                  ? Text('')
                  : Text(
                      'Cart totals',
                      style: TextStyle(
                          fontFamily: 'kalpurush',
                          fontSize: 38,
                          color: Colors.black),
                    ),
              cart.produ.isEmpty
                  ? Text('')
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              //   minVerticalPadding: 1,
                              //  tileColor: Colors.grey,
                              title: Text(
                                'SubTotal :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle:
                              //     Text('cost: ${item.id.toString() ?? 'free'}'),
                              trailing: Text(
                                subt().toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                    color: Color.fromARGB(255, 197, 191, 191))),
                            child: ListTile(
                              //   minVerticalPadding: 1,
                              //  tileColor: Colors.grey,
                              title: Text(
                                'Shipping Amount :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle:
                              //     Text('cost: ${item.id.toString() ?? 'free'}'),
                              trailing: Text(
                                'Rs. 50',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              //   minVerticalPadding: 1,
                              //  tileColor: Colors.grey,
                              title: Text(
                                'Total :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // subtitle:
                              //     Text('cost: ${item.id.toString() ?? 'free'}'),
                              trailing: Text(
                                (ui + 50).toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          // Spacer(),
                          // Expanded(
                          //   child: Center(
                          //     child: Text(
                          //       'Oops! There are no products in cart',
                          //       style: TextStyle(
                          //           fontFamily: 'kalpurush',
                          //           fontSize: 19.sp,
                          //           color: Colors.black),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 1,
                          //   width: double.infinity,
                          //   child: Divider(
                          //     color: Colors.black,
                          //     thickness: 0.2,
                          //   ),
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     child: ,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
              cart.produ.isEmpty
                  ? Text('')
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LastPage(subt: ui.toString(),)));
                      },
                      child: Text('Proceed to checkout'))
            ])));
      }),
    );
  }
}
