
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/models/UserModel.dart';
import 'package:getx_with_mvc/repository/login_repository.dart';
import 'package:getx_with_mvc/utils/utlls.dart';
import 'package:getx_with_mvc/view_models/controllers/user_preference_view_controller.dart';

import '../../resources/routes/routes_name.dart';

class LoginViewController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  final _api  = LoginRepository();

  UserPreferenceViewController userPreferenceViewController = UserPreferenceViewController();

  void loginApi(){
    loading.value = true;
      Map<String,dynamic > data = {
        'email' : emailController.value.text,
        'password' : passwordController.value.text
      };

      _api.loginApi(data).then((value){

        loading.value =false;
        userPreferenceViewController.saveUser(UserModel.fromJson(value));

        Get.delete<LoginViewController>(); // To free up memory space

        Get.toNamed(RouteName.HomeScreen);
        Utils.snackBar('Login', 'Login Successfully');

      }).onError((error, stackTrace){

        print(error.toString());
        Utils.snackBar('Error', error.toString());
        loading.value = false;

      });
  }
}