// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsState _$$_NewsStateFromJson(Map<String, dynamic> json) => _$_NewsState(
      news: (json['news'] as List<dynamic>?)
              ?.map((e) => News.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      newsStatus:
          $enumDecodeNullable(_$NewsStatusEnumMap, json['newsStatus']) ??
              NewsStatus.initial,
    );

Map<String, dynamic> _$$_NewsStateToJson(_$_NewsState instance) =>
    <String, dynamic>{
      'news': instance.news,
      'newsStatus': _$NewsStatusEnumMap[instance.newsStatus]!,
    };

const _$NewsStatusEnumMap = {
  NewsStatus.initial: 'initial',
  NewsStatus.loading: 'loading',
  NewsStatus.success: 'success',
  NewsStatus.failure: 'failure',
  NewsStatus.noConnection: 'noConnection',
};
