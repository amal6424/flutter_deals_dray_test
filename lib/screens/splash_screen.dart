import 'package:deals_dray_flutter_project/http_helper.dart';
import 'package:deals_dray_flutter_project/platform_helper.dart';
import 'package:deals_dray_flutter_project/screens/home/home_screen.dart';
import 'package:deals_dray_flutter_project/screens/register/register_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../api_const.dart';
import 'home/home_fetcher.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {

  Future<http.Response> getFuture(String devId){
    Uri uri = Uri(scheme: "http", host: ApiConst.urlApiMain,path: ApiConst.urlPathDeviceAdd);
    return HttpHelper.getPostFuture(uri, jsonEncode(<String, dynamic>{
      "deviceType": "andriod",
      "deviceId": devId,
      "deviceName": "Samsung-MT200",
      "deviceOSVersion": "2.3.6",
      "deviceIPAddress": "11.433.445.66",
      "lat": 9.9312,
      "long": 76.2673,
      "buyer_gcmid": "",
      "buyer_pemid": "",
      "app": {
        "version": "1.20.5",
        "installTimeStamp": "2022-02-10T12:33:30.696Z",
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
      }
    }));

  }
  @override
  void initState(){
    super.initState();
    PlatformHelper.preferences.getBool("isRegistered").then(
        (value){
          if(value!=null && value){
            Future<http.Response> future = fetchHome();
            future.then(
                    (response){
                  if(response.statusCode== 200){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_)=>HomeScreen(homeItems: jsonDecode(response.body))
                        )
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Cannot fetch home items"),
                        )
                    );
                  }
                }
            );
          }
          else{
            PlatformHelper.getDeviceId().then(
                    (value){
                  Future<http.Response> future = getFuture(value);
                  future.then((response){
                    if(response.statusCode == 200){
                      Map<String, dynamic> map = jsonDecode(response.body) as Map<String, dynamic>;
                      String deviceId = map['data']['deviceId'];
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)=>RegisterStartScreen(deviceId: deviceId)
                      ));
                    }
                  });
                }
            );
          }
        }
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }
}