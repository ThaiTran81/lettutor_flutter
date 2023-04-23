import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/data/model/mentor/MentorSummary.dart';

import '../mentors_profile_details/mentors_profile_details.dart';
import 'mentors_design_card.dart';

class MentorCardList extends StatelessWidget {
  // final MentorsResponse? mentorsResponse;
  List<MentorSummary> mentorSumaries;
  MentorCardList({Key? key, required this.mentorSumaries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  mentorSumaries.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Visibility(
                visible: true,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Instructors not found",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    )),
              )
            ],
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 230.h,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: mentorSumaries.length ?? 0,
            itemBuilder: (context, index) {
              final data = mentorSumaries[index];
              return MentorsDesignCard(
                image: data.avatar,
                name: data.name,
                summary: data.summary,
                rating: double.parse("${data.rating}"),
                countryCode: data.country,
                types: data.types,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MentorsProfile(users: data),
                      ));
                },
              );
            },
          );
  }
}
