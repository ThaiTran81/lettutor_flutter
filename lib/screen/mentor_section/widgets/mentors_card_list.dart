import 'package:flutter/material.dart';
import 'package:lettutor_thaitran81/di/components/service_locator.dart';
import 'package:lettutor_thaitran81/screen/mentor_section/mentors_screen/mentors_screen_provider.dart';
import 'package:provider/provider.dart';

import '../mentors_profile_details/mentors_profile_details.dart';
import 'mentors_design_card.dart';

class MentorCardList extends StatefulWidget {
  Function(ScrollController scrollController)? onScroll;

  MentorCardList({Key? key, this.onScroll}) : super(key: key);

  @override
  State<MentorCardList> createState() => _MentorCardListState();
}

class _MentorCardListState extends State<MentorCardList> {
  final _scrollCotroller = ScrollController();
  late MentorsScreenProvider _mentorsScreenProvider =
      getIt.get<MentorsScreenProvider>();

  @override
  Widget build(BuildContext context) {
    return _mentorsScreenProvider.tutors.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Visibility(
                visible: true,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tutors not found",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26),
                    )),
              )
            ],
          )
        : ListView.builder(
            controller: _scrollCotroller,
            itemCount: _mentorsScreenProvider.isLoadingMore
                ? _mentorsScreenProvider.tutors.length + 1
                : _mentorsScreenProvider.tutors.length,
            itemBuilder: (context, index) {
              if (index < _mentorsScreenProvider.tutors.length) {
                final data = _mentorsScreenProvider.tutors[index];
                return MentorsDesignCard(
                  image: data.avatar,
                  name: data.name,
                  summary: data.bio,
                  rating: double.parse("${data.rating ?? 0}"),
                  countryCode: data.country ?? 'VN',
                  specialties: data.specialties ?? List.empty(),
                  isFavorite: data.isfavoritetutor ?? false,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MentorsProfile(tutorInfo: data),
                        ));
                  },
                  onFavoritePressed: () {
                    _mentorsScreenProvider.sendFavoriteTutor(
                        data.userId ?? '', context);
                  },
                );
              } else if (_mentorsScreenProvider.tutors.length >=
                  _mentorsScreenProvider.totalTutors) {
                return Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text("-- End --"),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()),
                );
              }
            },
          );
  }

  @override
  void didChangeDependencies() {
    _mentorsScreenProvider = Provider.of<MentorsScreenProvider>(context);
    _scrollCotroller.addListener(_onScrollListener);
  }

  @override
  void initState() {}

  void _onScrollListener() async {
    if (_scrollCotroller.position.pixels ==
            _scrollCotroller.position.maxScrollExtent &&
        _mentorsScreenProvider.isLoadingMore == false) {
      _mentorsScreenProvider.setLoadingMoreIs(true);
      _mentorsScreenProvider.loadMoreTutorListResult(true);
    }

    // widget.onScroll!(_scrollCotroller);
  }
}
