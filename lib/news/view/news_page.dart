import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/news/widget/news_loader.dart';
import 'package:mail_repository/mail_repository.dart';

import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(mailRepository: context.read<MailRepository>())
            ..add(NewsFechRequested()),
      child: const NewsPageView(),
    );
  }
}

class NewsPageView extends StatelessWidget {
  const NewsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News page'),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.newsStatus) {
            case NewsStatus.initial:
            case NewsStatus.loading:
              return const NewsLoader();
            default:
              debugPrint(state.news.toString());
              return Text('first news ${state.news.first}');
          }
        },
      ),
    );
  }
}
