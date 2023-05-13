import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_flutter/data/model/user/StudyLevel.dart';
import 'package:lettutor_flutter/l10n/l10nUtils.dart';
import 'package:lettutor_flutter/screen/auth/widgets/combobox_form_field.dart';
import 'package:lettutor_flutter/screen/auth/widgets/country_picker_form_field.dart';
import 'package:lettutor_flutter/screen/auth/widgets/multi_select_form_field.dart';
import 'package:lettutor_flutter/screen/auth/widgets/text_form_field.dart';
import 'package:lettutor_flutter/screen/profile/my_profile_provider.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/elevated_button_widget.dart';
import 'package:provider/provider.dart';

class BasicInfoFormData {
  String? name;
  DateTime? dob;
  String? country;
  String? phoneNumber;
  StudyLevel? studyLevel;
  Set<TutorSpecialty?>? specialities;
  Set<TutorSpecialty?>? testPreparations;
  String? studySchedule;

  BasicInfoFormData(
      {this.name,
      this.dob,
      this.country,
      this.phoneNumber,
      this.studyLevel,
      this.specialities,
      this.testPreparations,
      this.studySchedule});

  BasicInfoFormData copy() {
    return BasicInfoFormData(
        name: name,
        dob: dob,
        country: country,
        phoneNumber: phoneNumber,
        studyLevel: studyLevel,
        specialities: specialities?.toSet() ?? {},
        testPreparations: testPreparations?.toSet() ?? {},
        studySchedule: studySchedule);
  }
}

class BasicInfoContent extends StatefulWidget {
  BasicInfoFormData basicInfoFormData;

  BasicInfoContent({Key? key, required this.basicInfoFormData})
      : super(key: key);

  @override
  State<BasicInfoContent> createState() => _BasicInfoContentState();
}

class _BasicInfoContentState extends State<BasicInfoContent> {
  final _formKey = GlobalKey<FormState>();

  late BasicInfoFormData _basicInfoFormData;
  late MyProfileProvider _myProfileProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _myProfileProvider = Provider.of<MyProfileProvider>(context);
  }

  @override
  void initState() {
    super.initState();
    _basicInfoFormData = widget.basicInfoFormData.copy();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpaceUtils.vSpace(24),
            FormTextField(
              controller: TextEditingController(),
              title: "Full Name",
              mandatory: true,
              hintText: "Write your full name",
              initialValue: _basicInfoFormData.name,
              onSave: (value) {
                _basicInfoFormData.name = value;
              },
            ),
            SpaceUtils.vSpace(24),
            CountryPickerFormField(
              title: "Country",
              hintText: "Select your country",
              mandatory: true,
              initialCountryCode: _basicInfoFormData.country,
              onSelect: (CountryCode? selectedValue) {
                _basicInfoFormData.country = selectedValue?.code;
              },
            ),
            SpaceUtils.vSpace(24),
            FormTextField(
              controller: TextEditingController(),
              title: "Phone Number",
              hintText: "+84 | 023-6894-523",
              enabled: false,
              initialValue: _basicInfoFormData.phoneNumber,
            ),
            SpaceUtils.vSpace(24),
            GestureDetector(
              child: FormTextField(
                controller: TextEditingController(),
                title: "Date of Birth",
                mandatory: true,
                hintText: "23-06-1995",
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_today_outlined)),
                enabled: false,
                initialValue:
                    DateFormat('yyyy-MM-dd').format(_basicInfoFormData.dob!),
              ),
              onTap: () => _selectDob(context),
            ),
            SpaceUtils.vSpace(24),
            ComboboxFormField<StudyLevel>(
              title: "My level",
              mandatory: true,
              hintText: "Select your level",
              items: StudyLevel.values,
              initialValue: _basicInfoFormData.studyLevel,
              onSelect: (selectedValue) {
                _basicInfoFormData.studyLevel = selectedValue;
              },
              stringConverter: (item) =>
                  TranslateUtils.of(context)!.translateEnum<StudyLevel>(item),
            ),
            SpaceUtils.vSpace(24),
            SelectFormField<TutorSpecialty>(
              title: "Subject want to learn",
              hintText: "select subjects you want to learn",
              mandatory: true,
              items: const [
                TutorSpecialty.E_4_KIDS,
                TutorSpecialty.E_4_BUSINESS,
                TutorSpecialty.CONVERSATIONAL
              ],
              stringConverter: (item) =>
                  TranslateUtils.of(context)?.translateEnum(item) ?? '',
              onSelect: (selectedValue) {
                if (_basicInfoFormData.specialities?.contains(selectedValue) ??
                    false) {
                  _basicInfoFormData.specialities?.remove(selectedValue);
                } else {
                  _basicInfoFormData.specialities?.add(selectedValue!);
                }
                setState(() {});
              },
              selectedCondition: (value) =>
                  _basicInfoFormData.specialities?.contains(value) ?? false,
            ),
            SpaceUtils.vSpace(24),
            SelectFormField<TutorSpecialty>(
              title: "Test preparations",
              hintText: "select tests you want to prepare",
              mandatory: true,
              items: const [
                TutorSpecialty.STARTERS,
                TutorSpecialty.MOVERS,
                TutorSpecialty.FLYERS,
                TutorSpecialty.KET,
                TutorSpecialty.PET,
                TutorSpecialty.IELTS,
                TutorSpecialty.TOELF,
                TutorSpecialty.TOEIC
              ],
              stringConverter: (item) =>
                  TranslateUtils.of(context)?.translateEnum(item) ?? '',
              onSelect: (selectedValue) {
                if (_basicInfoFormData.testPreparations!
                    .contains(selectedValue)) {
                  _basicInfoFormData.testPreparations!.remove(selectedValue);
                } else {
                  _basicInfoFormData.testPreparations!.add(selectedValue!);
                }
                setState(() {});
              },
              selectedCondition: (value) =>
                  _basicInfoFormData.testPreparations!.contains(value),
            ),
            SpaceUtils.vSpace(24),
            FormTextField(
              controller: TextEditingController(),
              title: "Study shedule",
              hintText: "Note the time of week you want to study on LetTutor",
              initialValue: _basicInfoFormData.studySchedule,
              onSave: (value) {
                _basicInfoFormData.studySchedule = value;
              },
            ),
            SpaceUtils.vSpace(24),
            ElevatedButtonWidget(
              text: "Update",
              onPressed: _onUpdateInfo,
            ),
            SpaceUtils.vSpace(60),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _basicInfoFormData.dob!,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2999, 12),
        helpText: 'Select a date',
        // optional
        cancelText: 'Cancel',
        // optional
        confirmText: 'Ok' // optional
        );
    if (picked != null && picked != _basicInfoFormData.dob) {
      setState(() {
        _basicInfoFormData.dob = picked;
      });
    }
  }

  _onUpdateInfo() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _myProfileProvider.updateUserInfo(_basicInfoFormData);
    }
  }
}
