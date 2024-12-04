import 'dart:developer';

import 'package:admin_app/admin/app_routes.dart';
import 'package:admin_app/admin/category_screen.dart';
import 'package:admin_app/admin/color_mgmt.dart';
import 'package:admin_app/admin/dashboard_details.dart';
import 'package:admin_app/admin/dashboard_screen.dart';
import 'package:admin_app/admin/frame_mgmt.dart';
import 'package:admin_app/admin/history.dart';
import 'package:admin_app/admin/login_screen.dart';
import 'package:admin_app/admin/plan_mgmt.dart';
import 'package:admin_app/admin/quote_screen.dart';
import 'package:admin_app/admin/signup_screen.dart';
import 'package:admin_app/admin/style_mgmt.dart';
import 'package:admin_app/admin/sub_category_scree.dart';
import 'package:admin_app/admin/subscriptions.dart';
import 'package:admin_app/admin/user_management.dart';
import 'package:admin_app/admin/wallppaper.dart';
import 'package:admin_app/admin/welcome_screen.dart';
import 'package:admin_app/utils/permission.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
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
            // GetPage(name: '/mobilelogin', page: () => const MobileLoginScreen()),
            // GetPage(name: '/otpverification', page: () => const OTPVerificationScreen()),
            // GetPage(name: '/home', page: () => const HomeScreen()),
            // GetPage(name: '/profile', page: () => const ProfileScreen()),
             GetPage(name: '/signup', page: () => const SignUpScreen()),
            GetPage(name: '/login', page: () => const LoginScreen()),
             GetPage(name: '/admindashboard', page: () =>  AdminDashboard()),
            //  GetPage(name: '/quote', page: () => const QuoteScreen()),
        //       GetPage(name: AppRoutes.dashboard, page: () => DashboardScreen()),
        // GetPage(name: AppRoutes.catMgmt, page: () => CatMgmtScreen()),
        // GetPage(name: AppRoutes.subCatMgmt, page: () => SubCatMgmtScreen()),
        // GetPage(name: AppRoutes.usersMgmt, page: () => UsersMgmtScreen()),
        // GetPage(name: AppRoutes.wallpapers, page: () => WallpapersScreen()),

        GetPage(name: AppRoutes.catMgmt, page: () => const CategoryListScreen()),
        GetPage(name: AppRoutes.dashboard, page: () => const DashboardDetailsScreen()),
        GetPage(name: AppRoutes.catMgmt, page: () => const CategoryListScreen()),
        GetPage(name: AppRoutes.subCatMgmt, page: () => const SubCategoryScreen()),
        GetPage(name: AppRoutes.usersMgmt, page: () => const UserManagementScreen()),
        GetPage(name: AppRoutes.wallpapers, page: () => const WallpaperScreen()),
         GetPage(name: AppRoutes.quotesMgmt, page: () => QuoteScreen()),
        GetPage(name: AppRoutes.colorMgmt, page: () => ColorManagementScreen()),
        GetPage(name: AppRoutes.planMgmt, page: () => PlanManagementScreen()),
        GetPage(name: AppRoutes.styleMgmt, page: () => StyleScreen()),
        GetPage(name: AppRoutes.frameMgmt, page: () => FrameManagementScreen()),
        GetPage(name: AppRoutes.subscriptions, page: () => SubscriptionsScreen()),
        GetPage(name: AppRoutes.history, page: () => HistoryScreen()),

          ],
        );
      },
    );
  }
}
