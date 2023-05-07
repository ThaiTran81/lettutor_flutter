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
import 'package:lettutor_flutter/utils/widget_utils.dart';
import 'package:lettutor_flutter/widgets/elevated_button_widget.dart';

class BasicInfoFormData {
  String? name;
  DateTime? dob;
  String? country;
  String? phoneNumber;
  StudyLevel? studyLevel;
  Set<TutorSpecialty>? specialities;
  Set<TutorSpecialty>? testPreparations;
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
}

class BasicInfoContent extends StatefulWidget {
  BasicInfoFormData basicInfoFormData;

  BasicInfoContent({Key? key, required this.basicInfoFormData})
      : super(key: key);

  @override
  State<BasicInfoContent> createState() => _BasicInfoContentState();
}

class _BasicInfoContentState extends State<BasicInfoContent> {
  String? name;
  DateTime? selectedDob;
  String? selectedCountry;
  String? phoneNumber;
  StudyLevel? studyLevel;
  Set<TutorSpecialty> selectedSpecialities = {};
  Set<TutorSpecialty> selectedTestPreparations = {};
  String? studySchedule;

  @override
  void initState() {
    super.initState();
    var basicInfoFormData = widget.basicInfoFormData;

    name = basicInfoFormData.name;
    selectedDob = basicInfoFormData.dob;
    selectedCountry = basicInfoFormData.country;
    phoneNumber = basicInfoFormData.phoneNumber;
    selectedSpecialities =
        basicInfoFormData.specialities ?? selectedSpecialities;
    selectedTestPreparations =
        basicInfoFormData.testPreparations ?? selectedTestPreparations;
    studyLevel = basicInfoFormData.studyLevel;
    studySchedule = basicInfoFormData.studySchedule;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpaceUtils.vSpace(24),
            FormTextField(
              controller: TextEditingController(),
              title: "Full Name",
              mandatory: true,
              hintText: "Write your full name",
              initialValue: name,
            ),
            SpaceUtils.vSpace(24),
            CountryPickerFormField(
              title: "Country",
              hintText: "Select your country",
              mandatory: true,
              initialCountryCode: selectedCountry,
              onSelect: (CountryCode? selectedValue) {},
            ),
            SpaceUtils.vSpace(24),
            FormTextField(
              controller: TextEditingController(),
              title: "Phone Number",
              hintText: "+84 | 023-6894-523",
              enabled: false,
              initialValue: phoneNumber,
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
                initialValue: DateFormat('yyyy-MM-dd').format(selectedDob!),
              ),
              onTap: () => _selectDob(context),
            ),
            SpaceUtils.vSpace(24),
            ComboboxFormField<StudyLevel>(
                title: "My level",
                mandatory: true,
                hintText: "Select your level",
                items: StudyLevel.values,
                initialValue: studyLevel,
                onSelect: (selectedValue) {},
                stringConverter: (item) => TranslateUtils.of(context)!
                    .translateEnum<StudyLevel>(item)),
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
                if (selectedSpecialities.contains(selectedValue)) {
                  selectedSpecialities.remove(selectedValue);
                } else {
                  selectedSpecialities.add(selectedValue!);
                }
                setState(() {});
              },
              selectedCondition: (value) =>
                  selectedSpecialities.contains(value),
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
                if (selectedTestPreparations.contains(selectedValue)) {
                  selectedTestPreparations.remove(selectedValue);
                } else {
                  selectedTestPreparations.add(selectedValue!);
                }
                setState(() {});
              },
              selectedCondition: (value) =>
                  selectedTestPreparations.contains(value),
            ),
            SpaceUtils.vSpace(24),
            FormTextField(
              controller: TextEditingController(),
              title: "Study shedule",
              hintText: "Note the time of week you want to study on LetTutor",
              initialValue: studySchedule,
            ),
            SpaceUtils.vSpace(24),
            ElevatedButtonWidget(
              text: "Update",
              onPressed: () {},
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
