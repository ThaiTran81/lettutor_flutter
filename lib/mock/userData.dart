import 'package:lettutor_flutter/data/model/mentor/MentorSummary.dart';
import 'package:lettutor_flutter/data/model/mentor/TypeMentorCategory.dart';

class UserMock {
  static List<Mentor> users = [
    Mentor("avatar", "fullname", "rolename", 3.0),
    Mentor("avatar", "fullname", "rolename", 3.0),
    Mentor("avatar", "fullname", "rolename", 3.0),
    Mentor("avatar", "fullname", "rolename", 3.0)
  ];
  static List<MentorSummary> mentorSummary = [
    MentorSummary(
        "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00",
        "Keegan",
        "VN",
        5.0,
        [TutorSpecialty.TOEIC, TutorSpecialty.IELTS],
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."),
    MentorSummary(
        "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00",
        "Keegan",
        "VN",
        5.0,
        [TutorSpecialty.TOEIC, TutorSpecialty.IELTS],
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."),
    MentorSummary(
        "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00",
        "Keegan",
        "VN",
        5.0,
        [TutorSpecialty.TOEIC, TutorSpecialty.IELTS],
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."),
    MentorSummary(
        "https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00",
        "Keegan",
        "VN",
        5.0,
        [TutorSpecialty.TOEIC, TutorSpecialty.IELTS],
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.")
  ];
}

class Mentor{
  var avatar;
  late String fullname;
  late String rolename;
  late double rate;

  Mentor(this.avatar, this.fullname, this.rolename, this.rate);
}