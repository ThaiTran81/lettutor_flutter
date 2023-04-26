import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/auth/widgets/text_form_field.dart';
import 'package:lettutor_flutter/widgets/elevated_button_widget.dart';

class BasicInfoContent extends StatelessWidget {
  const BasicInfoContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "Full Name",
          hintText: "Write your full name",
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "Email Address",
          hintText: "Write your email address",
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
          title: "Phone Number",
          hintText: "+01 | 023-6894-523",
        ),
        SizedBox(
          height: 24.h,
        ),
        FromField(
            title: "Date of Birth",
            hintText: "23-06-1995",
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today_outlined))),
        SizedBox(
          height: 24.h,
        ),
        ElevatedButtonWidget(
          text: "Update",
          onPressed: () {},
        )
      ],
    );
  }
}
