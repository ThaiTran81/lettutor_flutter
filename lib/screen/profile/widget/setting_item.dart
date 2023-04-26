import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';

// ignore: must_be_immutable
class SettingItem extends StatelessWidget {
  final String label;

  final IconData icon;
  final double? margin;
  Function()? onTap;

  SettingItem(
      {Key? key,
      required this.label,
      required this.icon,
      this.margin,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  child: Icon(icon, color: AppColors.title, size: 24),
                  decoration: BoxDecoration(
                    color: AppColors.fillGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 1,
                    //     blurRadius: 20,
                    //     offset:
                    //         Offset(0, 3), // changes position of shadow
                    //   ),
                  ),
                ),
                SpaceUtils.hSpace10(),
                Text(label,
                    style:
                        GoogleFonts.lato(fontSize: 18, color: AppColors.title)),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}