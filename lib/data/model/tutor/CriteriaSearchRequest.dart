import 'Filters.dart';

class CriteriaSearchRequest {
  CriteriaSearchRequest({
    this.filters,
    this.search,
    this.page,
    this.perPage,
  });

  CriteriaSearchRequest.fromJson(dynamic json) {
    filters =
    json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    search = json['search'];
    page = json['page'];
    perPage = json['perPage'];
  }

  Filters? filters;
  String? search;
  int? page;
  int? perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    final filters = this.filters;
    if (filters != null) {
      map['filters'] = filters.toJson();
    }
    if (search != null) {
      map['search'] = search;
    }
    map['page'] = page;
    map['perPage'] = perPage;
    return map;
  }
}
