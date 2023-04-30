import 'package:lettutor_flutter/data/model/course/course/CourseResponse.dart';
import 'package:lettutor_flutter/data/model/course/ebook/EbookResponse.dart';
import 'package:lettutor_flutter/data/network/constants/endpoints.dart';
import 'package:lettutor_flutter/data/network/dio_client.dart';

class CourseApi {
  // dio instance
  final DioClient _dioClient;

  CourseApi(this._dioClient);

  Future<CourseResponse> getCourseListByPagination(
      int numPerPage, int page) async {
    final res = await _dioClient
        .get(Endpoints.getCourseWithpagination(numPerPage, page));
    return CourseResponse.fromJson(res);
  }

  Future<EbookResponse> getEbookListByPagination(
      int numPerPage, int page) async {
    final res = await _dioClient
        .get(Endpoints.getEbookWithpagination(numPerPage, page));
    return EbookResponse.fromJson(res);
  }
}
