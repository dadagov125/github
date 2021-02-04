import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/blocs/github_repository_list_cubit.dart';
import 'package:intl/intl.dart';

class GithubRepositoryListPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => GithubRepositoryListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GithubRepositoryListCubit, GithubRepositoryListState>(
        builder: (context, state) {
          if (state is GithubRepositoryListError) {
            return Text('Error: ${state.message}');
          }
          if (state is GithubRepositoryListNexLoading) {
            return LinearProgressIndicator();
          }
          if (state is GithubRepositoryListLoaded) {
            var list = state.list;
            var dateFormat = DateFormat(
              'dd MMM',
            );

            return ListView.builder(
                itemCount: list.items.length,
                itemBuilder: (context, index) {
                  var item = list.items[index];

                  var updated =
                      dateFormat.format(DateTime.parse(item.updated_at));

                  var avatar_url = item.owner.avatar_url;
                  var login = item.owner.login;
                  var stargazers_count = item.stargazers_count;
                  var name = item.name;

                  return Container(
                    height: 109,
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    padding: EdgeInsets.only(left: 16, right: 16, top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromRGBO(223, 223, 223, 1))),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${name}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 24,
                            constraints: BoxConstraints(
                              minWidth: 45,
                            ),
                            padding: EdgeInsets.only(left: 7, right: 7),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(166, 166, 166, 1),
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
                                  '${stargazers_count}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 4)),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(avatar_url),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Text('${login}')
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Divider(
                        height: 0,
                        indent: 0,
                        endIndent: 0,
                        thickness: 0,
                      ),
                      Padding(padding: EdgeInsets.only(top: 12)),
                      Row(
                        children: [
                          Text(
                            'Обновлено:',
                            style: TextStyle(fontSize: 10),
                          ),
                          Padding(padding: EdgeInsets.only(left: 2)),
                          Text('${updated}', style: TextStyle(fontSize: 10))
                        ],
                      )
                    ]),
                  );
                });
          }
          if (state is GithubRepositoryListLoading) {
            return LinearProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
