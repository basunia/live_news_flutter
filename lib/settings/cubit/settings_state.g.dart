// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    SettingsState(
      localeId: json['localeId'] as int? ?? 0,
      themeId: json['themeId'] as int? ?? 0,
    );

Map<String, dynamic> _$SettingsStateToJson(SettingsState instance) =>
    <String, dynamic>{
      'localeId': instance.localeId,
      'themeId': instance.themeId,
    };
