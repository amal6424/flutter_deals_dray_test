import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatformHelper{
  static const platformDeviceId = MethodChannel("com.amal.deals_dray_flutter_project/deviceId");
  static SharedPreferencesAsync preferences = SharedPreferencesAsync();
  static Future<String> getDeviceId() async{
    String deviceId = "";
    try{
      final result = await platformDeviceId.invokeMethod<String>("getDeviceId");
      deviceId = "$result";
    }on PlatformException catch(e){
      deviceId = "abfbfbfbbfbfbfbfbf";
    }
    return deviceId;
  }
}