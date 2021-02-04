import 'package:flutter/material.dart';
import 'package:github_repo/pages/github_repository_list/repo_item_body.dart';
import 'package:github_repo/pages/github_repository_list/repo_item_bottom.dart';
import 'package:github_repo/pages/github_repository_list/repo_item_header.dart';

class RepoItem extends StatelessWidget {
  const RepoItem(
      {Key key,
      this.name,
      this.stargazersCount,
      this.avatarUrl,
      this.login,
      this.updated})
      : super(key: key);

  final String name;

  final num stargazersCount;

  final String avatarUrl;

  final String login;

  final String updated;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(223, 223, 223, 1))),
      child: Column(children: [
        RepoItemHeader(stargazersCount: stargazersCount, name: name),
        Padding(padding: EdgeInsets.only(top: 4)),
        RepoItemBody(login: login, avatarUrl: avatarUrl),
        Padding(padding: EdgeInsets.only(top: 8)),
        Divider(
          height: 0,
          indent: 0,
          endIndent: 0,
          thickness: 0,
        ),
        Padding(padding: EdgeInsets.only(top: 12)),
        RepoItemBottom(updated: updated)
      ]),
    );
  }
}
