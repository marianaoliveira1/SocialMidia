import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmidia/pages/login/login_page.dart';
import 'package:socialmidia/pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(380, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Social Midia',
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
        home: const LoginPage(),
      ),
    );
  }
}
