import 'package:lettutor_flutter/data/model/tutor/CriteriaSearchRequest.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorInforDetailResponse.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_flutter/data/model/tutor/feedback/FeedbackResponse.dart';
import 'package:lettutor_flutter/data/network/constants/endpoints.dart';

import '../../dio_client.dart';

class TutorApi {
  // dio instance
  final DioClient _dioClient;

  TutorApi(this._dioClient);

  Future<TutorListResponse?> getListTutorWithPagination(
      int limit, int page) async {
    final res =
        await _dioClient.get(Endpoints.getListTutorWithPagination(limit, page));
    return TutorListResponse.fromJson(res);
  }

  Future<TutorListResponse?> getTutorListByCriteriaSearch(
      CriteriaSearchRequest request) async {
    final res =
        await _dioClient.post(Endpoints.searchTutor, data: request.toJson());

    return TutorListResponse.fromJson({"tutors": res});
  }

  Future<TutorInforDetailResponse> getTutorInformationBy(String id) async {
    final res = await _dioClient.get(Endpoints.getTutorInformationById(id));

    return TutorInforDetailResponse.fromJson(res);
  }

  Future<FeedbackResponse> getFeedbackOfTutor(
      String userId, int perPage, int page) async {
    final res =
        await _dioClient.get(Endpoints.getTutorFeedback(userId, perPage, page));

    return FeedbackResponse.fromJson(res);
  }
}
