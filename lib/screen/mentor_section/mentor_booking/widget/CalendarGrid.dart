// Create a new StatefulWidget for the GridView
import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';

class CalendarGrid extends StatelessWidget {
  final List<int> listOfDates;
  final int selectedIndex;
  final Function(int) onDateSelected;

  const CalendarGrid({
    required Key key,
    required this.listOfDates,
    required this.selectedIndex,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: listOfDates.length,
      itemBuilder: (BuildContext context, int index) {
        final date = listOfDates[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              onDateSelected(date);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                '$date',
                style: TextStyle(
                  color: index == selectedIndex
                      ? Colors.white
                      : index % 7 == 6
                          ? Colors.redAccent
                          : Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
