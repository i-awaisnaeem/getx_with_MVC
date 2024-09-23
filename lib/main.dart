import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/getx_localization/languages.dart';
import 'package:getx_with_mvc/resources/routes/routes.dart';
import 'package:getx_with_mvc/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en' , 'US'),
      title: 'Getx with MVC',
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
