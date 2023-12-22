import 'package:flutter/material.dart';
import 'package:socialmidia/pages/home/home_page.dart';
import 'package:socialmidia/pages/login/login_page.dart';
import 'package:socialmidia/pages/register/register_page.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/': (context) => const HomePage(),
  };
}
