import 'package:country_code_picker/country_code_picker.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';

class LanguageSettingItem extends StatelessWidget {
  FlagsCode countryCode;
  bool? isSelected = false;
  Function()? onTap;

  LanguageSettingItem(
      {Key? key, required this.countryCode, this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: AppColors.white,
      title: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            child: Flag.fromCode(countryCode),
          ),
          SpaceUtils.hSpace10(),
          Text(CountryCode.fromCountryCode(countryCode.name).name ?? '',
              style: GoogleFonts.lato(fontSize: 18, color: AppColors.title)),
        ],
      ),
      trailing: isSelected == true
          ? Icon(
              Icons.check_circle,
              color: AppColors.success,
            )
          : null,
      onTap: onTap,
    );
  }
}
