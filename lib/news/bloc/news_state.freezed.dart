// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsState _$NewsStateFromJson(Map<String, dynamic> json) {
  return _NewsState.fromJson(json);
}

/// @nodoc
mixin _$NewsState {
  List<News> get news => throw _privateConstructorUsedError;
  NewsStatus get newsStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res>;
  $Res call({List<News> news, NewsStatus newsStatus});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;

  @override
  $Res call({
    Object? news = freezed,
    Object? newsStatus = freezed,
  }) {
    return _then(_value.copyWith(
      news: news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      newsStatus: newsStatus == freezed
          ? _value.newsStatus
          : newsStatus // ignore: cast_nullable_to_non_nullable
              as NewsStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<News> news, NewsStatus newsStatus});
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, (v) => _then(v as _$_NewsState));

  @override
  _$_NewsState get _value => super._value as _$_NewsState;

  @override
  $Res call({
    Object? news = freezed,
    Object? newsStatus = freezed,
  }) {
    return _then(_$_NewsState(
      news: news == freezed
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      newsStatus: newsStatus == freezed
          ? _value.newsStatus
          : newsStatus // ignore: cast_nullable_to_non_nullable
              as NewsStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsState implements _NewsState {
  const _$_NewsState(
      {final List<News> news = const [], this.newsStatus = NewsStatus.initial})
      : _news = news;

  factory _$_NewsState.fromJson(Map<String, dynamic> json) =>
      _$$_NewsStateFromJson(json);

  final List<News> _news;
  @override
  @JsonKey()
  List<News> get news {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  @JsonKey()
  final NewsStatus newsStatus;

  @override
  String toString() {
    return 'NewsState(news: $news, newsStatus: $newsStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality()
                .equals(other.newsStatus, newsStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(newsStatus));

  @JsonKey(ignore: true)
  @override
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsStateToJson(
      this,
    );
  }
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final List<News> news, final NewsStatus newsStatus}) = _$_NewsState;

  factory _NewsState.fromJson(Map<String, dynamic> json) =
      _$_NewsState.fromJson;

  @override
  List<News> get news;
  @override
  NewsStatus get newsStatus;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
