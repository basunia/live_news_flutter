// part of 'news_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mail_tm_api/mail_tm_api.dart';
part 'news_state.freezed.dart';
part 'news_state.g.dart';

extension AuthStatusX on NewsStatus {
  bool get isInitial => this == NewsStatus.initial;
  bool get isLoading => this == NewsStatus.loading;
  bool get isSuccess => this == NewsStatus.success;
  bool get isFailure => this == NewsStatus.failure;
  bool get isNoConnection => this == NewsStatus.noConnection;
}

enum NewsStatus { initial, loading, success, failure, noConnection }

@freezed
class NewsState with _$NewsState {
  const factory NewsState(
      {@Default(<News>[]) List<News> news,
      @Default(NewsStatus.initial) NewsStatus newsStatus}) = _NewsState;

  factory NewsState.fromJson(Map<String, Object?> json) =>
      _$NewsStateFromJson(json);
}
