import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/blocs/github_repository_list_cubit.dart';
import 'package:github_repo/pages/home/page.dart';
import 'package:github_repo/repositories/github.repository/github.repository.dart';

class MyApp extends StatelessWidget {
  List<RepositoryProvider> _buildRepositories() {
    return [RepositoryProvider(create: (_) => GithubRepository())];
  }

  List<BlocProvider> _buildBlocs() {
    return [
      BlocProvider(
          create: (context) =>
              GithubRepositoryListCubit(context.read<GithubRepository>()))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: _buildRepositories(),
        child: MultiBlocProvider(
            providers: _buildBlocs(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
            )));
  }
}
