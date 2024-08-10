import 'dart:convert';

import 'package:deals_dray_flutter_project/api_const.dart';
import 'package:deals_dray_flutter_project/http_helper.dart';
import 'package:deals_dray_flutter_project/screens/otp/otp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../string_constants.dart';

class RegisterStartScreen extends StatefulWidget{
  final String _deviceId;
  const RegisterStartScreen({super.key, required String deviceId }):_deviceId = deviceId;

  @override
  State<StatefulWidget> createState() =>RegisterStartScreenState(_deviceId);
}
class RegisterStartScreenState extends State<RegisterStartScreen>{
  final String _deviceId;
  final TextEditingController _controller = TextEditingController();

  RegisterStartScreenState(String deviceId):_deviceId = deviceId;

  void sendCodePressed(){
    String text = _controller.text;
    if(text.length<10||text.length>10){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(StringConstants.INVALID_NUMBER)));
      return;
    }
    HttpHelper.sendOtp(text, _deviceId).then(
        (response){
          String userId = jsonDecode(response.body)['data']['userId'];
          if(response.statusCode == 200){
            Navigator.push(context, MaterialPageRoute(
                builder: (buildContext)=>OTpView(
                  mobileNumber: text,
                  deviceId: _deviceId,
                  userId: userId
                )
            ));

          }else{
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(StringConstants.CANNOT_SEND_OTP),
                )
            );
          }
        }
    );

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width*0.75;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 201, 201, 201),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: const Text(StringConstants.PHONE, style: TextStyle(color: Colors.white),),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: const Text(StringConstants.EMAIL, style: TextStyle(color: Colors.black),),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                  width: 1,
                ),
                const Text(StringConstants.GLAD_TO_SEE, style: TextStyle(fontSize: 30, color: Colors.black,),),
                const Text(StringConstants.PROVIDE_PHONE_NUMBER, style: TextStyle( color: Colors.black),),
                Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: StringConstants.PHONE),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Container(
                  width: width,
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: sendCodePressed,
                    child: const Text(StringConstants.SEND_CODE, style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}