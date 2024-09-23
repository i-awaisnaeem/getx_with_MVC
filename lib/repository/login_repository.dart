
import '../data/network/NetworkApiServices.dart';
import '../resources/app_urls/app_urls.dart';

class LoginRepository {

  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.postApiResponse( AppUrls.loginEndPoint,data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}