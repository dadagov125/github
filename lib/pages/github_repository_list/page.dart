import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/blocs/github_repository_list_cubit.dart';
import 'package:github_repo/pages/github_repository_list/repo_error.dart';
import 'package:github_repo/pages/github_repository_list/repo_list.dart';

class GithubRepositoryListPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => GithubRepositoryListPage());
  }

  @override
  State<StatefulWidget> createState() {
    return GithubRepositoryListPageState();
  }
}

class GithubRepositoryListPageState extends State<GithubRepositoryListPage> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    var position = scrollController.position;
    var maxScrollExtent = position.maxScrollExtent;

    var pixels = position.pixels;

    if (pixels >= maxScrollExtent) {
      var githubRepositoryListCubit = context.read<GithubRepositoryListCubit>();

      var state = githubRepositoryListCubit.state as GithubRepositoryListLoaded;
      if (state.list.items.length < state.list.total_count) {
        githubRepositoryListCubit.loadNextRepositoryList();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('РЕЗУЛЬТАТ ПОИСКА'),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: BlocBuilder<GithubRepositoryListCubit, GithubRepositoryListState>(
        builder: (context, state) {
          if (state is GithubRepositoryListError) {
            return RepoError(message: state.message);
          }

          if (state is GithubRepositoryListLoaded) {
            return RepoList(
              scrollController: scrollController,
              list: state.list,
              query: state.query,
            );
          }
          if (state is GithubRepositoryListLoading) {
            return LinearProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
