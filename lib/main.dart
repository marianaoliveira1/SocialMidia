import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/firebase_options.dart';
import 'package:socialmidia/pages/home/home_page.dart';
import 'package:socialmidia/pages/login/login_page.dart';
import 'package:socialmidia/pages/register/register_page.dart';
import 'package:socialmidia/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return ScreenUtilInit(
      designSize: const Size(380, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Social Midia',
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        home: const LoginPage(),
      ),
    );
  }
}
