import 'package:flutter/material.dart';
import 'package:github_repo/models/github_repository_list.dart';
import 'package:github_repo/pages/github_repository_list/repo_item.dart';
import 'package:github_repo/pages/github_repository_list/repo_list_header.dart';
import 'package:intl/intl.dart';

class RepoList extends StatelessWidget {
  const RepoList({Key key, this.query, this.list, this.scrollController})
      : super(key: key);

  final GithubRepositoryList list;
  final String query;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd MMM');

    return ListView.builder(
        controller: scrollController,
        itemCount: list.items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return RepoListHeader(query: query, totalCount: list.total_count);
          }
          index -= 1;
          var item = list.items[index];

          var updated = dateFormat.format(DateTime.parse(item.updated_at));

          var avatar_url = item.owner.avatar_url;
          var login = item.owner.login;
          var stargazers_count = item.stargazers_count;
          var name = item.name;

          return RepoItem(
            name: name,
            login: login,
            avatarUrl: avatar_url,
            stargazersCount: stargazers_count,
            updated: updated,
          );
        });
  }
}
