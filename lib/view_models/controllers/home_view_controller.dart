import 'package:get/get.dart';
import 'package:getx_with_mvc/data/response/status.dart';
import 'package:getx_with_mvc/models/UserListModel.dart';
import 'package:getx_with_mvc/repository/home_repository.dart';

class HomeViewController extends GetxController{

  final _api = HomeRepository();

  final RxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;

  void setRxRequestStatus(Status _value) => RxRequestStatus.value = _value;
  void setUserList(UserListModel _value ) => userList.value = _value;

  void userListApi(){

    _api.userListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

    }).onError((error,stackTrace){
      setRxRequestStatus(Status.ERROR);
    });
  }

}