import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/screen/history/widget/history_card.dart';
import 'package:provider/provider.dart';

import 'history_screen_provider.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => HistoryScreenProvider(),
        child: Consumer<HistoryScreenProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    ...provider.bookedClassHistory
                        .map((bookedClass) => HistoryCard(bookedClass))
                        .toList()
                  ],
                )),
              ),
            );
          },
        ));
  }
}
