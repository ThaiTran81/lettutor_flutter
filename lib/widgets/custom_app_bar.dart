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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/app_bar_icon/back_vector.png',
                  ),
                ),
                Spacer(),
                Expanded(flex: 1, child: buildTailingWidgets())
              ],
            ),
          ),
        ),
        leadingWidth: appBarName?.isEmpty ?? true
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.2,
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: 0,
        centerTitle: true,
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
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      ...?trailingChildren?.map((e) => Flexible(child: e)).toList()
    ]);
  }
}
