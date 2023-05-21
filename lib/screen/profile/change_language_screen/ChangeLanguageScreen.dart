import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/main.dart';
import 'package:lettutor_thaitran81/provider/app_provider.dart';
import 'package:lettutor_thaitran81/screen/profile/widget/LanguageSettingItem.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';
import 'package:lettutor_thaitran81/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  late AppProvider _appProvider;

  @override
  void didChangeDependencies() {
    _appProvider = Provider.of<AppProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: CustomAppBar(appBarName: 'Change language'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SpaceUtils.vSpace10(),
              ...languagesSupport.keys
                  .map((language) => Column(
                        children: [
                          LanguageSettingItem(
                            isSelected:
                                _appProvider.selectedLanguage == language,
                            countryCode: languagesSupport[language]!,
                            onTap: () {
                              LetTutorApp.of(context)?.setLocale(language);
                              _appProvider.changeLanguage(language);
                            },
                          ),
                          SpaceUtils.vSpace10()
                        ],
                      ))
                  .toList()
            ],
          ),
        ));
  }
}
