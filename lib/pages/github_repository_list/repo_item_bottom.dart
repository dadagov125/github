import 'package:flutter/material.dart';

class RepoItemBottom extends StatelessWidget {
  const RepoItemBottom({Key key, this.updated}) : super(key: key);
  final String updated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Обновлено:',
          style: TextStyle(fontSize: 10),
        ),
        Padding(padding: EdgeInsets.only(left: 2)),
        Text(updated, style: TextStyle(fontSize: 10))
      ],
    );
  }
}
