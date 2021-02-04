import 'package:flutter/material.dart';
import 'package:github_repo/app_colors.dart';

class RepoListHeader extends StatelessWidget {
  const RepoListHeader({Key key, this.totalCount, this.query})
      : super(key: key);
  final num totalCount;

  final String query;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 19)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ПО ЗАПСРОСУ:',
                style: TextStyle(fontSize: 10, color: AppColors.second_gray),
              ),
              Padding(padding: EdgeInsets.only(left: 2)),
              Text(
                '"${query}"',
                style: TextStyle(fontSize: 10, color: AppColors.main_blue),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8)),
          Text('НАЙДЕНО: ${totalCount}',
              style: TextStyle(fontSize: 10, color: AppColors.second_gray))
        ],
      ),
    );
  }
}
