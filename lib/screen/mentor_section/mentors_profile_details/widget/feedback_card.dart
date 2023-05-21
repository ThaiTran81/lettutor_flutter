import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor_thaitran81/data/model/tutor/Feedback.dart';
import 'package:lettutor_thaitran81/utils/app_consts.dart';
import 'package:lettutor_thaitran81/utils/widget_utils.dart';
import 'package:lettutor_thaitran81/widgets/cache_image.dart';

class FeedbackCard extends StatelessWidget {
  FeedbackData feedback;

  FeedbackCard({Key? key, required this.feedback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipOval(
                    child: CacheImage(
                      url: feedback.firstInfo?.avatar ?? '',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SpaceUtils.hSpace5,
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(feedback.firstInfo?.name ?? '',
                                style: AppConst.textTheme.labelLarge),
                            Row(
                              children: [
                                buildRatingBarIndicator(),
                                Text(
                                  feedback.rating?.toStringAsFixed(2) ?? '',
                                  style: AppConst.textTheme.displaySmall,
                                )
                              ],
                            )
                          ],
                        ),
                        Text(feedback.updatedAt ?? '',
                            style: AppConst.textTheme.displaySmall)
                      ],
                    ),
                  )
                ],
              ),
              SpaceUtils.vSpace10(),
              Flexible(
                  child: Text(
                feedback.content ?? '',
                style: AppConst.textTheme.labelMedium,
              ))
            ],
          ),
        ),
      ),
    );
  }

  RatingBarIndicator buildRatingBarIndicator() {
    return RatingBarIndicator(
      rating: feedback.rating ?? 0.0,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 16.0,
      direction: Axis.horizontal,
    );
  }
}
