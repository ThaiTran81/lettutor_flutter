import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_flutter/data/model/user/User.dart';
import 'package:lettutor_flutter/di/components/service_locator.dart';
import 'package:lettutor_flutter/provider/auth_provider.dart';
import 'package:lettutor_flutter/screen/auth/widgets/text_form_field.dart';
import 'package:lettutor_flutter/widgets/elevated_button_widget.dart';

class BasicInfoContent extends StatefulWidget {
  const BasicInfoContent({
    Key? key,
  }) : super(key: key);

  @override
  State<BasicInfoContent> createState() => _BasicInfoContentState();
}

class _BasicInfoContentState extends State<BasicInfoContent> {
  final AuthProvider _authProvider = getIt.get<AuthProvider>();
  User? _user;
  DateTime? selectedDob;
  String? selectedCountry;
  CountryCode? selectedcCountryCode;

  @override
  void initState() {
    _user = _authProvider.getUserData();
    selectedDob = _user?.birthday != null
        ? DateTime.parse(_user!.birthday!)
        : DateTime.now();
    selectedcCountryCode = CountryCode.fromCountryCode(_user!.country!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          FromField(
            title: "Full Name *",
            hintText: "Write your full name",
            initialValue: _user?.name,
          ),
          SizedBox(
            height: 24.h,
          ),
          _buildLabel("Country *"),
          Row(
            children: [
              Flexible(
                child: CountryCodePicker(
                  initialSelection: _user?.country?.toUpperCase() ?? '',
                  showDropDownButton: true,
                  // alignLeft: true,
                  onChanged: (value) {
                    setState(() {
                      selectedcCountryCode = value;
                    });
                  },
                ),
              ),
              Text(
                selectedcCountryCode?.name ?? '',
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          _buildLabel("My level"),
          FromField(
            title: "Phone Number",
            hintText: "+84 | 023-6894-523",
            enabled: false,
            initialValue: _user?.phone,
          ),
          SizedBox(
            height: 24.h,
          ),
          GestureDetector(
            child: FromField(
              title: "Date of Birth",
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
          FromField(
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
