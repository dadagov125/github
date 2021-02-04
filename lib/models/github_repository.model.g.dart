// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositiryModel _$GithubRepositiryModelFromJson(Map json) {
  return GithubRepositiryModel(
    id: json['id'] as num,
    node_id: json['node_id'] as String,
    name: json['name'] as String,
    full_name: json['full_name'] as String,
    owner: json['owner'],
    private: json['private'] as bool,
    html_url: json['html_url'] as String,
    description: json['description'] as String,
    fork: json['fork'] as bool,
    url: json['url'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    pushed_at: json['pushed_at'] as String,
    homepage: json['homepage'] as String,
    size: json['size'] as num,
  );
}

Map<String, dynamic> _$GithubRepositiryModelToJson(
        GithubRepositiryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.node_id,
      'name': instance.name,
      'full_name': instance.full_name,
      'owner': instance.owner,
      'private': instance.private,
      'html_url': instance.html_url,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'pushed_at': instance.pushed_at,
      'homepage': instance.homepage,
      'size': instance.size,
    };
