import 'dart:convert' as convert;

import 'package:github_repo/exceptions/app.exception.dart';
import 'package:github_repo/globals.dart';
import 'package:github_repo/models/github_repository_list.dart';
import 'package:github_repo/repositories/github.repository/github_repository_search_request.dart';
import 'package:http/http.dart' as http;

class GithubRepository {
  final String url = '${githubApi}/search/repositories';

  Future<GithubRepositoryList> getAll(
      {GithubRepositorySearchRequest request}) async {
    String params = _buildParams(request);

    Map<String, String> headers = {'Accept': 'application/vnd.github.v3+json'};

    var response = await http.get('${url}${params}', headers: headers);
    _checkResponseStatus(response);
    var map = _decodeResponseBody(response);
    var list = GithubRepositoryList.fromJson(map);
    return list;
  }

  String _buildParams(GithubRepositorySearchRequest request) {
    String params = '';
    if (request != null) {
      params =
          '?${request.query.isNotEmpty ? 'q=${request.query}' : ''}&per_page=${request.per_page}&page=${request.page}';
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
    if (statusCode == 404) {
      throw AppException('Not Found');
    }
    if (statusCode == 403) {
      throw AppException('Rate limit exceeded');
    }
  }

  Map _decodeResponseBody(http.Response response) {
    return convert.jsonDecode(response.body);
  }
}
