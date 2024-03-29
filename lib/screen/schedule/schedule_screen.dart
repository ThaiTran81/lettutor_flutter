import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/screen/schedule/schedule_provider.dart';
import 'package:lettutor_thaitran81/screen/schedule/widget/schedule_card.dart';
import 'package:provider/provider.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ScheduleProvider(),
        child: Consumer<ScheduleProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    ...provider.bookedClasses
                        .map((bookedClass) => ScheduleCard(bookedClass.id!, bookedClass))
                        .toList()
                  ],
                )),
              ),
            );
          },
        ));
  }
}
