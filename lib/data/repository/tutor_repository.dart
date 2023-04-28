import 'package:lettutor_flutter/data/model/tutor/Rows.dart';
import 'package:lettutor_flutter/data/model/tutor/TutorResponse.dart';
import 'package:lettutor_flutter/data/network/apis/authentication/tutor_api.dart';

class TutorRepository {
  final TutorApi _tutorApi;

  TutorRepository(this._tutorApi);

  Future<List<Tutor>?> getTutorList(int limit, int pageNumber) async {
    TutorResponse? res =
        await _tutorApi.getListTutorWithPagination(limit, pageNumber);
    if (res != null && res.tutors != null) {
      return res.tutors?.rows;
    }

    return null;
  }
}
