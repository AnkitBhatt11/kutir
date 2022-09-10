import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:golpo_kutir/components/bottom_bar.dart';
import 'package:golpo_kutir/components/button.dart';
import 'package:golpo_kutir/components/custom_textfield.dart';
import 'package:golpo_kutir/constants.dart';
import 'package:golpo_kutir/navigation/navigation.dart';

import '../../networking/access.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Image.asset("assets/images/logo_black.png",height: 48,),
        actions: [
          Container(
            height: 38,
            width: 38,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle
            ),
            child: Image.asset("assets/images/profile_default_white.png",height: 24,),
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
              const Text("সাইন ইন",style: TextStyle( fontFamily: 'kalpurush',fontWeight: FontWeight.w600,fontSize: 32),),
              const SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                    ),
                  ),
                  const SizedBox(width: 8,),
                  const Text("হলো দরকারি",style: TextStyle(
                      fontFamily: 'kalpurush',
                      fontSize: 13),),
                ],
              ),
              const SizedBox(height: 36,),
              CustomTextField(
                  controller: TextEditingController(),
                  hint: "ই-মেল",
                  isRequired: true,
              ),
              const SizedBox(height: 16,),
              CustomTextField(
                  controller: TextEditingController(),
                  hint: "পাসওয়ার্ড",
                  isRequired: true,
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         isRememberMe = !isRememberMe;
                       });
                     },
                     behavior: HitTestBehavior.opaque,
                     child: Container(
                       height: 24,
                       width: 24,
                       decoration: BoxDecoration(
                         color: (isRememberMe) ? Constants.primaryColor : Colors.grey.shade200,
                         borderRadius: BorderRadius.circular(4)
                       ),
                       child: Icon(Icons.check,size: 20,color: (isRememberMe) ? Colors.white : Colors.grey.shade200,),
                     ),
                   ),
                   const SizedBox(width: 16,),
                   Expanded(
                       child: Text("এই ডিভাইস এ লগড ইন থাকুন",style: TextStyle( fontFamily: 'kalpurush',fontWeight: FontWeight.w500,fontSize: 14,color: Colors.grey.shade600),)
                   ),
                ],
              ),
              const SizedBox(height: 30,),
              Button(
                  text: "সাইন ইন করুন",

                  onPressed: (){
                    Access().signin();
                    Navigation.instance.navigateAndRemoveUntil("/home");
                  }
              ),
              const SizedBox(height: 20,),
              Text("একাউন্ট না থাকলে",style: TextStyle( fontFamily: 'kalpurush',fontWeight: FontWeight.w500,fontSize: 14,color: Colors.grey.shade600),),
              const SizedBox(height: 20,),
              Button(
                  text: "সাইন আপ করুন",
                  onPressed: (){
                    Navigation.instance.navigate("/register");
                  },
                  type: ButtonType.outlined,
              ),
              const SizedBox(height: 36,),
              Row(
                children: [
                  const Expanded(
                      child: Text("গল্প কুটির পরিবারের\nস্বদস্য হন",style: TextStyle( fontFamily: 'kalpurush',fontWeight: FontWeight.w500,fontSize: 19),)
                  ),
                  const SizedBox(width: 24,),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle
                    ),
                  )
                ],
              ),
              const SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("About Us",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text("Faqs",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text("Terms",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text("Privacy Policy",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ],
              ),
              const SizedBox(height: 36,),
              const Text("© 2022 গল্প কুটির",style: TextStyle( fontFamily: 'kalpurush',fontSize: 16,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}
