import 'package:flutter/material.dart';
import 'package:github_repo/pages/github_repository_list/repo_item_star.dart';

class RepoItemHeader extends StatelessWidget {
  const RepoItemHeader({Key key, this.stargazersCount, this.name})
      : super(key: key);

  final num stargazersCount;

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        RepoItemStar(stargazersCount: stargazersCount)
      ],
    );
  }
}
