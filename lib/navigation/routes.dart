import 'package:flutter/material.dart';
import 'package:golpo_kutir/pages/home/home_page.dart';
import 'package:golpo_kutir/pages/login/login_page.dart';
import 'package:golpo_kutir/pages/menu/menu_page.dart';
import 'package:golpo_kutir/pages/register/register_page.dart';
import 'package:golpo_kutir/pages/splash/splash_page.dart';
import '../components/slider_transition.dart';
import '../pages/cart_page.dart';
import '../pages/product/product_page.dart';
import 'fade_transition_route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return FadeTransitionPageRouteBuilder(page: SplashPage());

    //login pages
    case '/login':
      return FadeTransitionPageRouteBuilder(page: LoginPage());
    case '/register':
      return FadeTransitionPageRouteBuilder(page: RegisterPage());

    //main pages
    case '/home':
      return FadeTransitionPageRouteBuilder(page: HomePage());
    case '/menu':
      return SlideRightRoute(page: MenuPage());
    case '/CartPage':
      return FadeTransitionPageRouteBuilder(page: CartPage());
    case '/productPage':
      return FadeTransitionPageRouteBuilder(page: ProductPage());

    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('404 Page not found'),
          ),
        );
      });
  }
}
