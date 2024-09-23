
import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/routes/routes_name.dart';
import 'package:getx_with_mvc/view/home/home_screen.dart';
import 'package:getx_with_mvc/view/login_screen.dart';
import 'package:getx_with_mvc/view/signup_screen.dart';
import 'package:getx_with_mvc/view/splash_screen.dart';

class AppRoutes{

  static appRoutes () => [

    GetPage(
        name: RouteName.SplashScreen,
        page: () => const SplashScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)
    ),

    GetPage(
        name: RouteName.HomeScreen,
        page: () => const HomeScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)
    ),

    GetPage(
        name: RouteName.LoginScreen,
        page: ()=> const LoginScreen() ,
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)
    ),

    GetPage(
        name: RouteName.SignupScreen,
        page:()=> const SignupScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 250)
    )

  ];

}