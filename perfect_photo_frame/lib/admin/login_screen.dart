import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfect_photo_frame/utils/custom_button.dart';
import 'package:perfect_photo_frame/utils/text_form_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 14.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Perfect Photo \nFrame',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                    
              SizedBox(height: 4.5.h),
              Container(
                padding: EdgeInsets.all(16),
                height: 70.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Column(
                  
                  children: [
          
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email *',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
          
                   
                     SizedBox(height: 10),
                    EnsoTextFormField(fontSize: 16,
                    controller: _usernameController,
                    hint: "Enter Email",
                    keyboardType: TextInputType.text,
                     prefixIcon: Icon(Icons.email_outlined),
                      isBorder: true,
                      isDecoration: true,
                      
                      // autoFocus: true,
                      borderRadius: 12,
                      
                      
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Password *',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                      SizedBox(height: 10),
                   
                    EnsoTextFormField(
                      hint: "Enter Password",
                      isBorder: true,
                      borderRadius: 12,
                       prefixIcon: Icon(Icons.lock_outlined),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController ,
                      fontSize: 16.px,
                      hidden: !_isPasswordVisible,
                      suffixIcon: InkWell(
                        onTap: 
                          _togglePasswordVisibility
                          // loginController.showPassword =
                          //     !loginController.showPassword;
                          // loginController.update();
                        ,
                        child: Icon(
                          color: Colors.black45,
                          
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password
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
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CooeeCustomElevatedButton(onPressed: () { 
                          // if(_usernameController.text =="test@gmail.com" && _passwordController.text=="Test123"){
                           Get.offAllNamed('/admindashboard');
                          // }
                          // else
                          {
                           ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Incorrect details',
                                style: TextStyle(fontSize: 16),
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          }
                         }, backgroundColor:  Colors.teal, text: 'Sign In', textColor: Colors.white, height: 15.w,width: 90.w,
                          
                        ),
                        SizedBox(height: 10),
                     CooeeCustomElevatedButton(onPressed: () {   Get.offAllNamed('/signup');}, backgroundColor: Colors.white, text: 'Sign Up', textColor: Colors.green, height: 15.w,width: 90.w,),
                    
                      ],
                    ),
          
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
