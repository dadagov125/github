import 'dart:convert' as convert;

import 'package:github_repo/exceptions/app.exception.dart';
import 'package:github_repo/globals.dart';
import 'package:github_repo/models/github_repository_list.dart';
import 'package:github_repo/repositories/github.repository/github_repository_search_request.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  final String url = '${githubApi}/search';

  Future<GithubRepositoryList> getAll(
      {GithubRepositorySearchRequest request}) async {
    String params = _buildParams(request);
    var response = await http.get(url);
    _checkResponseStatus(response);
    var map = _decodeResponseBody(response);
    return GithubRepositoryList.fromJson(map);
  }

  String _buildParams(GithubRepositorySearchRequest request) {
    String params = '';
    if (request != null) {
      params =
          '?q=${request.query}&per_page=${request.per_page}&page=${request.page}';
    }
    return params;
  }

  _checkResponseStatus(http.Response response) {
    var statusCode = response.statusCode;
    if (statusCode == 304) {
      throw AppException('Not Modified');
    }
    if (statusCode == 422) {
      throw AppException('Unprocessable Entity');
    }
    if (statusCode == 503) {
      throw AppException('Service Unavailable');
    }
  }

  Map _decodeResponseBody(http.Response response) {
    return convert.jsonDecode(response.body);
  }
}
