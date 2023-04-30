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
}
