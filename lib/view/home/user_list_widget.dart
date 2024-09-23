import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_with_mvc/view_models/controllers/home_view_controller.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({super.key});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {

  final homeViewController = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: homeViewController.userList.value.data!.length,
        itemBuilder: (context , index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(homeViewController.userList.value.data![index].avatar.toString()),
              ),
              title: Text(homeViewController.userList.value.data![index].firstName.toString()+' '+homeViewController.userList.value.data![index].lastName.toString()),
              subtitle: Text(homeViewController.userList.value.data![index].email.toString()),
            ),
          );
        });
  }
}
