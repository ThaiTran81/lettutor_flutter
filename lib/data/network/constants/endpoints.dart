class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://sandbox.api.lettutor.com";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // login endpoints
  static const String login = "$baseUrl/auth/login";

  // login by phone-number
  static const String loginByPhoneNumber = "$baseUrl/auth/phone-login";

  // register
  static const String register = "$baseUrl/auth/register";

  static const String getTotalHour = "$baseUrl/call/total";

  // update user info
  static const String updateUser = "$baseUrl/user/info";

  // upload avatar
  static const String uploadAvatar = "$baseUrl/user/uploadAvatar";

  /**
   * tutor api
   */

  static String getListTutorWithPagination(int limitNumber, int pageNumber) {
    return "$baseUrl/tutor/more?perPage=$limitNumber&page=$pageNumber";
  }

  static const String searchTutor = "$baseUrl/tutor/search";

  static String getTutorFeedback(String userId, int perPage, int pageNumber) {
    return "$baseUrl/feedback/v2/$userId?page=$pageNumber&perPage=$perPage";
  }

  static const String manageFavoriteTutor = "$baseUrl/user/manageFavoriteTutor";

  static const String reportTutor = "$baseUrl/report";

  /**
   * course api
   */
  static String getCourseWithpagination(int numPerPage, int pageNumber) {
    return "$baseUrl/course?page=$pageNumber&size=$numPerPage";
  }

  static String getEbookWithpagination(int numPerPage, int pageNumber) {
    return "$baseUrl/e-book?page=$pageNumber&size=$numPerPage";
  }

  static String getTutorInformationById(String id) {
    return "$baseUrl/tutor/$id";
  }

  /**
   * meeting api
   */
  static String historyMeeting(int numPerPage, int page, bool? isTutor) {
    return "$baseUrl/call/history?page=$page&perPage=$numPerPage&isTutor=$isTutor";
  }

  static String getBookedClass(int perPage, int page, int datetimeGte) {
    return "$baseUrl/booking/list/student?page=$page&perPage=$perPage&dateTimeGte=$datetimeGte&orderBy=meeting&sortBy=asc";
  }

  static String getHistoryBookedClass(int perPage, int page, int datetimeGte) {
    return "$baseUrl/booking/list/student?page=$page&perPage=$perPage&dateTimeLte=$datetimeGte&orderBy=meeting&sortBy=desc";
  }

  static const String getScheduleByTutorId = "$baseUrl/schedule";

  static String getScheduleByTutorIdAndTime(
      String tutorId, DateTime startTime, DateTime endTime) {
    var start = startTime.millisecondsSinceEpoch;
    var end = endTime.millisecondsSinceEpoch;
    return "$baseUrl/schedule?tutorId=$tutorId&startTimestamp=$start&endTimestamp=$end";
  }

  static const String booking = "$baseUrl/booking";

  static const String cancelSchedule = "$baseUrl/booking/schedule-detail";
}
