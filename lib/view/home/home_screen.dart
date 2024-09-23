import 'package:flutter/material.dart';
import 'package:getx_with_mvc/data/response/status.dart';
import 'package:getx_with_mvc/resources/components/round_button.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/resources/routes/routes_name.dart';
import 'package:getx_with_mvc/view/home/user_list_widget.dart';
import 'package:getx_with_mvc/view_models/controllers/home_view_controller.dart';
import 'package:getx_with_mvc/view_models/controllers/user_preference_view_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserPreferenceViewController userPreferenceViewController = UserPreferenceViewController();

  final homeViewController = Get.put(HomeViewController());


  @override
  void initState() {
    // TODO: implement initState
    homeViewController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home Screen'),
      actions: [
        IconButton(
            onPressed: (){
                userPreferenceViewController.removeUser().then((value){
                  Get.toNamed(RouteName.LoginScreen);
                });
            },
            icon: const Icon(Icons.logout))
      ],),
      body: Obx((){
        switch (homeViewController.RxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator(),);
          case Status.ERROR:
            return const Text('Something went wrong');
          case Status.COMPLETED:
            return const UserListWidget();
        }
      }),
    );
  }

}
