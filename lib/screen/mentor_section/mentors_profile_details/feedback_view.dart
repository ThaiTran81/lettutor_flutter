import 'package:flutter/material.dart';
import 'package:lettutor_flutter/screen/mentor_section/mentors_profile_details/components/feedback_card.dart';
import 'package:lettutor_flutter/utils/app_consts.dart';
import 'package:provider/provider.dart';

import 'feedback_view_provider.dart';

class FeedbackView extends StatefulWidget {
  String userId;

  FeedbackView({Key? key, required this.userId}) : super(key: key);

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FeedbackViewProvider(widget.userId),
      child: Consumer<FeedbackViewProvider>(
        builder: (context, provider, child) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: provider.feedbacks.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Empty",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black26),
                          ))
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LimitedBox(
                      maxHeight: MediaQuery.of(context).size.width,
                      maxWidth: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Feedbacks",
                            style: AppConst.textTheme.headlineMedium,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: provider.feedbacks.length,
                              itemBuilder: (BuildContext context, int index) {
                                final data = provider.feedbacks[index];
                                return FeedbackCard(feedback: data);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
