import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/nav_utils.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      // var token = await SPUtill.getValue(SPUtill.keyAuthToken);
      var token;
      if (kDebugMode) {
        /// development purpose only
        print("Bearer token: $token");
      }
      if (token != null){
        if (!mounted) return;
        // NavUtil.replaceScreen(context, const BottomNavBar());
      } else {
        if (!mounted) return;
        NavUtil.replaceScreen(context, const OnbardingScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/home_page/app_splash_logo.png',
          height: 191.h,
          width: 136.w,
        ),
      ),
    );
  }
}
