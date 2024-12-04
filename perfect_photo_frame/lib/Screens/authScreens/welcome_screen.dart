import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfect_photo_frame/utils/assets.dart';
import 'package:perfect_photo_frame/utils/image_assets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override 
  void initState() {
    super.initState();
   requestPermissionsOnStartup();
  }

  Future<void> requestPermissionsOnStartup() async {
    // Requesting storage permission
    PermissionStatus status = await Permission.storage.status;
    
    if (!status.isGranted) {
      status = await Permission.storage.request();
      
      if (status.isGranted) {
        print("Storage permission granted.");
        // Continue with app initialization
      } else {
        print("Storage permission denied.");
        // Show a dialog or message explaining the importance of the permission
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
               width: 100.w,
               height: 65.h,
              decoration: const BoxDecoration(
              
                color:  Color.fromARGB(255, 78, 212, 212), // Teal background
              
              ),
              child: const Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: ClipOval(
                    child:  CooeeImageAsset(image: CooeeAsset.appLogo ,
                    height: 200,
                    width: 200,)
                    
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Text section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: 'Get ', // Default color for this part
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: 'Daily Quotes ', // "Daily Quotes" in red
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'everyday with your\n',
                        ),
                        TextSpan(
                          text: 'Photo ', // "Photo" in red
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'and ',
                        ),
                        TextSpan(
                          text: 'Name', // "Name" in red
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
,
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in with account',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Get Started button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      ElevatedButton(
                      
                        onPressed: () {
                          // Navigate to the next screen or perform action
                           Get.toNamed('/mobilelogin'); //Get.offAllNamed('/signup');

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 16, 174, 174), 
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios
                              ,color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 10.px,),
                
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [

                  //     ElevatedButton(
                      
                  //       onPressed: () {
                  //         // Navigate to the next screen or perform action
                  //          Get.toNamed('/login'); //Get.offAllNamed('/signup');

                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Color.fromARGB(255, 16, 174, 174), 
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 24, vertical: 12),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(24),
                  //         ),
                  //       ),
                  //       child: const Row(
                  //         children: [
                  //           Text(
                  //             'Get Started as admin',
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white
                  //             ),
                  //           ),
                  //           Icon(
                  //             Icons.arrow_forward_ios
                  //             ,color: Colors.white,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                      
                  //   ],
                  // ),
               
               ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}