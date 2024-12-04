import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_photo_frame/utils/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  String otp = '';
  int _start = 30;
  bool _isButtonDisabled = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isButtonDisabled = true; // Enable the submit button after timer finishes
        });
        _timer?.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _submitOTP() {
    String enteredOTP = _otpControllers.map((controller) => controller.text).join();
    if (enteredOTP.length == 4 && enteredOTP == "1234") {
      print("OTP Submitted: $enteredOTP");
      Get.offAllNamed('/home');
    }
    else if (enteredOTP.length == 4 && enteredOTP != "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'OTP did not match.',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
       } 
    else {
      print("Please enter a 4-digit OTP.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid 4-digit OTP.',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

   void _resendOTP() {

setState(() {
          _start =30;
          _isButtonDisabled = false; 
        });
        _startTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'OTP sent Successfully',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
       } 
    

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Enter OTP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // OTP input boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: TextField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        // Move to the next field if available
                        if (index < 3) {
                          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                        } else {
                          _focusNodes[index].unfocus();
                        }
                      } else {
                        // Move to the previous field if cleared
                        if (index > 0) {
                          FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                        }
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            // Timer display
            Text(
              "Time left: $_start seconds",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            CooeeCustomElevatedButton(
              onPressed: _isButtonDisabled ? _resendOTP : (){} ,
              backgroundColor:  Colors.blue, text: 'Resend OTP', textColor: Colors.white, height: 15.w,width: 65.w,
             
            ),

            const SizedBox(height: 20),

            
            // Submit OTP button
            CooeeCustomElevatedButton(
              onPressed: _isButtonDisabled ? (){} : _submitOTP,
              backgroundColor:  Colors.teal, text: 'Submit OTP', textColor: Colors.white, height: 15.w,width: 65.w,
             
            ),
          ],
        ),
      ),
    );
  }
}
