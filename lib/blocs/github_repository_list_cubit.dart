import 'package:bloc/bloc.dart';
import 'package:github_repo/models/github_repository.model.dart';
import 'package:github_repo/models/github_repository_list.dart';
import 'package:github_repo/repositories/github.repository/github.repository.dart';
import 'package:github_repo/repositories/github.repository/github_repository_search_request.dart';
import 'package:meta/meta.dart';

part 'github_repository_list_state.dart';

class GithubRepositoryListCubit extends Cubit<GithubRepositoryListState> {
  GithubRepositoryListCubit(this.githubRepository)
      : super(GithubRepositoryListInitial());

  final GithubRepository githubRepository;

  loadRepositoryList(String query) async {
    emit(GithubRepositoryListLoading(query));
    await _loadRepositoryList(GithubRepositorySearchRequest(query: query));
  }

  loadNextRepositoryList() async {
    if (state is GithubRepositoryListLoaded) {
      var loadedState = state as GithubRepositoryListLoaded;
      emit(GithubRepositoryListNexLoading(loadedState.query, loadedState.list));
      await _loadRepositoryList(
          GithubRepositorySearchRequest(
              query: loadedState.query, page: loadedState.list.items.length),
          skippedItems: loadedState.list.items);
    }
  }

  _loadRepositoryList(GithubRepositorySearchRequest request,
      {List<GithubRepositiryModel> skippedItems = const []}) async {
    try {
      var repositoryList = await githubRepository.getAll(request: request);

      var total_count = repositoryList.total_count;
      var incomplete_results = repositoryList.incomplete_results;

      final items = [...skippedItems, ...repositoryList.items];

      emit(GithubRepositoryListLoaded(
          request.query,
          GithubRepositoryList(
              total_count: total_count,
              incomplete_results: incomplete_results,
              items: items)));
    } catch (e) {
      emit(GithubRepositoryListError(request.query, e.toString()));
    }
  }
}
