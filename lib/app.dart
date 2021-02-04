import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/blocs/github_repository_list_cubit.dart';
import 'package:github_repo/pages/home/page.dart';
import 'package:github_repo/repositories/github.repository/github.repository.dart';

class MyApp extends StatelessWidget {
  List<RepositoryProvider> _buildRepositories() {
    return [
      RepositoryProvider<GithubRepository>(create: (_) => GithubRepository())
    ];
  }

  List<BlocProvider> _buildBlocs() {
    return [
      BlocProvider<GithubRepositoryListCubit>(
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
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    color: Colors.white,
                    elevation: 0.7,
                    shadowColor: Color.fromRGBO(223, 223, 223, 1),
                    iconTheme: IconThemeData(color: Colors.black),
                    textTheme: TextTheme(
                        headline6: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w600))),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MyHomePage(title: 'Поиск'),
            )));
  }
}
