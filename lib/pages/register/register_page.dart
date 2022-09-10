import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golpo_kutir/components/bottom_bar.dart';
import 'package:golpo_kutir/components/button.dart';
import 'package:golpo_kutir/components/custom_textfield.dart';
import 'package:golpo_kutir/constants.dart';
import 'package:golpo_kutir/models/SignupData.dart';
import 'package:golpo_kutir/navigation/navigation.dart';

import '../../networking/access.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isRememberMe = false;

  var _name = TextEditingController();
  var _username = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _cnfpassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    GetRazorpay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo_black.png",
          height: 48,
        ),
        actions: [
          Container(
            height: 38,
            width: 38,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                color: Colors.grey.shade200, shape: BoxShape.circle),
            child: Image.asset(
              "assets/images/profile_default_white.png",
              height: 24,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const Text(
                "সাইন আপ",
                style: TextStyle( fontFamily: 'kalpurush',fontWeight: FontWeight.w600, fontSize: 40),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "হলো দরকারি",
                    style: TextStyle( fontFamily: 'kalpurush',fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/profile_default.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _name,
                hint: "আপনার নাম",
                isRequired: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hint: "আপনার পদবি",
                isRequired: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _username,
                hint: "ইউজারনেম",
                isRequired: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hint: "মোবাইল",
                isRequired: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _email,
                hint: "ই-মেল",
                isRequired: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _password,
                hint: "পাসওয়ার্ড",
                isRequired: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _cnfpassword,
                hint: "পাসওয়ার্ড পুনরায় লিখুন",
                isRequired: true,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "মেম্বারশিপ প্ল্যান্স",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "প্ল্যান পরেও বাছতে পারেন",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey.shade200)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Column(
                        children: [
                          Text(
                            "৩ মাস",
                            style: TextStyle( fontFamily: 'kalpurush',
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "কোয়ার্টার",
                            style: TextStyle( fontFamily: 'kalpurush',
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "পমাত্র",
                            style: TextStyle( fontFamily: 'kalpurush',
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "₹ 220",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MaterialButton(
                            elevation: 0,
                            height: 32,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onPressed: () {},
                            child: Text(
                              "বাছুন",
                              style: const TextStyle( fontFamily: 'kalpurush',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey.shade200)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Column(
                        children: [
                          Text(
                            "৬ মাস",
                            style: TextStyle( fontFamily: 'kalpurush',
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "অর্ধ-বার্ষিক",
                            style: TextStyle( fontFamily: 'kalpurush',
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "পমাত্র",
                            style: TextStyle( fontFamily: 'kalpurush',
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "₹ 420",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MaterialButton(
                            elevation: 0,
                            height: 32,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onPressed: () {},
                            child: Text(
                              "বাছুন",
                              style: const TextStyle( fontFamily: 'kalpurush',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey.shade200)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Column(
                        children: [
                          Text(
                            "১২ মাস",
                            style: TextStyle( fontFamily: 'kalpurush',
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "বার্ষিক",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "পমাত্র",
                            style: TextStyle( fontFamily: 'kalpurush',
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "₹ 620",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MaterialButton(
                            elevation: 0,
                            height: 32,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onPressed: () {},
                            child: Text(
                              "বাছুন",
                              style: const TextStyle( fontFamily: 'kalpurush',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          color: (isRememberMe)
                              ? Constants.primaryColor
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(4)),
                      child: Icon(
                        Icons.check,
                        size: 20,
                        color: (isRememberMe)
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
                    "এই ডিভাইস এ লগড ইন থাকুন",
                    style: TextStyle( fontFamily: 'kalpurush',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey.shade600),
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                  text: "সাইন আপ করুন",
                  onPressed: () {
                    Access().signup();
                    // if (_name.text.isNotEmpty &&
                    //     _email.text.isNotEmpty &&
                    //     _password.text.isNotEmpty &&
                    //     _cnfpassword.text.isNotEmpty &&
                    //     _password.text == _cnfpassword.text) {
                    //   Signup();
                    // } else {
                    //   Fluttertoast.showToast(
                    //       msg: "Enter all the details",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.CENTER,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Colors.red,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0);
                    // }
                    // Navigation.instance.goBack();
                  }),
              const SizedBox(
                height: 20,
              ),
              Text(
                "একাউন্ট রয়েছে?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey.shade600),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                text: "সাইন ইন করুন",
                onPressed: () {
                  Navigation.instance.goBack();
                },
                type: ButtonType.outlined,
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "গল্প কুটির পরিবারের\nস্বদস্য হন",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  )),
                  const SizedBox(
                    width: 24,
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle),
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Faqs",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Terms",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              const Text(
                "© 2022 গল্প কুটির",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Signup() async {
    Access().Signup(SignupData(
      _username.text,
      _name.text,
      '',
      '',
      _email.text,
      '',
      '',
      '',
      _password.text,
      ''
    )).then((value) {
      if (value=='Failed') {
        Fluttertoast.showToast(
                  msg: "Oops something is wrong",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
      } else {
        print(value);
        Fluttertoast.showToast(
            msg: "${value}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  void GetRazorpay() {
    Access().GetRazorpay();
  }
}
