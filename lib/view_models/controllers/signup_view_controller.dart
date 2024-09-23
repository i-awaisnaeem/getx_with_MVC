import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/repository/signup_repository.dart';  // Assuming you have a signup repository
import 'package:getx_with_mvc/resources/routes/routes_name.dart';
import 'package:getx_with_mvc/utils/utlls.dart';

class SignupViewController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  final _api = SignupRepository(); // Assuming you have a signup repository

  void signupApi(dynamic data, BuildContext context) async{

    loading.value = true;

    _api.signupApi(data).then((value){
      loading.value = false;
      Utils.snackBar('Signup', 'Signup Successfully');
      
      Get.toNamed(RouteName.LoginScreen);
    }).onError((error, stackTrace){
      print(error.toString());
      Utils.snackBar('Error', error.toString());
      loading.value = false;
    });
  }
}
