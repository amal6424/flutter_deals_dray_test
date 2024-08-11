import 'dart:core';

import 'package:deals_dray_flutter_project/http_helper.dart';
import 'package:deals_dray_flutter_project/screens/home/home_fetcher.dart';
import 'package:deals_dray_flutter_project/screens/home/home_screen.dart';
import 'package:deals_dray_flutter_project/string_constants.dart';
import 'package:flutter/material.dart';
import '../register/register_final_screen.dart';
import 'otp_input.dart';
import 'verify_button.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

class OTpView extends StatefulWidget {
  final String _mobileNumber;
  final String _deviceId;
  final String _userId;
  const OTpView({super.key, required String mobileNumber,required String deviceId,required String userId}) :_mobileNumber = mobileNumber, _deviceId = deviceId, _userId = userId ;
  @override
  State<OTpView> createState() => _OTpViewState(mobileNumber: _mobileNumber, deviceId: _deviceId, userId: _userId);
}
class _OTpViewState extends State<OTpView> {
  final TextEditingController _otpDigit =TextEditingController();
  final String _mobileNumber;
  final String _deviceId;
  final String _userId;
  double _screenHeight = 0;
  double _screenWidth = 0;

  _OTpViewState({ required String mobileNumber, required String deviceId,required String userId}):_mobileNumber = mobileNumber, _deviceId = deviceId, _userId = userId ;
  @override
  void initState() {
    initialize();
    super.initState();
  }
  void initialize() {

  }
  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: otpBodySection(context),
    );
  }
  SingleChildScrollView otpBodySection(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpPageHeader(),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              //imageSection(),
              const Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: _screenHeight * 0.03,
              ),
              otpInputSectionText(),
              SizedBox(
                height: _screenHeight * 0.04,
              ),
              OTPInput(controller: _otpDigit),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              didntReceivedCodeSection(),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              VerifyButton(screenHeight: _screenHeight, screenWidth: _screenWidth,
              onTap: (){
                HttpHelper.verifyOtp(_otpDigit.text, _deviceId, _userId).then(
                    (response){
                      if(response.statusCode != 200){
                        return;
                      }
                      dynamic body = jsonDecode(response.body);
                      int statusCode = body['status'];
                      if(statusCode != 1){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(body['data']['message']))
                        );
                        return;
                      }
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) =>
                                  const RegisterFinalScreen()
                          )
                      );
                    }
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
  Widget otpPageHeader() {
    return const Text(
      StringConstants.OTP_VERIFICATION,
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
  Widget didntReceivedCodeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          StringConstants.OTP_NOT_RECEIVED,
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
        TextButton(
          onPressed: (){},
          child: const Text(StringConstants.OTP_RESEND,
              style: TextStyle(color: Color(0xFFFF5840), fontSize: 20))
          ,
        ),
      ],
    );
  }
  // Widget imageSection() {
  //   return Image.asset(
  //     AssetConstants.appImage,
  //     height: 200,
  //     width: 200,
  //     fit: BoxFit.fill,
  //   );
  // }
  Widget otpInputSectionText() {
    return Text(
      StringConstants.OTP_SENT +
          widget._mobileNumber.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.grey, fontSize: 20),
    );
  }
}