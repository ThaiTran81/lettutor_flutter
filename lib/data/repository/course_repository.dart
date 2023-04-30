import 'package:lettutor_flutter/data/model/course/course/CourseResponse.dart';
import 'package:lettutor_flutter/data/model/course/ebook/EbookResponse.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/course_api.dart';

class CourseRepository {
  final CourseApi _courseApi;

  CourseRepository(this._courseApi);

  Future<CourseResponse> getCourseListByPagination(
      int numPerPage, int page) async {
    final res = await _courseApi.getCourseListByPagination(numPerPage, page);
    return res;
  }

  Future<EbookResponse> getEbookListByPagination(
      int numPerPage, int page) async {
    final res = await _courseApi.getEbookListByPagination(numPerPage, page);
    return res;
  }
}
