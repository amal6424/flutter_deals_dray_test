import 'package:deals_dray_flutter_project/string_constants.dart';
import 'package:flutter/material.dart';


class VerifyButton extends StatelessWidget {
  double screenHeight;
  double screenWidth;
  dynamic _onTap;
  VerifyButton(
      {super.key, required this.screenHeight, required this.screenWidth, required dynamic onTap})
      : _onTap = onTap;

  void alertDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              alignment: Alignment.center,
              height: screenHeight * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "StringConstants.verifySuccessDialogText",
                    style: TextStyle(
                        color: Color(0xFFFF5840),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        height: screenHeight * 0.06,
        width: screenWidth * 0.4,
        decoration: const BoxDecoration(
            color: Color(0xFFFF5840),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Text(
          StringConstants.OTP_SUBMIT,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}