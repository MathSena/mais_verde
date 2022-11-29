import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mais_verde/src/pages/auth/controller/auth_controller.dart';
import 'package:mais_verde/src/pages_route/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mais Verde',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute:  PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}


