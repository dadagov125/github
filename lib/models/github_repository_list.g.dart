// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositoryList _$GithubRepositoryListFromJson(Map json) {
  return GithubRepositoryList(
    total_count: json['total_count'] as num,
    incomplete_results: json['incomplete_results'] as bool,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : GithubRepositiryModel.fromJson(e as Map))
        ?.toList(),
  );
}

Map<String, dynamic> _$GithubRepositoryListToJson(
        GithubRepositoryList instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'incomplete_results': instance.incomplete_results,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };
