import 'package:lettutor_thaitran81/data/model/mentor/TypeMentorCategory.dart';
import 'package:lettutor_thaitran81/data/model/user/StudyLevel.dart';

class UpdateUserRequest {
  String? name;
  String? country;
  String? phone;
  String? birthday;
  StudyLevel? studyLevel;
  Set<TutorSpecialty?>? learnTopics;
  Set<TutorSpecialty?>? testPreparations;
  String? studySchedule;

  UpdateUserRequest(
      {this.name,
      this.country,
      this.phone,
      this.birthday,
      this.studyLevel,
      this.learnTopics,
      this.testPreparations,
      this.studySchedule});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country'] = country;
    map['phone'] = phone;
    map['birthday'] = birthday;
    var studyLevelMap = StudyLevel.codeStudyLevelMap;
    map['level'] = studyLevelMap.keys
        .where((key) => studyLevelMap[key] == studyLevel)
        .first;
    final learnTopics = this.learnTopics;
    if (learnTopics != null) {
      map['learnTopics'] = learnTopics.map((v) => v?.digitCode).toList();
    }
    final testPreparations = this.testPreparations;
    if (testPreparations != null) {
      map['testPreparations'] =
          testPreparations.map((v) => v?.digitCode).toList();
    }
    map['studySchedule'] = studySchedule;
    return map;
  }
}
