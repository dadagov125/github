import 'package:flutter/material.dart';

class RepoItemBody extends StatelessWidget {
  const RepoItemBody({Key key, this.avatarUrl, this.login}) : super(key: key);

  final String avatarUrl;

  final String login;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          child: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8)),
        Text(login)
      ],
    );
  }
}
