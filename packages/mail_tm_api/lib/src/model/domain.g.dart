// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      id: json['id'] as String,
      domain: json['domain'] as String,
      isActive: json['isActive'] as bool? ?? false,
      isPrivate: json['isPrivate'] as bool? ?? false,
    );

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'id': instance.id,
      'domain': instance.domain,
      'isActive': instance.isActive,
      'isPrivate': instance.isPrivate,
    };
