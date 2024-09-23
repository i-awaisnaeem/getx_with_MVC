import 'dart:async';
import 'package:getx_with_mvc/resources/getx_localization/languages.dart  ';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/assets/image_assets.dart';
import '../view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(ImageAssets.splashImage)),
            SizedBox( height: Get.height * .1,),
            const Text('Splash Screen',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.w700
            ),),
            SizedBox( height: Get.height * .1,),
            Text('Network_Exception'.tr)
          ],
        ),
      ),
    );
  }
}
