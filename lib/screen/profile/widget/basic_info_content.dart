import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_flutter/data/model/user/StudyLevel.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/auth/widgets/combobox_form_field.dart';
import 'package:lettutor_flutter/screen/auth/widgets/country_picker_form_field.dart';
import 'package:lettutor_flutter/screen/auth/widgets/text_form_field.dart';
import 'package:lettutor_flutter/widgets/elevated_button_widget.dart';

class BasicInfoContent extends StatefulWidget {
  const BasicInfoContent({
    Key? key,
  }) : super(key: key);

  @override
  State<BasicInfoContent> createState() => _BasicInfoContentState();
}

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];

class _BasicInfoContentState extends State<BasicInfoContent> {
  final AuthProvider _authProvider = getIt.get<AuthProvider>();
  User? _user;
  DateTime? selectedDob;
  String? selectedCountry;
  CountryCode? selectedcCountryCode;
  var _selectedOption = 'Item1';

  @override
  void initState() {
    super.initState();
    _user = _authProvider.getUserData();
    selectedDob = _user?.birthday != null
        ? DateTime.parse(_user!.birthday!)
        : DateTime.now();
    try {
      selectedcCountryCode = _user?.country != null
          ? CountryCode.fromCountryCode(_user!.country!)
          : null;
    } catch (err) {
      selectedcCountryCode = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 24.h,
          ),
          FormTextField(
            title: "Full Name",
            mandatory: true,
            hintText: "Write your full name",
            initialValue: _user?.name,
          ),
          SizedBox(
            height: 24.h,
          ),
          CountryPickerFormField(
            title: "Country",
            hintText: "Select your country",
            mandatory: true,
            initialCountryCode: _user?.country,
            onSelect: (CountryCode? selectedValue) {},
          ),
          ComboboxFormField<StudyLevel>(
              title: "My level",
              mandatory: true,
              hintText: "Select your level",
              items: StudyLevel.values,
              onSelect: (selectedValue) {},
              stringConverter: (item) =>
                  TranslateUtils.of(context)!.translateEnum<StudyLevel>(item)),
          FormTextField(
            title: "Phone Number",
            hintText: "+84 | 023-6894-523",
            enabled: false,
            initialValue: _user?.phone,
          ),
          SizedBox(
            height: 24.h,
          ),
          GestureDetector(
            child: FormTextField(
              title: "Date of Birth",
              mandatory: true,
              hintText: "23-06-1995",
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today_outlined)),
              enabled: false,
              initialValue: DateFormat('yyyy-MM-dd').format(selectedDob!),
            ),
            onTap: () => _selectDob(context),
          ),
          SizedBox(
            height: 24.h,
          ),
          FormTextField(
            title: "Study shedule",
            hintText: "Note the time of week you want to study on LetTutor",
          ),
          SizedBox(
            height: 24.h,
          ),
          ElevatedButtonWidget(
            text: "Update",
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Text _buildLabel(String s) {
    return Text(
      s,
      style: TextStyle(
          letterSpacing: 1,
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700),
    );
  }

  Future<void> _selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDob!,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2999, 12),
        helpText: 'Select a date',
        // optional
        cancelText: 'Cancel',
        // optional
        confirmText: 'Ok' // optional
        );
    if (picked != null && picked != selectedDob) {
      setState(() {
        selectedDob = picked;
      });
    }
  }
}
