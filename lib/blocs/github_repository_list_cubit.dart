import 'package:bloc/bloc.dart';
import 'package:github_repo/exceptions/app.exception.dart';
import 'package:github_repo/models/github_repository_list.dart';
import 'package:github_repo/repositories/github.repository/github.repository.dart';
import 'package:github_repo/repositories/github.repository/github_repository_search_request.dart';
import 'package:meta/meta.dart';

part 'github_repository_list_state.dart';

class GithubRepositoryListCubit extends Cubit<GithubRepositoryListState> {
  GithubRepositoryListCubit(this.githubRepository)
      : super(GithubRepositoryListInitial());

  final GithubRepository githubRepository;

  loadRepositoryList() async {
    emit(GithubRepositoryListLoading());
    await _loadRepositoryList(GithubRepositorySearchRequest());
  }

  loadNextRepositoryList(String query, num skip, num take) async {
    await _loadRepositoryList(GithubRepositorySearchRequest());
  }

  _loadRepositoryList(GithubRepositorySearchRequest request) async {
    try {
      var repositoryList = await githubRepository.getAll(request: request);
      emit(GithubRepositoryListLoaded(repositoryList));
    } on AppException catch (e) {
      emit(GithubRepositoryListError(e.toString()));
    }
  }
}
