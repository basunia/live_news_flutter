import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/news/view/news_item.dart';
import 'package:mail_automation/news/widget/news_loader.dart';
import 'package:mail_repository/mail_repository.dart';

import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';

// class NewsPage extends StatelessWidget {
//   const NewsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return BlocProvider(
//     //   create: (context) =>
//     //       NewsBloc(mailRepository: context.read<MailRepository>())
//     //         ..add(NewsFechRequested()),
//     //   child: const NewsPageView(),
//     // );
//   }
// }

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<NewsBloc>()
        .add(const NewsFechRequested(fetchType: FetchType.onStartUp));
  }

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
            case NewsStatus.success:
              debugPrint(state.news.toString());
              // return Text('first news ${state.news.first}');
              if (state.news.isEmpty) return const Text('No news found!');
              return ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, i) {
                    return NewsItem(newsItem: state.news[i], index: (i + 1));
                  });
            default:
              return const Text('No news found!');
          }
        },
      ),
    );
  }
}
