import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/blocs/github_repository_list_cubit.dart';
import 'package:github_repo/pages/github_repository_list/page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 84),
              height: 50,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    suffixIcon: Container(
                      margin: EdgeInsets.only(right: 4, top: 4, bottom: 4),
                      width: 100,
                      height: 42,
                      child: RaisedButton(
                        color: Color.fromRGBO(88, 175, 255, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide.none),
                        onPressed: () {
                          var githubRepositoryListCubit =
                              context.read<GithubRepositoryListCubit>();

                          githubRepositoryListCubit
                              .loadRepositoryList(controller.text);

                          Navigator.of(context)
                              .push(GithubRepositoryListPage.route());
                        },
                        child: Text(
                          'Найти',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
                        borderRadius: BorderRadius.circular(50)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
                        borderRadius: BorderRadius.circular(50)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
                        borderRadius: BorderRadius.circular(50))),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
