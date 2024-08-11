import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPInput extends StatefulWidget {
  final TextEditingController _controller;
  const OTPInput({Key? key, required TextEditingController controller}) :_controller = controller, super(key: key);
  @override
  State<OTPInput> createState() => _OTPInputState(controller: _controller);
}
class _OTPInputState extends State<OTPInput> {
  final TextEditingController _controller;
  _OTPInputState({required TextEditingController controller}) :_controller = controller;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFF5840)),
        borderRadius: BorderRadius.circular(15),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith();
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color(0xFFFF5840),
      ),
    );
    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: submittedPinTheme,
      validator: (s) {
        return "";
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      pinAnimationType: PinAnimationType.rotation,
      showCursor: true,
      onCompleted: (pin) => print(pin),
      controller: _controller,
    );
  }
}