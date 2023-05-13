import 'LearnTopic.dart';
import 'TestPreparation.dart';
import 'WalletInfo.dart';

class UserData {
  UserData({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    this.canSendMessage,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'];
    walletInfo = json['walletInfo'] != null
        ? WalletInfo.fromJson(json['walletInfo'])
        : null;
    if (json['courses'] != null) {
      courses = [];
      // TODO temporarily ignore
      // json['courses'].forEach((v) {
      //   courses?.add(Dynamic.fromJson(v));
      // });
    }
    requireNote = json['requireNote'];
    level = json['level'];
    if (json['learnTopics'] != null) {
      learnTopics = [];
      json['learnTopics'].forEach((v) {
        learnTopics?.add(LearnTopic.fromJson(v));
      });
    }
    if (json['testPreparations'] != null) {
      testPreparations = [];
      json['testPreparations'].forEach((v) {
        testPreparations?.add(TestPreparation.fromJson(v));
      });
    }
    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    studySchedule = json['studySchedule'];
    canSendMessage = json['canSendMessage'];
  }

  late String? id;
  late String? email;
  late String? name;
  late String? avatar;
  late String? country;
  late String? phone;
  late List<String>? roles;
  late dynamic? language;
  late String? birthday;
  late bool? isActivated;
  late WalletInfo? walletInfo;
  late List<dynamic>? courses;
  late String? requireNote;
  late String? level;
  late List<LearnTopic>? learnTopics;
  late List<TestPreparation>? testPreparations;
  late bool? isPhoneActivated;
  late int? timezone;
  late String? studySchedule;
  late bool? canSendMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['name'] = name;
    map['avatar'] = avatar;
    map['country'] = country;
    map['phone'] = phone;
    map['roles'] = roles;
    map['language'] = language;
    map['birthday'] = birthday;
    map['isActivated'] = isActivated;
    final walletInfo = this.walletInfo;
    if (walletInfo != null) {
      map['walletInfo'] = walletInfo.toJson();
    }
    final courses = this.courses;
    if (courses != null) {
      map['courses'] = courses.map((v) => v.toJson()).toList();
    }
    map['requireNote'] = requireNote;
    map['level'] = level;
    final learnTopics = this.learnTopics;
    if (learnTopics != null) {
      map['learnTopics'] = learnTopics.map((v) => v.toJson()).toList();
    }
    final testPreparations = this.testPreparations;
    if (testPreparations != null) {
      map['testPreparations'] =
          testPreparations.map((v) => v.toJson()).toList();
    }
    map['isPhoneActivated'] = isPhoneActivated;
    map['timezone'] = timezone;
    map['studySchedule'] = studySchedule;
    map['canSendMessage'] = canSendMessage;
    return map;
  }
}
