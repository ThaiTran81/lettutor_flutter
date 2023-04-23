import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_consts.dart';
import '../../onboarding/widgets/social_login_widget.dart';
import '../forget_password.dart';
import '../sign_up_screen/sign_up_screen.dart';
import '../widgets/elevated_button_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.h),
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Welcome back, Let’s sign in to continue',
                        style: TextStyle(
                            height: 1.7,
                            color: AppColors.body,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ////Email/phone from field////
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone or email',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.white,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primary, width: 1.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 16.w),
                                hintText: 'Phone or Email',
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.border),
                                ),
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.hintTextColor,
                                    fontWeight: FontWeight.w400),
                                border: const OutlineInputBorder()),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ////Password from field/////
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            controller: passController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primary, width: 1.0),
                                ),
                                filled: true,
                                fillColor: AppColors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 13.h, horizontal: 16.w),
                                hintText: 'Password',
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.border),
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey.withOpacity(.4),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.hintTextColor,
                                    fontWeight: FontWeight.w400),
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword(),
                                  ));
                            },
                            child: Text('Forgot Password?',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ElevatedbuttonWidget(
                        text: 'LOGIN',
                        onPressed: () {
                          provider.loginApi(context, nameController.text,
                              passController.text);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Or',
                            style: TextStyle(
                                height: 1.7,
                                color: AppColors.body,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SocialLoginWidget(
                        assetImage: "assets/onboarding/fb_vector.png",
                        text: "CONTINUE WITH FACEBOOK",
                        bgColour: AppColors.primaryBg,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SocialLoginWidget(
                        assetImage: "assets/onboarding/google_vector.png",
                        text: "CONTINUE WITH GOOGLE",
                        bgColour: Colors.white,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.body),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ));
                                },
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
