import 'package:deals_dray/scene/HomeScreen.dart';
import 'package:flutter/material.dart';

class KycFinalScreen extends StatelessWidget{

  KycFinalScreen({super.key});
  Widget build(BuildContext context){
    double screenWidth =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: floatingActionButton(context),
      body: Center(
        child: Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth - screenWidth/4),
            child: Container(
              width: screenWidth-screenWidth/4,
              child: inputOptions(context),
            ),
          ),
        ),
      ),
      );
  }
  AppBar appBar(){
    return AppBar(
    leading: Icon(Icons.arrow_left),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_)=>HomeScreen()
            )
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red
        ),
        child: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget inputOptions(BuildContext context) {
    return Column(
      children: [
        Text("Let's Begin",style: TextStyle(color: Colors.black, fontSize: 35),),
        Container(
          margin: EdgeInsets.only(bottom: 10,top: 5),
          child: Text("Please enter your credentials to proceed"),
        ),
        TextField(decoration: InputDecoration(hintText: "Your Email"),),
        TextField(decoration: InputDecoration(hintText: "Create Password"),obscureText: true,),
        TextField(decoration: InputDecoration(hintText: "Refferal code (Optional)"),),
      ],
    );
  }
}