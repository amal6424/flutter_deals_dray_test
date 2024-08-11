
import 'dart:convert';

import 'package:deals_dray_flutter_project/platform_helper.dart';
import 'package:deals_dray_flutter_project/screens/home/home_screen.dart';
import 'package:deals_dray_flutter_project/string_constants.dart';
import 'package:flutter/material.dart';
import '../home/home_fetcher.dart';
import 'package:http/http.dart' as http;

class RegisterFinalScreen extends StatefulWidget{

  const RegisterFinalScreen({super.key});
  @override
  State<RegisterFinalScreen> createState()=>_RegisterFinalScreenState();
}
class _RegisterFinalScreenState extends State<RegisterFinalScreen>{
  @override
  Widget build(BuildContext context){
    double screenWidth =  MediaQuery.of(context).size.width;
    double exactWidth = screenWidth-screenWidth/4;
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(context),
      body: Center(
         child: Container(
           width: exactWidth,
           child: _inputOptions(context)
         ),
      ),
    );
  }
  AppBar _appBar(){
    return AppBar(
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed: () {
        Future<http.Response> future = fetchHome();
        future.then(
                (response){
              if(response.statusCode== 200){
                PlatformHelper.preferences.setBool("isRegistered", true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (_)=>HomeScreen(homeItems: jsonDecode(response.body))
                    )
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(StringConstants.REGISTER_CANNOT_FETCH_HOME),
                    )
                );
              }
            }
        );

      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red
        ),
        child: const Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _inputOptions(BuildContext context) {
    return Column(
      children: [
        const Text(StringConstants.REGISTER_LETS_BEGIN,style: TextStyle(color: Colors.black, fontSize: 35),),
        Container(
          margin: const EdgeInsets.only(bottom: 10,top: 5),
          child: const Text(StringConstants.REGISTER_CREDENTIALS),
        ),
        const TextField(decoration: InputDecoration(hintText: StringConstants.REGISTER_EMAIL),),
        const TextField(decoration: InputDecoration(hintText: StringConstants.REGISTER_CREATE_PASSWORD),obscureText: true,),
        const TextField(decoration: InputDecoration(hintText: StringConstants.REGISTER_REFFERAL_CODE),),
      ],
    );
  }
}