import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/screen/auth/widgets/base_form_field.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';

typedef String StringConverter<T>(T? item);

class ComboboxFormField<T> extends BaseFormField {
  String? hintText;
  List<T> items;
  StringConverter<T> stringConverter;
  T? _selectedOptionS;
  Function(T? selectedValue) onSelect;

  ComboboxFormField(
      {Key? key,
      T? initialValue,
      bool? mandatory,
      bool? enabled,
      String? title,
      this.hintText,
      required this.items,
      required this.stringConverter,
      required this.onSelect})
      : super(
            key: key,
            title: title,
            hintText: hintText,
            initialValue: initialValue,
            mandatory: mandatory,
            enabled: mandatory);

  @override
  Widget buildField(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        value: initialValue,
        decoration: InputDecoration(
          filled: true,
          fillColor: enabled ?? true ? AppColors.white : AppColors.fillGrey,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.0),
          ),
          contentPadding: EdgeInsets.zero,
          hintText: '$hintText',
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fillGrey),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.hintTextColor,
              fontWeight: FontWeight.w400),
          border: const OutlineInputBorder(),
        ),
        // isExpanded: true,
        hint: Text(
          this.hintText ?? '',
          style: TextStyle(fontSize: 14),
        ),
        items: items
            .map((item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    stringConverter(item),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {
          onSelect(value);
        },
        buttonStyleData: const ButtonStyleData(
          height: 50,
          padding: EdgeInsets.only(left: 0, right: 25),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 30,
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, 5),
          maxHeight: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
