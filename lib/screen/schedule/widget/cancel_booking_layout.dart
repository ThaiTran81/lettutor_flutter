import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/data/model/schedule/ScheduleDetailInfo.dart';
import 'package:lettutor_thaitran81/data/model/schedule/cancel_reason.dart';
import 'package:lettutor_thaitran81/l10n/l10nUtils.dart';
import 'package:lettutor_thaitran81/screen/schedule/schedule_provider.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';

class BookingCancelPanel extends StatefulWidget {

  ScheduleDetailInfo scheduleDetailInfo;
  String bookingId;
  Function()? onConfirm;
  ScheduleProvider scheduleProvider;
  BookingCancelPanel({Key? key, required this.scheduleDetailInfo, this.onConfirm, required this.scheduleProvider, required this.bookingId}) : super(key: key);

  @override
  State<BookingCancelPanel> createState() => _BookingCancelPanelState();
}

class _BookingCancelPanelState extends State<BookingCancelPanel> {

  CancelReason _selectedReason = CancelReason.reschedule;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cancel Appointment'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<CancelReason>(
              value: _selectedReason,
              items: [
                ...CancelReason.values
                    .map((cancelReason) =>
                        _builDropdownItem(cancelReason, context))
                    .toList(),
              ],
              onChanged: (value) {
                _selectedReason = value ?? _selectedReason;
              },
              decoration: const InputDecoration(
                labelText: 'Cancel Reason',
                border: OutlineInputBorder(),
              ),
            ),
            SpaceUtils.vSpace10(),
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
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
        ElevatedButton(
          child: Text('Confirm'),
          onPressed: () {
            widget.scheduleProvider.cancelSchedule(widget.bookingId, _selectedReason, _controller.text, context);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  DropdownMenuItem<CancelReason> _builDropdownItem(
      CancelReason cancelReason, BuildContext context) {
    return DropdownMenuItem(
      value: cancelReason,
      child: Text(
          TranslateUtils.of(context).translateEnum<CancelReason>(cancelReason)),
    );
  }
}
