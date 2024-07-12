import 'package:deals_dray/scene/otp/otp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KycScreen extends StatefulWidget{
  var deviceId;
  KycScreen({super.key, required this.deviceId});

  @override
  State<KycScreen> createState() {
    return _KycScreenState(deviceId);
  }
}
class _KycScreenState extends State<KycScreen>{
  final textController = TextEditingController();
  var deviceId = "";
  _KycScreenState(this.deviceId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_left),
      ),
      body: Center(
        child: Column(
          children: [
            phoneAndMail(),
            const Text("Glad to see you!",style: TextStyle(color: Colors.black,fontSize: 35),),
            const Text("Please provide your phone number"),

            textField(),
            sendCode(context),
          ],
        ),
      ),
    );
  }
  @override
  void dispose(){
    textController.dispose();
    super.dispose();
  }
  Widget textField(){
    return Flexible(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400, minWidth: 300),
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextField(controller: textController,decoration: InputDecoration(hintText: "Phone"),keyboardType: TextInputType.phone,),
        ),
      ),
    );
  }
  Widget sendCode(BuildContext context){
    return Flexible(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600, minWidth: 300),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextButton(onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_)=>OTpView(mobileNumber: "${textController.text}",deviceId: deviceId,))
            );
          }, child: const Text("Send Code", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
  Widget phoneAndMail(){
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 130),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(onPressed: (){},child: const Text("Phone", style: TextStyle(color: Colors.white),),),
              ),
              Container(
                child: TextButton(onPressed: (){},child: const Text("Mail", style: TextStyle(color: Colors.black),),),
              )
            ],
          ),
        )
      ),
    );
  }
}
