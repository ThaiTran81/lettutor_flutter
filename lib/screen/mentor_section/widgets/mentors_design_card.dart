import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/widgets/tag.dart';

import '../../../data/model/mentor/TypeMentorCategory.dart';
import '../../../l10n/l10nUtils.dart';
import '../../../utils/app_consts.dart';
import '../../../widgets/custom_text.dart';

class MentorsDesignCard extends StatelessWidget {
  final String? image, name, summary;
  final double? rating;
  final String countryCode;
  final bool isFavorite;
  final List<String> specialties;
  final Function()? onTap;
  final Function()? onFavoritePressed;

  const MentorsDesignCard({
    Key? key,
    this.image,
    this.name,
    this.summary,
    this.onTap,
    this.onFavoritePressed,
    this.rating,
    required this.countryCode,
    required this.specialties,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                          imageUrl: image ?? '',
                          placeholder: (context, url) => Center(
                            child:
                                Image.asset("assets/home_page/ic_no_image.png"),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/home_page/ic_no_image.png"),
                        ),
                      ),
                      SizedBox(
                        width: 12.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: name ?? '',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.title,
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Flag.fromString(countryCode,
                                  height: 25, width: 25),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          RatingBarIndicator(
                            rating: rating ?? 0.0,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onFavoritePressed,
                    icon: Icon(
                      isFavorite ?? false
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_outlined,
                      color: AppColors.danger,
                    ),
                  )
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: specialties
                    .map((e) => Tag(
                          text: TranslateUtils.of(context)
                              ?.translateEnum<TutorSpecialty>(
                                  TutorSpecialty.from(e)),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                summary ?? '',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_calendar_outlined,
                    ),
                    label: Text(TranslateUtils.of(context)
                            ?.translate("btn_book_tutor") ??
                        ''),
                    style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
