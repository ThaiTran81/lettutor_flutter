import 'package:flutter/material.dart';
import 'package:lettutor_flutter/screen/auth/widgets/base_form_field.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';

typedef String StringConverter<T>(T? item);
typedef Predicate<T> = bool Function(T value);

class SelectFormField<T> extends BaseFormField {
  String? hintText;
  List<T> items;
  StringConverter<T> stringConverter;
  T? _selectedOption;
  Function(T? selectedValue) onSelect;

  // using for showing effect after selected
  Predicate<T>? selectedCondition;

  SelectFormField(
      {Key? key,
      T? initialValue,
      bool? mandatory,
      bool? enabled,
      String? title,
      this.hintText,
      this.selectedCondition,
      required this.items,
      required this.stringConverter,
      required this.onSelect})
      : super(
            key: key,
            title: title,
            hintText: hintText,
            mandatory: mandatory,
            active: enabled,
            buildField: (field) => Wrap(
                  children: items.map((item) {
                    final isSelected = selectedCondition != null
                        ? selectedCondition!(item)
                        : false;
                    return GestureDetector(
                      onTap: () {
                        onSelect(item);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Chip(
                          label: Text(stringConverter(item),
                              style: AppConst.textTheme.titleSmall?.apply(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.non_select)),
                          backgroundColor: isSelected
                              ? AppColors.lightBleu
                              : AppColors.fillGrey,
                        ),
                      ),
                    );
                  }).toList(),
                ));
}
