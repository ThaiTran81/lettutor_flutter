import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/widgets/custom_app_bar.dart';

class MentorBookingScreen extends StatefulWidget {
  String name;
  String tutorId;

  MentorBookingScreen({Key? key, required this.tutorId, required this.name})
      : super(key: key);

  @override
  State<MentorBookingScreen> createState() => _MentorBookingScreenState();
}

class _MentorBookingScreenState extends State<MentorBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(
          appBarName: 'Booking',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(color: Colors.white, child: Text('halo')),
      ),
    );
  }
}
