import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:perfect_photo_frame/admin/app_routes.dart';
import 'package:perfect_photo_frame/admin/login_screen.dart';
import 'package:perfect_photo_frame/Screens/authScreens/mobile_login_screen.dart';
import 'package:perfect_photo_frame/Screens/authScreens/otp_verification_screen.dart';
import 'package:perfect_photo_frame/Screens/authScreens/welcome_screen.dart';
import 'package:perfect_photo_frame/Screens/homepage/home_screen.dart';
import 'package:perfect_photo_frame/Screens/profile/profile_screen.dart';
import 'package:perfect_photo_frame/admin/dashboard_screen.dart';
import 'package:perfect_photo_frame/admin/quote_screen.dart';
import 'package:perfect_photo_frame/admin/signup_screen.dart';
import 'package:perfect_photo_frame/utils/permission.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize();
  bool isaccess = await CheckPermission
                                .requestStoragePermission();
                log("this is $isaccess");
                //  await Firebase.initializeApp();
                            
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    //  requestPermissionsOnStartup();
  }

  

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Perfect Photo Frame',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/welcome',
          getPages: [
            GetPage(name: '/welcome', page: () => const WelcomeScreen()),
            GetPage(name: '/mobilelogin', page: () => const MobileLoginScreen()),
            GetPage(name: '/otpverification', page: () => const OTPVerificationScreen()),
            GetPage(name: '/home', page: () => const HomeScreen()),
            GetPage(name: '/profile', page: () => const ProfileScreen()),
             GetPage(name: '/signup', page: () => const SignUpScreen()),
            GetPage(name: '/login', page: () => const LoginScreen()),
             GetPage(name: '/admindashboard', page: () =>  AdminDashboard()),
            //  GetPage(name: '/quote', page: () => const QuoteScreen()),
        //       GetPage(name: AppRoutes.dashboard, page: () => DashboardScreen()),
        // GetPage(name: AppRoutes.catMgmt, page: () => CatMgmtScreen()),
        // GetPage(name: AppRoutes.subCatMgmt, page: () => SubCatMgmtScreen()),
        // GetPage(name: AppRoutes.usersMgmt, page: () => UsersMgmtScreen()),
        // GetPage(name: AppRoutes.wallpapers, page: () => WallpapersScreen()),
        GetPage(name: AppRoutes.quotesMgmt, page: () => QuoteScreen()),
        // GetPage(name: AppRoutes.colorMgmt, page: () => ColorMgmtScreen()),
        // GetPage(name: AppRoutes.planMgmt, page: () => PlanMgmtScreen()),
        // GetPage(name: AppRoutes.styleMgmt, page: () => StyleMgmtScreen()),
        // GetPage(name: AppRoutes.frameMgmt, page: () => FrameMgmtScreen()),
        // GetPage(name: AppRoutes.subscriptions, page: () => SubscriptionsScreen()),
        // GetPage(name: AppRoutes.history, page: () => HistoryScreen()),

          ],
        );
      },
    );
  }
}
