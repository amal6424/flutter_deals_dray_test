import 'package:flutter/material.dart';


class OtpVerificationScreen extends StatefulWidget{
  OtpVerificationScreen({super.key});
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}
class _OtpVerificationScreenState extends State<OtpVerificationScreen>{
  String mobileNumber = "";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_left),
      ),
      body: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Text("OTP Verification", style: TextStyle(color: Colors.black,fontSize: 30),),
            Text("We have sent a unique OTP number to your mobile number $mobileNumber")
          ],
        ),
      )
    );
  }
}