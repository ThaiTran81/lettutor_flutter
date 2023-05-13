import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_flutter/screen/auth/widgets/base_form_field.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';

class CountryPickerFormField extends BaseFormField<CountryCode> {
  String? initialCountryCode;
  Function(CountryCode? selectedValue) onSelect;

  CountryPickerFormField(
      {Key? key,
      required this.onSelect,
      this.initialCountryCode,
      String? title,
      String? hintText,
      bool? mandatory,
      bool? enabled})
      : super(
          key: key,
          title: title,
          hintText: hintText,
          mandatory: mandatory,
          enabled: enabled,
        );

  @override
  Widget buildField(BuildContext context) {
    return FormField<CountryCode>(
      builder: (field) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: AppColors.fillGrey),
            color: AppColors.white),
        child: CountryCodePicker(
            showFlagMain: true,
            alignLeft: true,
            initialSelection: initialCountryCode,
            showDropDownButton: true,
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            padding: EdgeInsets.zero,
            onChanged: (value) {
              onSelect(value);
            }),
      ),
    );
  }
}
