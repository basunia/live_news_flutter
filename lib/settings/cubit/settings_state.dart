// part of 'l10n_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'settings_state.g.dart';

@JsonSerializable()
class SettingsState extends Equatable {
  const SettingsState({this.localeId = 0, this.themeId = 0});
  final int localeId;
  final int themeId;

  SettingsState copyWith({int? localeId, int? themeId}) {
    return SettingsState(
        localeId: localeId ?? this.localeId, themeId: themeId ?? this.themeId);
  }

  factory SettingsState.fromJsom(json) => _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);

  @override
  List<Object> get props => [localeId, themeId];
}
