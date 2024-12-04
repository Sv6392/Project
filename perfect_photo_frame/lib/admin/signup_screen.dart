import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfect_photo_frame/utils/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.teal,
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Register Now!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        
            SizedBox(height: 4.5.h),
            // Email ID TextField
            
              
            Container(
              height: 78.h,
              decoration: BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
              
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                          hintText: 'Your Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
              
                       SizedBox(height: 16),
              // Password TextField
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                  hintText: 'Your Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Confirm Password TextField
              TextField(
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                  hintText: 'Confirm Your Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Terms and Privacy Policy Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'By signing up you agree to   Terms of service\nPrivacy policy',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              
                           
                    ],
                  ),
              
                  Column(
                    children: [
              
              
                       CooeeCustomElevatedButton(onPressed: () { 
                             ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Work in Progress',
                                  style: TextStyle(fontSize: 16),
                                ),
                                backgroundColor: Colors.orange,
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                           }, backgroundColor: Colors.teal, text: 'Sign Up', textColor: Colors.white, height: 15.w,width: 90.w,
                            
                          ),
                          SizedBox(height: 10),
                       CooeeCustomElevatedButton(onPressed: () {   Get.offAllNamed('/login');}, backgroundColor: Colors.white, text: 'Sign In', textColor: Colors.green, height: 15.w,width: 90.w,),
                      
                       
                      
              
                    ],
                  )
                ],
              ),
            ),
            // Sign Up Button
            
          ],
        ),
      ),
    );
  }
}
