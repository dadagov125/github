// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUserModel _$GithubUserModelFromJson(Map json) {
  return GithubUserModel(
    login: json['login'] as String,
    id: json['id'] as num,
    node_id: json['node_id'] as String,
    avatar_url: json['avatar_url'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$GithubUserModelToJson(GithubUserModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'url': instance.url,
    };
