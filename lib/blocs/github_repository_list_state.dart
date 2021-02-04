part of 'github_repository_list_cubit.dart';

@immutable
abstract class GithubRepositoryListState {}

class GithubRepositoryListInitial extends GithubRepositoryListState {}

class GithubRepositoryListLoading extends GithubRepositoryListState {
  GithubRepositoryListLoading(this.query);

  final String query;
}

class GithubRepositoryListLoaded extends GithubRepositoryListLoading {
  GithubRepositoryListLoaded(String query, this.list) : super(query);

  final GithubRepositoryList list;
}

class GithubRepositoryListNexLoading extends GithubRepositoryListLoaded {
  GithubRepositoryListNexLoading(String query, GithubRepositoryList list)
      : super(query, list);
}

class GithubRepositoryListError extends GithubRepositoryListLoading {
  GithubRepositoryListError(String query, this.message) : super(query);

  final String message;
}
