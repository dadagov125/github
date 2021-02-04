import 'package:flutter/material.dart';

class RepoError extends StatelessWidget {
  const RepoError({Key key, this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      child: Text('Error: ${message}'),
    );
  }
}
