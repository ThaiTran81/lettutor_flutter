import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String? appBarName;
  final Function()? onTap;
  final bool? isBackButton;
  List<Widget>? trailingChildren;
  Color? backgroundColor;

  CustomAppBar(
      {Key? key,
      this.appBarName,
      this.onTap,
      this.isBackButton,
      this.trailingChildren,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AppBar(
        leading: Visibility(
          visible: isBackButton ?? true,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/app_bar_icon/back_vector.png',
                  ),
                ),
                buildTailingWidgets()
              ],
            ),
          ),
        ),
        leadingWidth: 65,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: 0,
        title: Text(
          '$appBarName',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Row buildTailingWidgets() {
    return Row(children: <Widget>[...?trailingChildren]);
  }
}
