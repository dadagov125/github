part of 'github_repository_list_cubit.dart';

@immutable
abstract class GithubRepositoryListState {}

class GithubRepositoryListInitial extends GithubRepositoryListState {}

class GithubRepositoryListLoading extends GithubRepositoryListState {}

class GithubRepositoryListLoaded extends GithubRepositoryListState {
  GithubRepositoryListLoaded(this.list);

  final GithubRepositoryList list;
}

class GithubRepositoryListError extends GithubRepositoryListState {
  GithubRepositoryListError(this.message);

  final String message;
}
