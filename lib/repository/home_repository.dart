
import 'package:getx_with_mvc/models/UserListModel.dart';

import '../data/network/NetworkApiServices.dart';
import '../resources/app_urls/app_urls.dart';

class HomeRepository {

  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    try {
      dynamic response =
      await _apiServices.getApiResponse( AppUrls.userListApi);
      return UserListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}