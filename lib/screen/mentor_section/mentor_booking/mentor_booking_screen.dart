import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentor_booking/mentor_booking_screen_provider.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentor_booking/widget/ScheduleBookingItem.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class MentorBookingScreen extends StatefulWidget {
  String name;
  String tutorId;

  MentorBookingScreen({Key? key, required this.tutorId, required this.name})
      : super(key: key);

  @override
  State<MentorBookingScreen> createState() => _MentorBookingScreenState();
}

class _MentorBookingScreenState extends State<MentorBookingScreen> {
  DateTime _selectedDate = DateTime.now();

  int _selectedIndex = 0;
  late int indexOfFirstDayMonth;
  late List<int> _listOfDates;

  late Widget _calendar;

  @override
  void initState() {
    initDaysOfWeek();
    indexOfFirstDayMonth = getIndexOfFirstDayInMonth(_selectedDate);
    _listOfDates = listOfDatesInMonth(_selectedDate);
    setState(() {
      _selectedIndex = indexOfFirstDayMonth +
          int.parse(DateFormat('d').format(DateTime.now())) -
          1;
    });
  }

  void initDaysOfWeek() {
    for (int i = DateTime.monday; i <= DateTime.sunday; i++) {
      // Create a DateTime object for the current day of the week
      DateTime day =
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - i));

      // Format the date to get the name of the day of the week
      String dayName = DateFormat('EEE').format(day);

      // Add the day name to the list
      daysOfWeek.add(dayName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MentorBookingScreenProvider(widget.tutorId),
        child: Consumer<MentorBookingScreenProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: CustomAppBar(
                  appBarName: 'Booking',
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: _onSelectDate,
                          child: Text(
                              DateFormat('MMMM yyyy').format(_selectedDate),
                              style: AppConst.textTheme.titleMedium),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                          ),
                          itemCount: daysOfWeek.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text(
                                daysOfWeek[index],
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemCount: _listOfDates.length,
                      itemBuilder: (BuildContext context, int index) {
                        final date = _listOfDates[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () => index >= indexOfFirstDayMonth
                                ? setState(() {
                                    _selectedIndex = index;
                                    _selectedDate = _selectedDate.copyWith(
                                        day: index + 1 - indexOfFirstDayMonth);
                                    provider.loadScheduleBy(
                                        widget.tutorId, _selectedDate);
                                  })
                                : null,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: index == _selectedIndex
                                        ? AppColors.primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(50)),
                                child: index < indexOfFirstDayMonth
                                    ? const Text("")
                                    : Text(
                                        '${index + 1 - indexOfFirstDayMonth}',
                                        style: TextStyle(
                                            color: index == _selectedIndex
                                                ? Colors.white
                                                : index % 7 == 6
                                                    ? Colors.redAccent
                                                    : Colors.black,
                                            fontSize: 17),
                                      )),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: buildBookings(provider, context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  List<Widget> buildBookings(
      MentorBookingScreenProvider provider, BuildContext context) {
    var schedules = provider.tutorSchedules;

    return schedules.isEmpty
        ? [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Image.asset(
                    'assets/mentors/calendar-icon.png',
                    fit: BoxFit.contain,
                    height: 200.h,
                  ),
                ),
                Text("No events today ${provider.tutorSchedules.length}",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ],
            )
          ]
        : schedules
            .map((tutorSchedule) => ScheduleBookingItem(tutorSchedule))
            .toList();
  }

  List<int> listOfDatesInMonth(DateTime currentDate) {
    var selectedMonthFirstDay =
        DateTime(currentDate.year, currentDate.month, 1);
    var nextMonthFirstDay = DateTime(selectedMonthFirstDay.year,
        selectedMonthFirstDay.month + 1, selectedMonthFirstDay.day);
    var totalDays = nextMonthFirstDay.difference(selectedMonthFirstDay).inDays;

    var listOfDates = List<int>.generate(totalDays, (i) => i + 1);
    return listOfDates;
  }

  int getIndexOfFirstDayInMonth(DateTime currentDate) {
    var selectedMonthFirstDay =
        DateTime(currentDate.year, currentDate.month, 1);
    var day = DateFormat('EEE').format(selectedMonthFirstDay);
    print('indexOfFirstDayInMonth: ${daysOfWeek.indexOf(day)}');
    return daysOfWeek.indexOf(day);
  }

  final List<String> daysOfWeek = [];

  void _onSelectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2999, 12),
        helpText: 'Select a date',
        // optional
        cancelText: 'Cancel',
        // optional
        confirmText: 'Ok' // optional
        );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _listOfDates = listOfDatesInMonth(_selectedDate);
        indexOfFirstDayMonth = getIndexOfFirstDayInMonth(_selectedDate);
        _selectedIndex = indexOfFirstDayMonth +
            int.parse(DateFormat('d').format(_selectedDate)) -
            1;
      });
    }
  }
}
