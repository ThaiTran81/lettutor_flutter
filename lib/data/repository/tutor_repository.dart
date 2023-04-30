import 'package:lettutor_flutter/data/model/tutor/CriteriaSearchRequest.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorInforDetailResponse.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_flutter/data/model/tutor/feedback/FeedbackResponse.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/tutor_api.dart';

class TutorRepository {
  final TutorApi _tutorApi;

  TutorRepository(this._tutorApi);

  Future<TutorListResponse?> getTutorList(int limit, int pageNumber) async {
    TutorListResponse? res =
        await _tutorApi.getListTutorWithPagination(limit, pageNumber);

    return res;
  }

  Future<TutorListResponse?> getTutorListBy(
      CriteriaSearchRequest request) async {
    TutorListResponse? res =
        await _tutorApi.getTutorListByCriteriaSearch(request);

    return res;
  }

  Future<TutorInforDetailResponse> getTutorInformationBy(String id) async {
    final res = await _tutorApi.getTutorInformationBy(id);
    return res;
  }

  Future<FeedbackResponse> getFeedbackOfTutor(
      String userId, int perPage, int page) async {
    final res = await _tutorApi.getFeedbackOfTutor(userId, perPage, page);
    return res;
  }
}
