import 'package:json_annotation/json_annotation.dart';

part 'github_user.model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class GithubUserModel {
  GithubUserModel(
      {this.login, this.id, this.node_id, this.avatar_url, this.url});

  final String login;
  final num id;
  final String node_id;
  final String avatar_url;
  final String url;

  factory GithubUserModel.fromJson(Map json) => _$GithubUserModelFromJson(json);

  Map toJson() => _$GithubUserModelToJson(this);
}
