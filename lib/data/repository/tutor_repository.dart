import 'package:lettutor_flutter/data/model/tutor/CriteriaSearchRequest.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/tutor_api.dart';

class TutorRepository {
  final TutorApi _tutorApi;

  TutorRepository(this._tutorApi);

  Future<TutorResponse?> getTutorList(int limit, int pageNumber) async {
    TutorResponse? res =
        await _tutorApi.getListTutorWithPagination(limit, pageNumber);

    return res;
  }

  Future<TutorResponse?> getTutorListBy(CriteriaSearchRequest request) async {
    TutorResponse? res = await _tutorApi.getTutorListByCriteriaSearch(request);

    return res;
  }
}
