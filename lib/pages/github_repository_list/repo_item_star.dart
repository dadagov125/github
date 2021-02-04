import 'package:flutter/material.dart';
import 'package:github_repo/app_colors.dart';

class RepoItemStar extends StatelessWidget {
  const RepoItemStar({Key key, this.stargazersCount}) : super(key: key);
  final num stargazersCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      constraints: BoxConstraints(
        minWidth: 45,
      ),
      padding: EdgeInsets.only(left: 7, right: 7),
      decoration: BoxDecoration(
        color: AppColors.second_gray,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star_border,
            size: 16,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.only(left: 2)),
          Text(
            '${stargazersCount}',
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
    );
  }
}
