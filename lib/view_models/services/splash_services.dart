import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/routes/routes_name.dart';
import 'package:getx_with_mvc/view_models/controllers/user_preference_view_controller.dart';


class SplashServices {

  UserPreferenceViewController userPreferenceViewController = UserPreferenceViewController();

  void isLogin() async {

    userPreferenceViewController.getUser().then((value) async {

      if (value.token == null || value.token!.isEmpty) {
        await Future.delayed(const Duration(seconds: 3));
        Get.toNamed(RouteName.LoginScreen);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Get.toNamed(RouteName.HomeScreen);
      }

    }).onError((error, stackTrace){

    });

    Timer(const Duration(seconds: 3),
        () => Get.toNamed(RouteName.LoginScreen)
    );
  }

}