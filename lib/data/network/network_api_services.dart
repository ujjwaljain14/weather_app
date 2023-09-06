import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/app_exceptions.dart';
import 'package:weather_app/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getApi(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }on NoSuchMethodError{
      throw InvalidLocation('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidLocation(response.statusCode.toString());
      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }


}