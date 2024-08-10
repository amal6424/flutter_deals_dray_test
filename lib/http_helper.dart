import 'package:http/http.dart' as http;

import 'api_const.dart';


class HttpHelper{
  static Future<http.Response> getPostFuture(Uri uri,Object body){
    return http.post(
        uri,
      body: body
    );
  }
  static Future<http.Response> getGetFuture(Uri uri){
    return http.get(
      uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
  }
  static Future<http.Response> sendOtp(String mobileNumber, String deviceId){
    Uri uri = Uri(scheme: "http", host: ApiConst.urlApiMain, path: ApiConst.urlPathOtp);
    return http.post(
        uri,
        body: <String, String>{
          "mobileNumber":mobileNumber,
          "deviceId":deviceId
        }
    );
  }
  static Future<http.Response> verifyOtp(String otp,String deviceId, String userId){
    Uri uri = Uri(scheme: "http", host: ApiConst.urlApiMain, path: ApiConst.urlPathOtpVerify);
    return http.post(
        uri,
        body: <String, String>{
          "otp":otp,
          "deviceId":deviceId,
          "userId":userId
        }
    );
  }
}