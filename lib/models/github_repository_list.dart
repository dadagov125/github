import 'package:github_repo/models/github_repository.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository_list.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class GithubRepositoryList {
  GithubRepositoryList({this.total_count, this.incomplete_results, this.items});

  final num total_count;
  final bool incomplete_results;
  final List<GithubRepositiryModel> items;

  factory GithubRepositoryList.fromJson(Map json) =>
      _$GithubRepositoryListFromJson(json);

  Map toJson() => _$GithubRepositoryListToJson(this);
}
