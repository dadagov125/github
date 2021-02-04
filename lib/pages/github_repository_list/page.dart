import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/blocs/github_repository_list_cubit.dart';

class GithubRepositoryListPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => GithubRepositoryListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GithubRepositoryListCubit, GithubRepositoryListState>(
        builder: (context, state) {
          if (state is GithubRepositoryListError) {
            return Text('Error: ${state.message}');
          }
          if (state is GithubRepositoryListNexLoading) {
            return LinearProgressIndicator();
          }
          if (state is GithubRepositoryListLoaded) {
            var list = state.list;
            return ListView.builder(
                itemCount: list.items.length,
                itemBuilder: (context, index) {
                  var item = list.items[index];
                  return Text('${item.description}');
                });
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
