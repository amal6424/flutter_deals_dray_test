

import 'package:deals_dray/scene/KycScreen.dart';
import 'package:deals_dray/scene/otp/otp_view.dart';
import 'package:deals_dray/scene/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SplashScreen extends StatefulWidget{
  SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  String deviceId = "";
  Future<http.Response> getFuture(){
    Uri uri = Uri(scheme: "http", host: "devapiv4.dealsdray.com",path: "/api/v2/user/device/add");
    return http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "deviceType": "andriod",
        "deviceId": "C6179909526098",
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
      }),
    );
  }
  @override
  void initState(){
    super.initState();
    Future<http.Response> future = getFuture();
    future.then((response){
      if(response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body) as Map<
            String,
            dynamic>;
        String deviceId = map['data']['deviceId'];
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_)=>KycScreen(deviceId: deviceId))
        );
      }

    // });
    // Future.delayed(const Duration(seconds: 5),(){
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (_)=> KycScreen(deviceId: this.deviceId,))
    //   );
     });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Splash Screen",
              style: TextStyle(color: Colors.black, fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}