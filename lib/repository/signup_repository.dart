import 'package:getx_with_mvc/resources/app_urls/app_urls.dart';

import '../data/network/NetworkApiServices.dart';

class SignupRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApiResponse(
          AppUrls.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

}