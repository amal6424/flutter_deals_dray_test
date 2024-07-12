import 'package:flutter/material.dart';
import 'otp_input.dart';
import 'verify_button.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';

class OTpView extends StatefulWidget {
  final String? mobileNumber;
  final String? deviceId;
  const OTpView({Key? key, required this.mobileNumber, required this.deviceId}) : super(key: key);
  @override
  State<OTpView> createState() => _OTpViewState(mobileNumber: mobileNumber, deviceId: deviceId);
}
class _OTpViewState extends State<OTpView> {
  TextEditingController? otpDigit;
  final String? mobileNumber;
  final String? deviceId;
  double screenHeight = 0;
  double screenWidth = 0;

  _OTpViewState({ required this.mobileNumber, required this.deviceId});

  Future<http.Response> getFuture(){
    Uri uri = Uri(scheme: "http", host: "devapiv4.dealsdray.com",path: "/api/v2/user/otp");
    return http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobileNumber":"$mobileNumber",
        "deviceId":"$deviceId"
      }),
    );
  }
  @override
  void initState() {
    initialize();
    super.initState();
  }
  void initialize() {
    otpDigit = TextEditingController();
    getFuture().then((response){

    });
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: otpBodySection(context),
      ),
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
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpPageHeader(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              //imageSection(),
              const Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              otpInputSectionText(),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              OTPInput(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              didntReceivedCodeSection(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              VerifyButton(screenHeight: screenHeight, screenWidth: screenWidth)
            ],
          ),
        ),
      ),
    );
  }
  Widget otpPageHeader() {
    return const Text(
      "OTP Verification",
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
  Widget didntReceivedCodeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "didnt receive otp ",
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
        TextButton(
          onPressed: (){},
          child: Text("resend otp",
              style: const TextStyle(color: Color(0xFFFF5840), fontSize: 20))
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
      "We have sent a unique OTP number to your mobile " +
          widget.mobileNumber.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.grey, fontSize: 20),
    );
  }
}