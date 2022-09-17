import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mail_repository/mail_repository.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

import 'news_state.dart';

part 'news_event.dart';
// part 'news_state.dart';

class NewsBloc extends HydratedBloc<NewsEvent, NewsState> {
  NewsBloc({required MailRepository mailRepository})
      : _mailRepository = mailRepository,
        super(const NewsState()) {
    on<NewsFechRequested>(_onNewsFetchRequest);
  }

  final MailRepository _mailRepository;

  _onNewsFetchRequest(NewsFechRequested event, Emitter<NewsState> emit) async {
    if (event.fetchType.isOnStartup && state.newsStatus.isSuccess) return;
    try {
      emit(state.copyWith(newsStatus: NewsStatus.loading));
      final news = await _mailRepository.getNews();
      emit(state.copyWith(news: news, newsStatus: NewsStatus.success));
    } on NewsRequestFailure {
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(newsStatus: NewsStatus.failure));
    }
  }

  @override
  NewsState? fromJson(Map<String, dynamic> json) => NewsState.fromJson(json);
  @override
  Map<String, dynamic>? toJson(NewsState state) => state.toJson();
}
