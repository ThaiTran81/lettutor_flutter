import 'TypeMentorCategory.dart';

class MentorSummary {
  String avatar;
  String name;
  String country;
  double rating;
  List<TutorSpecialty> types;
  String summary;

  MentorSummary(this.avatar, this.name, this.country, this.rating, this.types,
      this.summary);
}
