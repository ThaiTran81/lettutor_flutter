import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_flutter/data/model/mentor/TutorSchedule.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentor_booking/mentor_booking_screen_provider.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:lettutor_flutter/utils/widget_utils.dart';

class BookingPopup extends StatelessWidget {
  final TextEditingController _noteController = TextEditingController();
  int balance = 0;
  final int price = 1;
  final MentorBookingScreenProvider provider;
  TutorSchedule tutorSchedule;

  BookingPopup(this.tutorSchedule, {Key? key, required this.provider})
      : super(key: key) {
    balance = provider.getBalance();
  }

  @override
  Widget build(BuildContext context) {
    final startDateTime =
        DateTime.fromMillisecondsSinceEpoch(tutorSchedule.startTimestamp!);
    final endDateTime =
        DateTime.fromMillisecondsSinceEpoch(tutorSchedule.endTimestamp!);

    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy').format(startDateTime);
    return AlertDialog(
      title: Text('Booking detail'),
      content: LimitedBox(
        maxWidth: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.lightBleu),
              child: Row(
                children: [
                  buildTimeText(startDateTime),
                  Icon(Icons.arrow_right_alt_rounded),
                  buildTimeText(endDateTime),
                  SpaceUtils.hSpace10(),
                  Flexible(
                    child: Text(
                      formattedDate,
                      style: AppConst.textTheme.labelLarge
                          ?.copyWith(color: AppColors.primary),
                    ),
                  )
                ],
              ),
            ),
            SpaceUtils.vSpace10(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Balance:',
                    style: AppConst.textTheme.bodyLarge, maxLines: 2),
                Flexible(
                  flex: 1,
                  child: Text(
                    'You have $balance lessons left',
                    style: AppConst.textTheme.labelMedium,
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            SpaceUtils.vSpace(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price:',
                  style: AppConst.textTheme.bodyLarge,
                ),
                SpaceUtils.hSpace5,
                Text(
                  '$price lessons',
                  style: AppConst.textTheme.labelMedium,
                )
              ],
            ),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your note here',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Book'),
          onPressed: () {
            String note = _noteController.text;
            provider.bookSchedule(tutorSchedule, note);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Text buildTimeText(DateTime dateTime) {
    return Text(
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}",
      style: AppConst.textTheme.labelLarge?.copyWith(color: AppColors.primary),
    );
  }
}
