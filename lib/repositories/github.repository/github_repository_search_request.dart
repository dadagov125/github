class GithubRepositorySearchRequest {
  GithubRepositorySearchRequest(
      {this.query = '', this.per_page = 10, this.page = 0});

  final String query;
  final num per_page;
  final num page;
}
