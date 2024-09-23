import 'dart:convert';
import 'dart:io';
import 'package:getx_with_mvc/data/app_exceptions.dart';
import 'package:getx_with_mvc/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;


class NetworkApiServices extends BaseApiServices {

  @override
  Future<dynamic> getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          // If date is passed in form
          body: data

      ).timeout(const Duration(seconds: 10));
          // If data is in raw form
      //  body: jsonEncode(data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    print(responseJson);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {

    print('Response Status Code: ${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException((response.body.toString()));

      default:
        throw FetchDataException(
            'Error occured while communicating with server' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
