part of 'news_bloc.dart';

extension FetchTypX on FetchType {
  bool get isOnStartup => this == FetchType.onStartUp;
  bool get isOnPagination => this == FetchType.onPagination;
  bool get isOnRefresh => this == FetchType.onRefresh;
}

enum FetchType { onStartUp, onPagination, onRefresh }

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsFechRequested extends NewsEvent {
  const NewsFechRequested({required this.fetchType});
  final FetchType fetchType;
}
