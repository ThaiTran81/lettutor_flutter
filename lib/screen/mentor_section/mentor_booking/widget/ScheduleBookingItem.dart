import 'package:flutter/material.dart';
import 'package:lettutor_flutter/data/model/mentor/TutorSchedule.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentor_booking/mentor_booking_screen_provider.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentor_booking/widget/BookingPopup.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/widgets/custom_button.dart';
import 'package:lettutor_flutter/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class ScheduleBookingItem extends StatefulWidget {
  TutorSchedule tutorSchedule;

  ScheduleBookingItem(this.tutorSchedule, {Key? key}) : super(key: key);

  @override
  State<ScheduleBookingItem> createState() => _ScheduleBookingItemState();
}

class _ScheduleBookingItemState extends State<ScheduleBookingItem> {
  late MentorBookingScreenProvider _bookingScreenProvider =
      Provider.of<MentorBookingScreenProvider>(context);

  @override
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    var tutorSchedule = widget.tutorSchedule;
    final startDateTime =
        DateTime.fromMillisecondsSinceEpoch(tutorSchedule.startTimestamp!);
    final endDateTime =
        DateTime.fromMillisecondsSinceEpoch(tutorSchedule.endTimestamp!);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: tutorSchedule.isBooked == true
          ? AppColors.danger.withOpacity(0.7)
          : AppColors.success,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                buildTimeText(startDateTime),
                Icon(Icons.arrow_right_alt_rounded),
                buildTimeText(endDateTime)
              ],
            ),
            CustomTextButton(
              text: CustomText(
                text: "book",
                color: Colors.white,
              ),
              styleButton: StyleButton(fillColor: AppColors.primary),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => BookingPopup(
                    widget.tutorSchedule,
                    provider: _bookingScreenProvider,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Text buildTimeText(DateTime dateTime) {
    return Text(
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}",
      style: AppConst.textTheme.labelLarge,
    );
  }
}
