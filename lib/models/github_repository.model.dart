import 'package:json_annotation/json_annotation.dart';

part 'github_repository.model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class GithubRepositiryModel {
  GithubRepositiryModel(
      {this.id,
      this.node_id,
      this.name,
      this.full_name,
      this.owner,
      this.private,
      this.html_url,
      this.description,
      this.fork,
      this.url,
      this.created_at,
      this.updated_at,
      this.pushed_at,
      this.homepage,
      this.size});

  final num id;
  final String node_id;
  final String name;
  final String full_name;
  final dynamic owner;
  final bool private;
  final String html_url;
  final String description;
  final bool fork;
  final String url;
  final String created_at;
  final String updated_at;
  final String pushed_at;
  final String homepage;
  final num size;

  factory GithubRepositiryModel.fromJson(Map json) =>
      _$GithubRepositiryModelFromJson(json);

  Map toJson() => _$GithubRepositiryModelToJson(this);
}
