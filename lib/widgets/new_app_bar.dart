import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewAppBar extends StatelessWidget {
  final String? appBarName;
  final Function()? onTap;
  final Function()? onPressed;

  const NewAppBar({Key? key, this.appBarName, this.onTap, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
          child: Image.asset(
            'assets/home_page/app_splash_logo.png',
            height: 80,
          ),
        ),
        leadingWidth: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '$appBarName',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: onTap,
              child: Image.asset(
                'assets/chat/chat_icon.gif',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
