import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lettutor_flutter/screen/mentor_section/widgets/tag.dart';

import '../../../l10n/l10nUtils.dart';
import '../../../model/mentor/TypeMentorCategory.dart';
import '../../../utils/app_consts.dart';
import '../../../widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MentorsDesignCard extends StatelessWidget {
  final String? image, name, summary;
  final double? rating;
  final String countryCode;
  final List<TypeMentorCategory> types;
  final Function()? onTap;

  const MentorsDesignCard(
      {Key? key,
      this.image,
      this.name,
      this.summary,
      this.onTap,
      this.rating,
      required this.countryCode,
      required this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            height: 64.h,
                            fit: BoxFit.cover,
                            imageUrl: image!,
                            placeholder: (context, url) => Center(
                              child: Image.asset(
                                  "assets/home_page/ic_no_image.png"),
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
                            Row(
                              children: types
                                  .map((e) => Tag(
                                        text:
                                            I10nUtils.translateFrom(e, context),
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 4, 0),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.danger,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  summary ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_calendar_outlined,
                      ),
                      label: Text(AppLocalizations.of(context).btn_book_tutor),
                      style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
